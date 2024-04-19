/// <summary>
/// PageExtension PayMenthMethod (ID 80001) extends Record Payment Methods.
/// </summary>
pageextension 80001 PayMenthMethod extends "Payment Methods"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field("CCC No."; Rec."CCC No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
