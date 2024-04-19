Table 50001 "Pedidos Cliente"
{
    FIELDS
    {
        field(1; Secuencia; Integer) { }
        field(2; Pedido; Text[30]) { }
        field(3; Fecha; Date) { }
        field(4; Cliente; Text[30]) { }
        field(5; Articulo; Text[30]) { }
        field(6; Descripcion; Text[250]) { }
        field(7; Cantidad; Decimal) { }
        field(8; Replicacion; Integer) { }
        field(9; Recurso; Text[30]) { }
        field(10; GUID; Text[250]) { }
        field(11; Precio; Decimal) { }
        field(12; Repcon; Text[30]) { }
        field(13; "Documento Externo"; Text[30]) { }
        field(14; Garantia; Boolean) { }
        field(15; Crear; Boolean) { }
    }
    KEYS
    {
        key(Pk; Secuencia) { Clustered = true; }
    }

}

