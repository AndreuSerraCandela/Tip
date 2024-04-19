/// <summary>
/// PageExtension CompanyInformation (ID 80000) extends Record Company Information.
/// </summary>
pageextension 80000 CompanyInformation extends "Company Information"
{
    layout
    {
        addlast(Communication)
        {
            field("Logo Cesce"; Rec."Logo Cesce")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                end;
            }
            field(Picture2; Rec.Picture2)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                end;
            }
        }
        addlast(Payments)
        {
            field(Picture3; Rec.Picture2)
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    CurrPage.SaveRecord();
                end;

            }
        }

    }
}
