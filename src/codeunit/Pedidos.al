Codeunit 50002 "Pedidos Valorados"
{
    trigger OnRun()
    BEGIN
        SalesShipmentLine.SETRANGE("Document No.", '78301');
        IF SalesShipmentLine.FINDFIRST() THEN BEGIN
            SalesHeader.GET(SalesHeader."Document Type"::Order, SalesShipmentLine."Order No.");
            SalesHeader."Sell-to Customer No." := SalesShipmentLine."Sell-to Customer No.";
            SalesHeader."Bill-to Customer No." := SalesShipmentLine."Sell-to Customer No.";
            SalesHeader.MODIFY;
            REPEAT
                SalesShipmentLine."Bill-to Customer No." := SalesShipmentLine."Sell-to Customer No.";
                SalesShipmentLine.MODIFY;
                SalesLine.GET(SalesLine."Document Type"::Order, SalesShipmentLine."Order No.", SalesShipmentLine."Order Line No.");
                SalesLine."Sell-to Customer No." := SalesShipmentLine."Sell-to Customer No.";
                SalesLine."Bill-to Customer No." := SalesShipmentLine."Sell-to Customer No.";
                SalesLine.MODIFY;
            UNTIL SalesShipmentLine.NEXT = 0;
        END;
    END;


    VAR
        SalesLine: Record 37;
        SalesHeader: Record 36;
        SalesShipmentLine: Record 111;
        FORMULAPS: TextConst ENU = 'CW', ESP = 'PS';
        FORMULAPS1: TextConst ENU = 'CW+1D', ESP = 'PS+1D';
        FORMULAPS2: TextConst ENU = 'CW-2D', ESP = 'PS-2D';

    PROCEDURE Valorar(npedido: Code[100];
        cliente: Code[20]; VAR valorar: Text[30]; VAR valor: Text[30]): Text[30];
    VAR
        rPedido: Record 50001;
        rCab: Record 36;
        rDet: Record 37;
        a: Integer;
        val: Decimal;
        wPedido: Text;
        ItemCrossReference: Record "Item Reference";// 5717;
    BEGIN
        IF valorar = 'ELIMINAR' THEN BEGIN
            valor := '0';
            valorar := 'OK';
            rPedido.SETRANGE(rPedido.Pedido, npedido);
            rPedido.SETRANGE(rPedido.Cliente, cliente);
            IF rPedido.FINDLAST THEN BEGIN
                rCab.SETRANGE("External Document No.", rPedido."Documento Externo");
                IF rCab.FINDLAST THEN BEGIN
                    rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
                    rDet.SETRANGE("Document No.", rCab."No.");
                    rDet.DELETEALL;
                    rCab.DELETE;
                END;
            END;
            rPedido.SETRANGE(rPedido.Pedido, npedido);
            rPedido.SETRANGE(rPedido.Cliente, cliente);
            rPedido.DELETEALL;
            EXIT;
        END;
        IF valorar = 'BORRAR' THEN BEGIN
            IF NOT rCab.GET(rCab."Document Type"::Order, npedido) THEN BEGIN
                valorar := 'NO OK Error: Pedido no encontrado';
                valor := '0';
                EXIT;
            END;
            valorar := 'OK';
            rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
            rDet.SETRANGE("Document No.", rCab."No.");
            rDet.DELETEALL;
            rCab.DELETE;
            rPedido.SETRANGE(rPedido.Pedido, npedido);
            rPedido.SETRANGE(rPedido.Cliente, cliente);
            rPedido.DELETEALL;
            EXIT;
        END;

        rPedido.SETRANGE(rPedido.Pedido, npedido);
        rPedido.SETRANGE(rPedido.Cliente, cliente);
        IF NOT rPedido.FINDFIRST THEN BEGIN
            valorar := 'NO OK Error: Pedido no encontrado';
            valor := '0';
            EXIT;
        END;
        IF valorar = 'CONVERTIR' THEN BEGIN
            IF NOT rCab.GET(rCab."Document Type"::Order, npedido) THEN BEGIN
                valorar := 'NO OK Error: Pedido no encontrado';
                valor := '0';
                EXIT;
            END;
            valorar := 'OK';
            rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
            rDet.SETRANGE("Document No.", rCab."No.");
            IF rDet.FINDFIRST THEN
                REPEAT
                    val := val + rDet."Line Amount";
                    valor := FORMAT(val, 0, '<Precision,2:2><Standard Format,0>');
                UNTIL rPedido.NEXT = 0;
            rCab."Pedido Web En Curso" := FALSE;
            rCab.MODIFY;
            EXIT;
        END;
        wPedido := npedido;
        rPedido.SETRANGE(rPedido.Pedido, wPedido);
        rPedido.SETRANGE(rPedido.Cliente, cliente);
        IF NOT rPedido.FINDFIRST THEN BEGIN
            valorar := 'NO OK Error: Pedido no encontrado';
            valor := '0';
            EXIT;
        END;
        DevuelvePedido(npedido);
        rCab.GET(rCab."Document Type"::Order, npedido);
        rCab.VALIDATE(rCab."Sell-to Customer No.", cliente);
        rCab."Pedido Web En Curso" := TRUE;
        rCab."Order Date" := rPedido.Fecha;
        rCab."Posting Date" := rPedido.Fecha;
        rCab."Your Reference" := npedido;
        rCab."Tipo pedido" := rCab."Tipo pedido"::Web;
        rCab."Transaction Specification" := 'WEB';
        rCab."Pedido Web En Curso" := FALSE;
        rCab.MODIFY;
        ////
        a := 0;
        REPEAT
            rDet."Document Type" := rDet."Document Type"::Order;
            rDet."Document No." := rCab."No.";
            a := a + 10000;
            rDet."Line No." := a;
            rDet.INSERT(TRUE);
            IF rPedido.Articulo <> '' THEN BEGIN
                rDet.Type := rDet.Type::Item;


                rDet.VALIDATE("No.", rPedido.Articulo);
                ItemCrossReference.SETRANGE("Reference Type", ItemCrossReference."Reference Type"::Customer);
                ItemCrossReference.SETRANGE("Item No.", rDet."No.");
                IF ItemCrossReference.FINDFIRST THEN BEGIN
                    rDet."Item Reference Unit of Measure" := ItemCrossReference."Unit of Measure";
                    rDet."Item Reference Type" := ItemCrossReference."Reference Type";
                    rDet."Item Reference Type No." := ItemCrossReference."Reference Type No.";
                    rDet."Item Reference No." := ItemCrossReference."Reference No.";
                    IF ItemCrossReference.Description <> '' THEN
                        rDet.Description := ItemCrossReference.Description;
                END;
            END ELSE BEGIN
                IF rPedido.Recurso <> '' THEN BEGIN
                    rDet.Type := rDet.Type::Resource;
                    rDet.VALIDATE("No.", rPedido.Recurso);
                END;
            END;
            rDet.VALIDATE(Quantity, rPedido.Cantidad);
            rDet."Descripción completa" := rPedido.Descripcion;
            rDet.Description := rPedido.Descripcion;
            IF rPedido.Precio <> 0 THEN
                rDet.VALIDATE("Unit Price", rPedido.Precio);
            val := val + rDet."Line Amount";
            valor := FORMAT(val, 0, '<Precision,2:2><Standard Format,0>');
            rDet.MODIFY;
        UNTIL rPedido.NEXT = 0;
        valorar := 'OK';
        rPedido.MODIFYALL(rPedido.Replicacion, 1);
        IF DATE2DWY(rCab."Order Date", 1) > 5 THEN rCab."Order Date" := CALCDATE(FORMULAPS2, rCab."Order Date");
        rCab."Promised Delivery Date" := CALCDATE('7D', rCab."Order Date");
        rCab."Requested Delivery Date" := rCab."Promised Delivery Date";
        IF DATE2DWY(rCab."Requested Delivery Date", 1) > 5 THEN
            rCab."Requested Delivery Date" := CALCDATE(FORMULAPS1, rCab."Requested Delivery Date");
        //   rCab."Ruta Fab":=FORMAT(DATE2DWY(rCab."Requested Delivery Date",1));
        //   IF rCab."Requested Delivery Date">CALCDATE(FORMULAPS,TODAY) THEN
        //      rCab."Ruta Fab":=FORMAT(DATE2DWY(rCab."Requested Delivery Date",1)+5);
        //   IF rCab."Requested Delivery Date"-TODAY<=1 THEN
        //      rCab."Ruta Fab":='';
        //   CASE rCab."Ruta Fab" OF
        //   '1' : rCab."Ruta Fab":='LUNES';
        //   '2' : rCab."Ruta Fab":='MARTES';
        //   '3' : rCab."Ruta Fab":='MIERCOLES';
        //   '4' : rCab."Ruta Fab":='JUEVES';
        //   '5' :rCab."Ruta Fab":='VIERNES';
        //   END;
        ///
        rCab.MODIFY;
    END;

    PROCEDURE DevuelvePedido(VAR nPedido: Code[20]);
    VAR
        rCab: Record 36;
    BEGIN
        rCab.INIT;
        rCab."Document Type" := rCab."Document Type"::Order;
        rCab."No." := '';
        rCab."Posting Date" := TODAY;
        rCab."Document Date" := TODAY;
        rCab."Pedido Web En Curso" := TRUE;
        rCab.INSERT(TRUE);
        nPedido := rCab."No.";
    END;

    PROCEDURE InsertaLinea(Secuencia: Integer; Pedido: Integer; Fecha: Date; Cliente: Text[30]; Articulo: Text[30]; Descripcion: Text[250]; Cantidad: Decimal): Text;
    VAR
        rPedido: Record 50001;
    BEGIN
        rPedido.INIT;
        rPedido.Secuencia := Secuencia;
        rPedido.Pedido := STRSUBSTNO('%1', Pedido);
        rPedido.Fecha := Fecha;
        rPedido.Cliente := Cliente;
        rPedido.Articulo := Articulo;
        rPedido.Descripcion := Descripcion;
        rPedido.Cantidad := Cantidad;
        rPedido.INSERT;
        EXIT('OK');
    END;

    PROCEDURE InsertaLineaNode(Secuencia: Text; Pedido: Text; Fecha: Text; Cliente: Text[30]; Articulo: Text[30]; Recurso: Text[30]; Descripcion: Text[250]; Cantidad: Decimal; Precio: Decimal; Garantia: Integer; Reccon: Text[30];
    DocExterno: Text[30]; Crear: Integer; Ultima: Integer): Text;
    VAR
        rPedido: Record 50001;
        Sec: Integer;
        valora: Text[30];
        valor: Text[30];
    BEGIN
        rPedido.SETRANGE(rPedido.GUID, Secuencia);
        IF rPedido.FINDFIRST THEN ERROR('Linea ya existe');
        rPedido.RESET;
        IF rPedido.FINDLAST THEN Sec := rPedido.Secuencia;
        Sec += 1;
        rPedido.INIT;
        rPedido.Secuencia := Sec;
        rPedido.Pedido := STRSUBSTNO('%1', Pedido);
        EVALUATE(rPedido.Fecha, Fecha);
        rPedido.Cliente := Cliente;
        rPedido.Recurso := Recurso;
        rPedido.Precio := Precio;
        rPedido.Articulo := Articulo;
        rPedido.Descripcion := Descripcion;
        rPedido.Cantidad := Cantidad;
        rPedido.GUID := Secuencia;
        rPedido.Repcon := Reccon;
        rPedido."Documento Externo" := DocExterno;
        IF Garantia = 1 THEN
            rPedido.Garantia := TRUE
        ELSE
            rPedido.Garantia := FALSE;
        IF Crear = 1 THEN
            rPedido.Crear := TRUE
        ELSE
            rPedido.Crear := FALSE;
        WHILE NOT rPedido.INSERT DO BEGIN
            Sec += 1;
            rPedido.Secuencia := Sec;
        END;
        valor := 'OK';
        IF Ultima = 1 THEN BEGIN
            valor := '0';
            valora := 'Valorar';
            COMMIT;
            ValorarNode(Pedido, Cliente, valora, valor);
        END;
        EXIT(valor);
    END;

    PROCEDURE ValorarNode(npedido: Text; cliente: Code[20]; VAR valorar: Text[30]; VAR valor: Text[30]): Text[30];
    VAR
        rPedido: Record 50001;
        rCab: Record 36;
        rDet: Record 37;
        a: Integer;
        val: Decimal;
        wPedido: Text;
        ItemCrossReference: Record "Item Reference";// 5717;
        Reccon: Code[20];
    BEGIN
        IF valorar = 'ELIMINAR' THEN BEGIN
            valor := '0';
            valorar := 'OK';
            IF rCab.GET(rCab."Document Type"::Order, npedido) THEN BEGIN
                rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
                rDet.SETRANGE("Document No.", rCab."No.");
                rDet.DELETEALL;
                rCab.DELETE;
            END;
            rPedido.SETRANGE(rPedido.Pedido, npedido);
            rPedido.SETRANGE(rPedido.Cliente, cliente);
            rPedido.DELETEALL;
            EXIT;
        END;
        IF valorar = 'BORRAR' THEN BEGIN
            IF NOT rCab.GET(rCab."Document Type"::Order, npedido) THEN BEGIN
                valorar := 'NO OK Error: Pedido no encontrado';
                valor := '0';
                EXIT;
            END;
            valorar := 'OK';
            rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
            rDet.SETRANGE("Document No.", rCab."No.");
            rDet.DELETEALL;
            rCab.DELETE;
            rPedido.SETRANGE(rPedido.Pedido, npedido);
            rPedido.SETRANGE(rPedido.Cliente, cliente);
            rPedido.DELETEALL;
            EXIT;
        END;

        rPedido.SETRANGE(rPedido.Pedido, npedido);
        rPedido.SETRANGE(rPedido.Cliente, cliente);
        IF NOT rPedido.FINDFIRST THEN BEGIN
            valorar := 'NO OK Error: Pedido no encontrado';
            valor := '0';
            EXIT;
        END;
        IF valorar = 'CONVERTIR' THEN BEGIN
            IF NOT rCab.GET(rCab."Document Type"::Order, npedido) THEN BEGIN
                valorar := 'NO OK Error: Pedido no encontrado';
                valor := '0';
                EXIT;
            END;
            valorar := 'OK';
            rDet.SETRANGE("Document Type", rDet."Document Type"::Order);
            rDet.SETRANGE("Document No.", rCab."No.");
            IF rDet.FINDFIRST THEN
                REPEAT
                    val := val + rDet."Line Amount";
                    valor := FORMAT(val, 0, '<Precision,2:2><Standard Format,0>');
                UNTIL rPedido.NEXT = 0;
            rCab."Pedido Web En Curso" := FALSE;
            rCab.MODIFY;
            EXIT;
        END;
        wPedido := npedido;
        rPedido.SETRANGE(rPedido.Pedido, wPedido);
        rPedido.SETRANGE(rPedido.Cliente, cliente);
        IF NOT rPedido.FINDFIRST THEN BEGIN
            valorar := 'NO OK Error: Pedido no encontrado';
            valor := '0';
            EXIT;
        END;
        DevuelvePedidoNode(npedido);
        rCab.GET(rCab."Document Type"::Order, npedido);
        rCab.VALIDATE(rCab."Sell-to Customer No.", cliente);
        rCab."Pedido Web En Curso" := TRUE;
        rCab."Order Date" := rPedido.Fecha;
        rCab."Posting Date" := rPedido.Fecha;
        rCab."External Document No." := rPedido."Documento Externo";
        rCab."Your Reference" := npedido;
        rCab."Tipo pedido" := rCab."Tipo pedido"::Web;
        rCab."Transaction Specification" := 'WEB';
        rCab."Pedido Web En Curso" := FALSE;
        rCab.MODIFY;
        ////
        a := 0;
        REPEAT
            rDet."Document Type" := rDet."Document Type"::Order;
            rDet."Document No." := rCab."No.";
            a := a + 10000;
            rDet."Line No." := a;
            rDet.INSERT(TRUE);
            IF rPedido.Articulo <> '' THEN BEGIN
                rDet.Type := rDet.Type::Item;
                rDet.VALIDATE("No.", rPedido.Articulo);

                ItemCrossReference.SETRANGE("Reference Type", ItemCrossReference."Reference Type"::Customer);
                ItemCrossReference.SETRANGE("Item No.", rDet."No.");
                IF ItemCrossReference.FINDFIRST THEN BEGIN
                    rDet."Item Reference Unit of Measure" := ItemCrossReference."Unit of Measure";
                    rDet."Item Reference Type" := ItemCrossReference."Reference Type";
                    rDet."Item Reference Type No." := ItemCrossReference."Reference Type No.";
                    rDet."Item Reference No." := ItemCrossReference."Reference No.";
                    IF ItemCrossReference.Description <> '' THEN
                        rDet.Description := ItemCrossReference.Description;
                END;
            END ELSE BEGIN
                IF rPedido.Recurso <> '' THEN BEGIN
                    rDet.Type := rDet.Type::Resource;
                    rDet.VALIDATE("No.", rPedido.Recurso);
                END;
            END;
            rDet.VALIDATE(Quantity, rPedido.Cantidad);
            IF rPedido.Descripcion <> '' THEN
                rDet."Descripción completa" := rPedido.Descripcion;
            IF rPedido.Descripcion <> '' THEN
                rDet.Description := rPedido.Descripcion;
            IF rPedido.Precio <> 0 THEN
                rDet.VALIDATE("Unit Price", rPedido.Precio);
            IF rPedido.Garantia THEN rDet.VALIDATE("Unit Price", 0);
            val := val + rDet."Line Amount";
            Reccon := rPedido.Repcon;
            IF Reccon <> '' THEN rDet.ValidateShortcutDimCode(3, Reccon);
            valor := FORMAT(val, 0, '<Precision,2:2><Standard Format,0>');
            IF rPedido.Crear THEN rDet."Crear Producto" := TRUE;

            rDet.MODIFY;
        UNTIL rPedido.NEXT = 0;
        valorar := 'OK';
        rPedido.MODIFYALL(rPedido.Replicacion, 1);
        //   {IF DATE2DWY(rCab."Order Date",1)>5 THEN rCab."Order Date":=CALCDATE(FORMULAPS2,rCab."Order Date");
        //   rCab."Promised Delivery Date":=CALCDATE('7D',rCab."Order Date");
        //   rCab."Requested Delivery Date":=rCab."Promised Delivery Date";
        //   IF DATE2DWY(rCab."Requested Delivery Date",1)>5 THEN
        //     rCab."Requested Delivery Date":=CALCDATE(FORMULAPS1,rCab."Requested Delivery Date");
        //   rCab."Ruta Fab":=FORMAT(DATE2DWY(rCab."Requested Delivery Date",1));
        //   IF rCab."Requested Delivery Date">CALCDATE(FORMULAPS,TODAY) THEN
        //      rCab."Ruta Fab":=FORMAT(DATE2DWY(rCab."Requested Delivery Date",1)+5);
        //   IF rCab."Requested Delivery Date"-TODAY<=1 THEN
        //      rCab."Ruta Fab":='';
        //   CASE rCab."Ruta Fab" OF
        //   '1' : rCab."Ruta Fab":='LUNES';
        //   '2' : rCab."Ruta Fab":='MARTES';
        //   '3' : rCab."Ruta Fab":='MIERCOLES';
        //   '4' : rCab."Ruta Fab":='JUEVES';
        //   '5' :rCab."Ruta Fab":='VIERNES';
        //   END;}
        ///
        rCab.MODIFY;
    END;

    PROCEDURE DevuelvePedidoNode(VAR nPedido: Text);
    VAR
        rCab: Record 36;
    BEGIN
        rCab.INIT;
        rCab."Document Type" := rCab."Document Type"::Order;
        rCab."No." := '';
        rCab."Posting Date" := TODAY;
        rCab."Document Date" := TODAY;
        rCab."Pedido Web En Curso" := TRUE;
        rCab.INSERT(TRUE);
        nPedido := rCab."No.";
    END;


}


