/// <summary>
/// TableExtension PayMentMethod (ID 80001) extends Record Payment Method.
/// </summary>
tableextension 80001 PayMentMethod extends "Payment Method"
{
    fields
    {
        field(80000; "CCC No."; Text[100])
        {
            Caption = 'CCC';
            DataClassification = ToBeClassified;
        }
    }
}
