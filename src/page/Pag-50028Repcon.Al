page 50028 Repcon
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Dimension Value";
    SourceTableView = SORTING("Dimension Code", Code) WHERE("Dimension Code" = CONST('REPCON'));
    layout
    {
        area(Content)
        {
            repeater(Detalle)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Código';
                    ToolTip = 'Código';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Nombre';
                    ToolTip = 'Nombre';
                }
            }
        }
    }
}