tableextension 80000 CompanyInformation extends "Company Information"
{
    fields
    {
        field(80000; "Logo Cesce"; Blob)
        {
            Caption = 'Logo Cesce';
            SubType = Bitmap;

            DataClassification = ToBeClassified;
        }
        field(80001; Picture2; Blob)
        {
            Caption = 'Picture2';
            SubType = Bitmap;

            DataClassification = ToBeClassified;
        }
        field(80002; Picture3; Blob)
        {
            Caption = 'Picture3';
            SubType = Bitmap;

            DataClassification = ToBeClassified;
        }
    }
}
