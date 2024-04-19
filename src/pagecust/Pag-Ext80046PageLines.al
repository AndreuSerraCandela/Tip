pageextension 80046 SalesSubForm extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Crear Producto"; Rec."Crear Producto")
            {
                ApplicationArea = All;
                Caption = 'Crear Producto';
                ToolTip = 'Crear Producto';
            }

        }
    }
}