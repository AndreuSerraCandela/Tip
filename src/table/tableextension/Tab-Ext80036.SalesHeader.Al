tableextension 80036 SalesHeader extends "Sales header"
{
    fields
    {
        //{ 55000;  ;Pedido Web En Curso ;Boolean        }
        field(55000; "Pedido Web En Curso"; Boolean)
        {
            Caption = 'Pedido Web En Curso';
        }
        //{ 50016;  ;Tipo pedido         ;Option        ;OptionString=Telefono,Fax,Comercial,PDA,Web,Otros }
        field(50016; "Tipo pedido"; Enum "Tipo pedido")

        {

            Caption = 'Tipo pedido';
        }
    }
}