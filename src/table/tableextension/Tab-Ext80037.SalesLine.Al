tableextension 80037 SalesLine extends "Sales Line"
{
    fields
    {
        //{ 55000;  ;Pedido Web En Curso ;Boolean        }
        field(50701; "Descripción completa"; Text[250])
        {
            Caption = 'Descripción completa';
            trigger OnValidate()
            begin
                Description := CopyStr(Description, 1, MaxStrLen(Description));
                if StrLen("Descripción completa") > MaxStrLen(Description) then
                    "Description 2" := CopyStr(Description, MaxStrLen(Description) + 1, StrLen(Description));
            end;
        }
        modify("Description")
        {
            trigger OnAfterValidate()
            begin
                "Descripción completa" := CopyStr(Description + "Description 2", 1, MaxStrLen("Descripción completa"));
            end;
        }
        modify("Description 2")
        {
            trigger OnAfterValidate()
            begin
                "Descripción completa" := CopyStr(Description + "Description 2", 1, MaxStrLen("Descripción completa"));
            end;
        }
        field(53005; "Crear Producto"; Boolean)
        { }

    }
}