pageextension 80003 SalesOrderList extends "Sales Order List"
{

    layout
    {

        addafter("Amt. Ship. Not Inv. (LCY)")
        {
            field("Invoiced"; Rec.Invoiced)
            {
                ApplicationArea = all;

            }
        }

    }

    Trigger OnAfterGetRecord()
    begin
        if Rec."Amt. Ship. Not Inv. (LCY)" = 0.00 then
            Rec.Invoiced := True
        else
            Rec.Invoiced := false;


        Rec.Modify();

    end;
}