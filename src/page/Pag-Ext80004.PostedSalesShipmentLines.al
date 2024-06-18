pageextension 80004 PostedSalesShipmentLines extends "Posted Sales Shipment Lines"


{
    layout
    {
        addafter("Quantity Invoiced")
        {
            field("Invoiced"; Rec.Invoiced)
            {
                ApplicationArea = all;
            }
        }
    }
}
