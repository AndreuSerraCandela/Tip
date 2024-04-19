/// <summary>
/// PageExtension Cust (ID 80002) extends Record Customer Card.
/// </summary>
pageextension 80002 Cust extends "Customer Card"
{
    layout
    {
        addlast(Invoicing)
        {
            field("Valorar albarán"; Rec."Valorar albarán")
            {
                ApplicationArea = All;
            }
        }
    }
}
