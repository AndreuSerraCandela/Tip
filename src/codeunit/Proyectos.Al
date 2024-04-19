/// <summary>
/// Codeunit Alfresco (ID 50006).
/// </summary>
Codeunit 50001 Proyectos
{
    var

    trigger OnRun()
    var
    begin
    end;

    /// <summary>
    /// Ping.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    [ServiceEnabled]
    procedure Ping(json: Text): Text
    begin
        exit(json);
    end;

    /// <summary>
    /// newproyect.
    /// </summary>
    /// <param name="jsondata">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure newproyect(jsondata: Text): Text
    var
        Proyectos: Codeunit Proyectos;
        Ticket: Text;
        RestApi: Codeunit Restapi;
        RequestType: Option Get,patch,put,post,delete;
        Inf: Record "Company Information";
        Url: Text;
        Json: Text;
        JsonJob: JsonObject;
        JTokO: JsonToken;
        JTok: JsonToken;
        JFilename: JsonToken;
        JEstatus: JsonToken;
        JAdicional: JsonToken;
        Adicional: Text;
        Signed: Boolean;
        Contrato: Text;
        UrlAlfresco: Text;
        Respuesta: Text;
        Job: Record Job;
        Outs: OutStream;
        JsonTokenName: JsonToken;
    begin
        If Not JsonJob.ReadFrom(jsondata) then exit('No se puede ller el Jsom');
        Job.Init;
        //get name in JsonJob
        If JsonJob.Get('customerNo', JsonTokenName) Then
            Job."Bill-to Customer No." := JsonTokenName.AsValue().AsText();
        Job.Validate("Bill-to Customer No.");
        // description
        If JsonJob.Get('description', JsonTokenName) Then
            Job.Description := JsonTokenName.AsValue().AsText();
        Job.Insert(true);
        exit(Job."No.");


    end;



}