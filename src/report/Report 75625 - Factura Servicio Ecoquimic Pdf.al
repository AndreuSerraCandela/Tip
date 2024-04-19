report 75625 "Factura Servicio Ecoquimic Pdf"
{
    // -SAT 15/01/16 edaimiel - Saturno 2016.
    // //OJO ANDREU EDITA SIN ETIQUETAR
    // -002 04/04/17 cobon: Añadir filtro para imprimir solo las facturas
    // -003 02/05/17 cobon: Total bruto no tiene en cuenta abonos
    // -004 02/05/17 cobon: Modificar impresión descuentos
    // -005 02/10/17 17.3235 vespada: corregir fallo texto dirección envío y ordenar las lineas para que salga primero el total y luego la información del siguiente albaran.
    // -006 03/01/19 tsastre: Duplica importe total en la factura.
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/layout/Factura Servicio Ecoquimic Pdf.rdlc';



    dataset
    {
        dataitem(DatosGlobales; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            MaxIteration = 1;
            column(CompanyInfo2Picture; CompanyInfo2."Logo CESCE")
            {
            }
            column(CompanyInfoPicture; CompanyInfo1.Picture2)
            {
            }
            column(CompanyInfo3Picture; CompanyInfo3.Picture)
            {
            }
            column(ImprimirEnPdf; ImprimirenPDF)
            {
            }
        }
        dataitem("Sales Header"; "Service Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Order';
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(ShipmentMethodDescription; ShipmentMethod.Description)
            {
            }
            column(PaymentMethodDescription; PaymentMethod.Description)
            {
            }
            column(No_SalesHeader; "No.")
            {
            }
            column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            {
            }
            column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            {
            }
            column(PaymentMethodCaption; PaymentMethodCaptionLbl)
            {
            }
            column(HomePageCaption; HomePageCaptionLbl)
            {
            }
            column(EmailCaption; EmailCaptionLbl)
            {
            }
            column(DocumentDateCaption; DocumentDateCaptionLbl)
            {
            }
            column(AllowInvDiscCaption; AllowInvDiscCaptionLbl)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(SalesHeaderCopyText; g_txtTipoDocumento)
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegistrationNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(DocDate_SalesHeader; "Sales Header"."Posting Date")
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesHeader; "Sales Header"."VAT Registration No.")
                    {
                    }
                    column(ShipmentDate_SalesHeader; Format("Sales Header"."Posting Date"))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(SalesHeaderNo1; Doc)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_SalesHeader; ReferenceText)
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(PricesIncludVAT_SalesHeader; "Sales Header"."Prices Including VAT")
                    {
                    }
                    column(PageCaption; StrSubstNo(Text005, ''))
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo_SalesHeader; Format("Sales Header"."Prices Including VAT"))
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(OrderNoCaption; OrderNoCaptionLbl)
                    {
                    }
                    column(BilltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PricesIncludVAT_SalesHeaderCaption; "Sales Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {
                    }
                    column(Titulo_NumFax; TXT_NUM_FAX)
                    {
                    }
                    column(Comentarios; g_txtComentarios)
                    {
                    }
                    column(NumClienteParaProveedor; g_txtNumClienteParaProveedor)
                    {
                    }
                    column(TotalAmountInclVAT; TotalAmountInclVAT)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(TImporte; TImporte)
                    {
                        AutoFormatExpression = "Sales Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(Base; Base)
                    {
                    }
                    column(PorIva; PorIva)
                    {
                    }
                    column(ImporteIva; ImporteIva)
                    {
                    }
                    column(PorRe; PorRe)
                    {
                    }
                    column(ImporteRe; ImporteRe)
                    {
                    }
                    column(Fec1; Fec[1])
                    {
                    }
                    column(Fec2; Fec[2])
                    {
                    }
                    column(Fec3; Fec[3])
                    {
                    }
                    column(Impor1; Impor[1])
                    {
                    }
                    column(Impor2; Impor[2])
                    {
                    }
                    column(Impor3; Impor[3])
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText_DimLoop1; DimText)
                        {
                        }
                        column(Number_DimLoop1; DimensionLoop1.Number)
                        {
                        }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.Find('-') then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Sales Line"; "Service Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");

                        trigger OnAfterGetRecord()
                        var
                            AlbaranAnterior: Code[20];
                        begin
                            Linea2 := Linea2 + 10;
                            SalesLine := "Sales Line";
                            SalesLine."Line No." := Linea2;
                            SalesLine.Insert;
                            //-005
                            //IF SalesLine.Type=0 THEN Linea:=SalesLine."Line No."+1;
                            if SalesLine.Type = 0 then Linea := SalesLine."Line No." - 1;
                            //+005
                            if (SalesLine."Shipment No." <> Albaran) and (SalesLine."Shipment No." <> '') and (TotAlb <> 0) then begin
                                //-005
                                AlbaranAnterior := Albaran;
                                //+005
                                Albaran := SalesLine."Shipment No.";
                                SalesLine."Line No." := Linea;
                                SalesLine."Shipment No." := '';
                                SalesLine."No." := '';
                                SalesLine.Type := 0;
                                SalesLine."Line Amount" := TotAlb;
                                //-005
                                rcabalbaran.Get(AlbaranAnterior);
                                //+005

                                Desc := rcabalbaran."Ship-to Name" + '               Total Albarán  ' + AlbaranAnterior + '    ' + rcabalbaran."Salesperson Code" + ' ' +
                                //-005
                                //FORMAT(rcabalbaran."Posting Date",0,'<Day,2>/<Month,2>/<Year>')+'   '+rcabalbaran."Order No.";
                                Format(rcabalbaran."Posting Date", 0, '<Day,2>/<Month,2>/<Year>');
                                //+005

                                SalesLine.Description := CopyStr(Desc, 1, MaxStrLen(SalesLine.Description));
                                if StrLen(Desc) > MaxStrLen(SalesLine.Description) then begin
                                    SalesLine."Description 2" := CopyStr(Desc, MaxStrLen(SalesLine.Description) + 1, MaxStrLen(SalesLine."Description 2"));
                                end;
                                TotAlb := "Sales Line".Amount;
                                SalesLine.Insert;
                                CurrReport.Skip;

                            end;

                            if SalesLine."Shipment No." <> '' then begin
                                Albaran := SalesLine."Shipment No.";
                                rcabalbaran.Reset;
                                if not (rcabalbaran.Get(SalesLine."Shipment No.")) then begin
                                    rcabalbaran.Init;
                                    rcabalbaran."No." := SalesLine."Shipment No.";
                                    rcabalbaran."Posting Date" := "Sales Header"."Posting Date";
                                    if "Sales Header"."Ship-to Name" <> '' then
                                        rcabalbaran."Ship-to Name" := "Sales Header"."Ship-to Name"
                                    else
                                        rcabalbaran."Ship-to Name" := "Sales Header"."Bill-to Name 2";
                                    rcabalbaran."Salesperson Code" := "Sales Header"."Salesperson Code";
                                end;
                                TotAlb := TotAlb + "Sales Line".Amount;
                            end;

                            if SalesLine."Qty. per Unit of Measure" <> 0 then
                                SalesLine."Unit Price" := (SalesLine."Unit Price" / SalesLine."Qty. per Unit of Measure");
                            if "Sales Line"."Qty. per Unit of Measure" <> 0 then
                                "Sales Line"."Unit Price" := ("Sales Line"."Unit Price" / "Sales Line"."Qty. per Unit of Measure");
                        end;

                        trigger OnPostDataItem()
                        begin
                            if (Albaran <> '') then begin
                                SalesLine."Line No." := Linea2 + 1;
                                SalesLine."Shipment No." := '';
                                SalesLine."No." := '';
                                SalesLine.Type := 0;
                                SalesLine."Line Amount" := TotAlb;

                                Desc := rcabalbaran."Ship-to Name" + '               Total Albarán  ' + Albaran + '    ' + rcabalbaran."Salesperson Code" + ' ' +
                                //-005
                                //FORMAT(rcabalbaran."Posting Date",0,'<Day,2>/<Month,2>/<Year>')+'   '+rcabalbaran."Order No.";
                                Format(rcabalbaran."Posting Date", 0, '<Day,2>/<Month,2>/<Year>');
                                //+005
                                SalesLine.Description := CopyStr(Desc, 1, MaxStrLen(SalesLine.Description));
                                if StrLen(Desc) > MaxStrLen(SalesLine.Description) then begin
                                    SalesLine."Description 2" := CopyStr(Desc, MaxStrLen(SalesLine.Description) + 1, MaxStrLen(SalesLine."Description 2"));
                                end;
                                TotAlb := 0;
                                SalesLine.Insert;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            //CurrReport.BREAK;
                            Linea2 := 0;
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(LineAmt_SalesLine; SalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Desc_SalesLine; Desc)
                        {
                        }
                        column(NNCSalesLineLineAmt; NNC_SalesLineLineAmt)
                        {
                        }
                        column(NNCSalesLineInvDiscAmt; NNC_SalesLineInvDiscAmt)
                        {
                        }
                        column(NNCTotalExclVAT; NNC_TotalExclVAT)
                        {
                        }
                        column(NNCVATAmt; NNC_VATAmt)
                        {
                        }
                        column(NNCPmtDiscOnVAT; NNC_PmtDiscOnVAT)
                        {
                        }
                        column(NNCTotalInclVAT2; NNC_TotalInclVAT2)
                        {
                        }
                        column(NNCVatAmt2; NNC_VatAmt2)
                        {
                        }
                        column(NNCTotalExclVAT2; NNC_TotalExclVAT2)
                        {
                        }
                        column(VATBaseDisc_SalesHeader; "Sales Header"."VAT Base Discount %")
                        {
                        }
                        column(AsmInfoExistsForLine; AsmInfoExistsForLine)
                        {
                        }
                        column(No_SalesLine; "Sales Line"."No.")
                        {
                        }
                        column(Qty_SalesLine; "Sales Line"."Quantity (Base)")
                        {
                        }
                        column(Bultos; Bultos)
                        {
                        }
                        column(UOM_SalesLine; "Sales Line"."Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesLine; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(LineDisc_SalesLine; "Sales Line"."Line Discount %")
                        {
                        }
                        column(LineAmt1_SalesLine; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AllowInvDisc_SalesLine; "Sales Line"."Allow Invoice Disc.")
                        {
                        }
                        column(VATIdentifier_SalesLine; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(Type_SalesLine; Format("Sales Line".Type))
                        {
                        }
                        column(No1_SalesLine; "Sales Line"."Line No.")
                        {
                        }
                        column(AllowInvDisYesNo_SalesLine; Format("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(SalesLineInvDiscAmt; -VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineLineAmtInvDiscAmt; -SalesLine."Pmt. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(NNCPmtDiscGivenAmount; NNC_PmtDiscGivenAmount)
                        {
                        }
                        column(SalesLinePmtDiscGivenAmt; SalesLine."Pmt. Discount Amount")
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesLineLAmtInvDiscAmtVATAmt; SalesLine."Line Amount" - VATAmountLine."Invoice Discount Amount" - SalesLine."Pmt. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountCaption; DiscountCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(InvDiscAmtCaption; InvDiscAmtCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PmtDiscGivenAmtCaption; PmtDiscGivenAmtCaptionLbl)
                        {
                        }
                        column(PaymentDiscVATCaption; PaymentDiscVATCaptionLbl)
                        {
                        }
                        column(Desc_SalesLineCaption; "Sales Line".FieldCaption(Description))
                        {
                        }
                        column(No_SalesLineCaption; "Sales Line".FieldCaption("No."))
                        {
                        }
                        column(Qty_SalesLineCaption; "Sales Line".FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesLineCaption; "Sales Line".FieldCaption("Unit of Measure"))
                        {
                        }
                        column(AllowInvDisc_SalesLineCaption; "Sales Line".FieldCaption("Allow Invoice Disc."))
                        {
                        }
                        column(VATIdentifier_SalesLineCaption; "Sales Line".FieldCaption("VAT Identifier"))
                        {
                        }
                        column(Titulo_ImporteTasa; TXT_TIT_IMPORTE_TASA)
                        {
                        }
                        column(LineDiscTXT_SalesLine; g_txtDto)
                        {
                        }
                        column(SimboloDto; Format(g_intSimboloDto))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText_DimLoop2; DimText)
                            {
                            }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin

                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin

                                if not ShowInternalInfo then
                                    CurrReport.Break;

                                DimSetEntry2.SetRange("Dimension Set ID", "Sales Line"."Dimension Set ID");
                            end;
                        }
                        dataitem(AsmLoop; "Integer")
                        {
                            column(AsmLineUnitOfMeasureText; GetUnitOfMeasureDescr(AsmLine."Unit of Measure Code"))
                            {
                            }
                            column(AsmLineQuantity; AsmLine.Quantity)
                            {
                            }
                            column(AsmLineDescription; BlanksForIndent + AsmLine.Description)
                            {
                            }
                            column(AsmLineNo; BlanksForIndent + AsmLine."No.")
                            {
                            }
                            column(AsmLineType; AsmLine.Type)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    AsmLine.FindSet
                                else
                                    AsmLine.Next;
                            end;

                            trigger OnPreDataItem()
                            begin

                                if not DisplayAssemblyInformation then
                                    CurrReport.Break;
                                if not AsmInfoExistsForLine then
                                    CurrReport.Break;

                                AsmLine.SetRange("Document Type", AsmHeader."Document Type");
                                AsmLine.SetRange("Document No.", AsmHeader."No.");
                                SetRange(Number, 1, AsmLine.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            recProducto: Record Item;
                            Alba: Text[30];
                            rcabalbaran: Record "Sales Shipment Header";
                        begin
                            if Number = 1 then
                                SalesLine.Find('-')
                            else
                                SalesLine.Next;
                            "Sales Line" := SalesLine;
                            if SalesLine.Type <> SalesLine.Type::" " then begin
                                if VatPostingSetup.Get("Sales Line"."VAT Bus. Posting Group", "Sales Line"."VAT Prod. Posting Group") then begin
                                    VATAmountLine.Init;
                                    VATAmountLine."VAT Identifier" := "Sales Line"."VAT Identifier";
                                    VATAmountLine."VAT Calculation Type" := "Sales Line"."VAT Calculation Type";
                                    VATAmountLine."Tax Group Code" := "Sales Line"."Tax Group Code";
                                    VATAmountLine."VAT %" := VatPostingSetup."VAT %";
                                    VATAmountLine."EC %" := VatPostingSetup."EC %";
                                    VATAmountLine."VAT Base" := "Sales Line".Amount;
                                    VATAmountLine."Amount Including VAT" := "Sales Line"."Amount Including VAT";
                                    VATAmountLine."Line Amount" := "Sales Line"."Line Amount";
                                    VATAmountLine."Pmt. Discount Amount" := "Sales Line"."Pmt. Discount Amount";
                                    VATAmountLine."Invoice Discount Amount" := "Sales Line"."Inv. Discount Amount";
                                    VATAmountLine.SetCurrencyCode("Sales Header"."Currency Code");
                                    VATAmountLine."VAT Difference" := "Sales Line"."VAT Difference";
                                    VATAmountLine."EC Difference" := "Sales Line"."EC Difference";
                                    if "Sales Header"."Prices Including VAT" then
                                        VATAmountLine."Prices Including VAT" := true;
                                    VATAmountLine.InsertLine;
                                end;
                                //TotalAmountInclVAT+=VATAmountLine."Amount Including VAT"; //+006
                                Bultos := 0;
                                if "Sales Line"."Qty. per Unit of Measure" <> 1 then
                                    Bultos := "Sales Line".Quantity;
                                if not "Sales Header"."Prices Including VAT" and
                                   (SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Full VAT")
                                then
                                    SalesLine."Line Amount" := 0;

                                if (SalesLine.Type = SalesLine.Type::"G/L Account") and (not ShowInternalInfo) then
                                    "Sales Line"."No." := '';

                                NNC_SalesLineLineAmt += SalesLine."Line Amount";
                                NNC_SalesLineInvDiscAmt += SalesLine."Inv. Discount Amount";

                                NNC_TotalLCY := NNC_SalesLineLineAmt - NNC_SalesLineInvDiscAmt;

                                NNC_TotalExclVAT := NNC_TotalLCY;
                                NNC_VATAmt := VATAmount;
                                NNC_TotalInclVAT := NNC_TotalLCY - NNC_VATAmt;

                                NNC_PmtDiscOnVAT := -VATDiscountAmount;

                                NNC_TotalInclVAT2 := TotalAmountInclVAT;

                                NNC_VatAmt2 := VATAmount;
                                //-003
                                //NNC_TotalExclVAT2 := VATAmountLine."VAT+EC Base";// VATBaseAmount; //Modificado por Andreu
                                NNC_TotalExclVAT2 := VATBaseAmount; //Vuelvo a poner cómo estaba porque no tiene en cuenta abonos
                                                                    //+003
                                NNC_PmtDiscGivenAmount := NNC_PmtDiscGivenAmount - SalesLine."Pmt. Discount Amount";
                            end;
                            //+001
                            Desc := SalesLine.Description + ' ' + SalesLine."Description 2";

                            if SalesLine."Qty. per Unit of Measure" <> 0 then
                                SalesLine."Unit Price" := (SalesLine."Unit Price" / SalesLine."Qty. per Unit of Measure");
                            if "Sales Line"."Qty. per Unit of Measure" <> 0 then
                                "Sales Line"."Unit Price" := ("Sales Line"."Unit Price" / "Sales Line"."Qty. per Unit of Measure");

                            //-004
                            g_txtDto := '';
                            g_intSimboloDto := 1; /*blanco*/

                            if SalesLine."Line Discount %" <> 0 then begin
                                g_txtDto := Format(SalesLine."Line Discount %", 0, '<Precision,0:0><Sign><Integer Thousand><Decimals>'); //Pongo 0 decimales porque aparecen algunos
                                g_intSimboloDto := 2; /*porcentajes*/
                            end;

                            if (SalesLine."Line Discount %" = 0) and (SalesLine."Line Discount Amount" <> 0) then begin
                                g_txtDto := Format(SalesLine."Line Discount Amount", 0, '<Precision,2:2><Sign><Integer Thousand><Decimals>');
                                g_intSimboloDto := 3; /*Euros*/
                            end;

                            //+004

                        end;

                        trigger OnPostDataItem()
                        begin
                            SalesLine.DeleteAll;
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATAmountLine.DeleteAll;
                            //Buffer.RESET;
                            //FirstValueEntryNo := 0;
                            MoreLines := SalesLine.Find('+');
                            while MoreLines and (SalesLine.Description = '') and (SalesLine."Description 2" = '') and
                                  (SalesLine."No." = '') and (SalesLine.Quantity = 0) and
                                  (SalesLine.Amount = 0)
                            do
                                MoreLines := SalesLine.Next(-1) <> 0;

                            if not MoreLines then
                                CurrReport.Break;

                            SalesLine.SetRange("Line No.", 0, SalesLine."Line No.");
                            SetRange(Number, 1, SalesLine.Count);
                            CurrReport.CreateTotals(SalesLine."Line Amount", SalesLine."Inv. Discount Amount", SalesLine."Pmt. Discount Amount");
                            //TotalAmountInclVAT := 0;
                            //TotalAmountInclVAT := 0; //+006
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmountLineVATECBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVATAmount; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineLineAmount; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmtPmtDiscAmt; VATAmountLine."Invoice Discount Amount" + VATAmountLine."Pmt. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineECAmt; VATAmountLine."EC Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT_VATCounter; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 6;
                        }
                        column(VATAmtLineVATIdentifier_VATCounter; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLineEC; VATAmountLine."EC %")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATPecrentCaption; VATPecrentCaptionLbl)
                        {
                        }
                        column(VATECBaseCaption; VATECBaseCaptionLbl)
                        {
                        }
                        column(VATAmountCaption; VATAmountCaptionLbl)
                        {
                        }
                        column(VATAmtSpecCaption; VATAmtSpecCaptionLbl)
                        {
                        }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                        {
                        }
                        column(LineAmountCaption; LineAmountCaptionLbl)
                        {
                        }
                        column(InvPmtDiscountsCaption; InvPmtDiscountsCaptionLbl)
                        {
                        }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl)
                        {
                        }
                        column(ECAmtCaption; ECAmtCaptionLbl)
                        {
                        }
                        column(ECPercentCaption; ECPercentCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);
                            if VATAmountLine."VAT Amount" = 0 then
                                VATAmountLine."VAT %" := 0;
                            if VATAmountLine."EC Amount" = 0 then
                                VATAmountLine."EC %" := 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (VATAmount = 0) and (VATAmountLine."VAT %" + VATAmountLine."EC %" = 0) then
                                CurrReport.Break;
                            SetRange(Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount",
                              VATAmountLine."EC Amount", VATAmountLine."Pmt. Discount Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VALExchRate; VALExchRate)
                        {
                        }
                        column(VALSpecLCYHeader; VALSpecLCYHeader)
                        {
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATAmountLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmountLineVAT_VATCounterLCY; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier_VATCounterLCY; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATBaseCaption; VATBaseCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(Number);

                            VALVATBaseLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(
                                               "Sales Header"."Posting Date", "Sales Header"."Currency Code",
                                               VATAmountLine."VAT Base", "Sales Header"."Currency Factor"));
                            VALVATAmountLCY := Round(CurrExchRate.ExchangeAmtFCYToLCY(
                                                 "Sales Header"."Posting Date", "Sales Header"."Currency Code",
                                                 VATAmountLine."VAT Amount", "Sales Header"."Currency Factor"));
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Sales Header"."Currency Code" = '') or
                               (VATAmountLine.GetTotalVATAmount = 0) then
                                CurrReport.Break;

                            SetRange(Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(VALVATBaseLCY, VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Sales Header"."Posting Date", "Sales Header"."Currency Code", 1);
                            VALExchRate := StrSubstNo(Text009, CurrExchRate."Relational Exch. Rate Amount", CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(SelltoCustNo_SalesHeader; "Sales Header"."Customer No.")
                        {
                        }
                        column(ShipToAddr8; ShipToAddr[8])
                        {
                        }
                        column(ShipToAddr7; ShipToAddr[7])
                        {
                        }
                        column(ShipToAddr6; ShipToAddr[6])
                        {
                        }
                        column(ShipToAddr5; ShipToAddr[5])
                        {
                        }
                        column(ShipToAddr4; ShipToAddr[4])
                        {
                        }
                        column(ShipToAddr3; ShipToAddr[3])
                        {
                        }
                        column(ShipToAddr2; ShipToAddr[2])
                        {
                        }
                        column(ShipToAddr1; ShipToAddr[1])
                        {
                        }
                        column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                        {
                        }
                        column(SelltoCustNo_SalesHeaderCaption; "Sales Header".FieldCaption("Customer No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowShippingAddr then
                                CurrReport.Break;
                        end;
                    }
                    dataitem(PrepmtLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(PrepmtLineAmount; PrepmtLineAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBufDesc; PrepmtInvBuf.Description)
                        {
                        }
                        column(GLAccountNo_PrepmtInvBuf; PrepmtInvBuf."G/L Account No.")
                        {
                        }
                        column(TotalExclVATText1; TotalExclVATText)
                        {
                        }
                        column(PrepmtVATAmtLineVATAmtTxt; PrepmtVATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalInclVATTxt; TotalInclVATText)
                        {
                        }
                        column(PrepmtInvBufAmount; PrepmtInvBuf.Amount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATAmount; PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtInvBufAmtPrepmtVATAmt; PrepmtInvBuf.Amount + PrepmtVATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLVATAmtText1; VATAmountLine.VATAmountText)
                        {
                        }
                        column(PrepmtTotalAmountInclVAT; PrepmtTotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(PrepmtVATBaseAmount; PrepmtVATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(GLAccountNoCaption; GLAccountNoCaptionLbl)
                        {
                        }
                        column(PrepaymentSpecCaption; PrepaymentSpecCaptionLbl)
                        {
                        }
                        dataitem(PrepmtDimLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText2; DimText)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not TempPrepmtDimSetEntry.Find('-') then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText :=
                                          StrSubstNo('%1 %2', TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            TempPrepmtDimSetEntry."Dimension Code", TempPrepmtDimSetEntry."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until TempPrepmtDimSetEntry.Next = 0;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not PrepmtInvBuf.Find('-') then
                                    CurrReport.Break;
                            end else
                                if PrepmtInvBuf.Next = 0 then
                                    CurrReport.Break;

                            if ShowInternalInfo then
                                DimMgt.GetDimensionSet(TempPrepmtDimSetEntry, PrepmtInvBuf."Dimension Set ID");

                            if "Sales Header"."Prices Including VAT" then
                                PrepmtLineAmount := PrepmtInvBuf."Amount Incl. VAT"
                            else
                                PrepmtLineAmount := PrepmtInvBuf.Amount;
                        end;

                        trigger OnPreDataItem()
                        begin
                            CurrReport.CreateTotals(
                              PrepmtInvBuf.Amount, PrepmtInvBuf."Amount Incl. VAT",
                              PrepmtVATAmountLine."Line Amount", PrepmtVATAmountLine."VAT Base", // es0005
                              PrepmtVATAmountLine."VAT Amount",
                              PrepmtLineAmount);
                        end;
                    }
                    dataitem(PrepmtVATCounter; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(VATAmt_PrepmtVATAmtLine; PrepmtVATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBase_PrepmtVATAmtLine; PrepmtVATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(LineAmt_PrepmtVATAmtLine; PrepmtVATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VAT_PrepmtVATAmtLine; PrepmtVATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATIdentifier_PrepmtVATAmtLine; PrepmtVATAmountLine."VAT Identifier")
                        {
                        }
                        column(PrepaymentVATAmtSpecCaption; PrepaymentVATAmtSpecCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            PrepmtVATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, PrepmtVATAmountLine.Count);
                        end;
                    }
                    dataitem(PrepmtTotal; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(PrepmtPaymentTermsDesc; PrepmtPaymentTerms.Description)
                        {
                        }
                        column(PrepmtPaymentTermsCaption; PrepmtPaymentTermsCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not PrepmtInvBuf.Find('-') then
                                CurrReport.Break;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                var
                    PrepmtSalesLine: Record "Sales Line" temporary;
                    SalesPost: Codeunit "Sales-Post";
                    TempSalesLine: Record "Sales Line" temporary;
                    TempSalesLineDisc: Record "Sales Line" temporary;
                begin
                    if Number > 1 then begin
                        CopyText := Text003;
                        OutputNo += 1;
                    end;
                    CurrReport.PageNo := 1;
                    TotAlb := 0;
                    NNC_TotalLCY := 0;
                    NNC_TotalExclVAT := 0;
                    NNC_VATAmt := 0;
                    NNC_TotalInclVAT := 0;
                    NNC_PmtDiscOnVAT := 0;
                    NNC_TotalInclVAT2 := 0;
                    NNC_VatAmt2 := 0;
                    NNC_TotalExclVAT2 := 0;
                    NNC_SalesLineLineAmt := 0;
                    NNC_SalesLineInvDiscAmt := 0;

                    //-001
                    g_txtTipoDocumento := TXT_FACTURA;

                    Doc := "Sales Header"."No.";
                    SalesLine.Reset;
                    Linea2 := 0;
                    Linea := 0;
                    SalesLine.DeleteAll;
                end;

                trigger OnPostDataItem()
                begin
                    if Print then
                        SalesCountPrinted.Run("Sales Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord()
            var
                recProveedor: Record Vendor;
                Cust: Record Customer;
                SL: Record "Service Invoice Line";
                rBamc: Record "Customer Bank Account";
                rCar: Record "Cust. Ledger Entry";
                rCt: Record "Service Comment Line";
            begin
                //rCt.SETRANGE(rCt."Document Type",rCt."Document Type"::"Posted Invoice");
                rCt.SetRange(rCt."No.", "Sales Header"."No.");
                g_txtComentarios := '';
                if rCt.FindFirst then
                    repeat
                        g_txtComentarios += rCt.Comment;
                    // ELSE g_txtComentarios:='';
                    until rCt.Next = 0;
                SalesLine.Reset;
                Linea2 := 0;
                Linea := 0;
                SalesLine.DeleteAll;
                Clear(Albaran);
                If "Language Code" <> '' Then CurrReport.Language := Language.GetLanguageID("Language Code");
                "Sales Header".CalcFields("Amount Including VAT", Amount);
                TotalAmountInclVAT := "Sales Header"."Amount Including VAT";
                TImporte := "Sales Header".Amount;
                if RespCenter.Get("Responsibility Center") then begin
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                if "Salesperson Code" = '' then begin
                    Clear(SalesPurchPerson);
                    SalesPersonText := '';
                end else begin
                    SalesPurchPerson.Get("Salesperson Code");
                    SalesPersonText := Text000;

                end;
                if "Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := FieldCaption("Your Reference");
                if Cust.Get("Sales Header"."Customer No.") then;
                if "VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := FieldCaption("VAT Registration No.");
                if "Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(Text001, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(Text1100000, GLSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(Text1100001, GLSetup."LCY Code");
                end else begin
                    TotalText := StrSubstNo(Text001, "Currency Code");
                    TotalInclVATText := StrSubstNo(Text1100000, "Currency Code");
                    TotalExclVATText := StrSubstNo(Text1100001, "Currency Code");
                end;
                FormatAddr.ServiceInvBillTo(CustAddr, "Sales Header");

                if "Payment Terms Code" = '' then
                    PaymentTerms.Init
                else begin
                    PaymentTerms.Get("Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Language Code");
                end;

                if "Payment Method Code" = '' then
                    PaymentMethod.Init
                else
                    PaymentMethod.Get("Payment Method Code");

                FormatAddr.ServiceInvShipTo(ShipToAddr, CustAddr, "Sales Header");
                ShowShippingAddr := "Customer No." <> "Bill-to Customer No.";
                for i := 1 to ArrayLen(ShipToAddr) do
                    if ShipToAddr[i] <> CustAddr[i] then
                        ShowShippingAddr := true;
                ShowShippingAddr := false;
                CustAddr[3] := "Sales Header"."Bill-to Address";
                CustAddr[4] := "Sales Header"."Bill-to Post Code";
                CustAddr[5] := "Sales Header"."Bill-to City";
                if Print then begin
                    //  IF ArchiveDocument THEN
                    // ArchiveManagement.StoreSalesDocument("Sales Header",LogInteraction);
                    //
                    /*IF LogInteraction THEN BEGIN
                      CALCFIELDS("No. of Archived Versions");
                      IF "Bill-to Contact No." <> '' THEN
                        SegManagement.LogDocument(
                          3,"No.","Doc. No. Occurrence",
                          "No. of Archived Versions",DATABASE::Contact,"Bill-to Contact No."
                          ,"Salesperson Code","Campaign No.","Posting Description","Opportunity No.")
                      ELSE
                        SegManagement.LogDocument(
                          3,"No.","Doc. No. Occurrence",
                          "No. of Archived Versions",DATABASE::Customer,"Bill-to Customer No.",
                          "Salesperson Code","Campaign No.","Posting Description","Opportunity No.");
                    END;*/
                end;

                //-001
                //g_txtPorCuentaDe := '';
                g_txtNumClienteParaProveedor := '';
                //+001
                SL.SetRange("Document No.", "Sales Header"."No.");
                if SL.FindFirst then
                    repeat
                        if SL.Type <> SL.Type::" " then begin
                            if VatPostingSetup.Get(SL."VAT Bus. Posting Group", SL."VAT Prod. Posting Group") then begin
                                VATAmountLine.Init;
                                VATAmountLine."VAT Identifier" := SL."VAT Identifier";
                                VATAmountLine."VAT Calculation Type" := SL."VAT Calculation Type";
                                VATAmountLine."Tax Group Code" := SL."Tax Group Code";
                                VATAmountLine."VAT %" := VatPostingSetup."VAT %";
                                VATAmountLine."EC %" := VatPostingSetup."EC %";
                                VATAmountLine."VAT Base" := SL.Amount;
                                VATAmountLine."Amount Including VAT" := SL."Amount Including VAT";
                                VATAmountLine."Line Amount" := SL."Line Amount";
                                VATAmountLine."Pmt. Discount Amount" := SL."Pmt. Discount Amount";
                                VATAmountLine."Invoice Discount Amount" := SL."Inv. Discount Amount";
                                VATAmountLine.SetCurrencyCode("Sales Header"."Currency Code");
                                VATAmountLine."VAT Difference" := SL."VAT Difference";
                                VATAmountLine."EC Difference" := SL."EC Difference";
                                if "Sales Header"."Prices Including VAT" then
                                    VATAmountLine."Prices Including VAT" := true;
                                VATAmountLine.InsertLine;

                            end;
                        end;
                    until SL.Next = 0;
                if VATAmountLine.FindFirst then
                    repeat
                        Base += VATAmountLine."VAT Base";
                        PorIva := VATAmountLine."VAT %";
                        PorRe := VATAmountLine."EC %";
                        ImporteIva += VATAmountLine."VAT Amount";
                        ImporteRe += VATAmountLine."EC Amount";
                    until VATAmountLine.Next = 0;
                if rBamc.Get(Cust."No.", Cust."Preferred Bank Account Code") then
                    BankNameCaptionLbl := rBamc.Name + ' ' + rBamc."CCC Bank No." + '-' + rBamc."CCC Bank Branch No." + '-XX-XXXXXXXXXX';
                if rBamc."CCC Bank Branch No." = '' then BankNameCaptionLbl := '';
                if PaymentMethod."CCC No." <> '' then BankNameCaptionLbl := PaymentMethod."CCC No.";
                rCar.SetCurrentKey("Document No.", "Document Type", "Customer No.");
                rCar.SetRange(rCar."Document No.", "Sales Header"."No.");
                rCar.SetRange(rCar."Document Type", rCar."Document Type"::Bill);
                rCar.SetRange(rCar."Customer No.", "Sales Header"."Customer No.");
                i := 0;
                Clear(Fec);
                Clear(Impor);
                if rCar.Find('-') then begin
                    repeat
                        i := i + 1;
                        rCar.CalcFields(Amount);
                        Fec[i] := rCar."Due Date";
                        Impor[i] := rCar.Amount;
                    until rCar.Next = 0;
                end else begin
                    Clear(Fec);
                    Clear(Impor);
                    Fec[1] := "Sales Header"."Due Date";
                    Impor[1] := "Sales Header"."Amount Including VAT";
                end;
                // BankNameCaptionLbl:=rBamc.Name+' '+rBamc."CCC Bank No."+'-'+rBamc."CCC Bank Branch No."+'-XX-XXXXXXXXXX';
                // IF rBamc."CCC Bank Branch No."='' THEN BankNameCaptionLbl:='';
                /*
                SalesLine.RESET;
                Linea2:=0;
                Linea:=0;
                SalesLine.DELETEALL;
                CLEAR(Albaran);
                If "Language Code"<>'' Then CurrReport.Language := Language.GetLanguageID("Language Code");
                "Sales Header".CALCFIELDS("Amount Including VAT",Amount);
                TotalAmountInclVAT:="Sales Header"."Amount Including VAT";
                TImporte:="Sales Header".Amount;
                IF RespCenter.GET("Responsibility Center") THEN BEGIN
                  FormatAddr.RespCenter(CompanyAddr,RespCenter);
                  CompanyInfo."Phone No." := RespCenter."Phone No.";
                  CompanyInfo."Fax No." := RespCenter."Fax No.";
                END ELSE
                  FormatAddr.Company(CompanyAddr,CompanyInfo);
                
                DimSetEntry1.SETRANGE("Dimension Set ID","Dimension Set ID");
                
                IF "Salesperson Code" = '' THEN BEGIN
                  CLEAR(SalesPurchPerson);
                  SalesPersonText := '';
                END ELSE BEGIN
                  SalesPurchPerson.GET("Salesperson Code");
                  SalesPersonText := Text000;
                
                END;
                IF "Your Reference" = '' THEN
                  ReferenceText := ''
                ELSE
                  ReferenceText := FIELDCAPTION("Your Reference");
                IF Cust.GET("Sales Header"."Sell-to Customer No.") THEN;
                IF "VAT Registration No." = '' THEN
                  VATNoText := ''
                ELSE
                  VATNoText := FIELDCAPTION("VAT Registration No.");
                IF "Currency Code" = '' THEN BEGIN
                  GLSetup.TESTFIELD("LCY Code");
                  TotalText := STRSUBSTNO(Text001,GLSetup."LCY Code");
                  TotalInclVATText := STRSUBSTNO(Text1100000,GLSetup."LCY Code");
                  TotalExclVATText := STRSUBSTNO(Text1100001,GLSetup."LCY Code");
                END ELSE BEGIN
                  TotalText := STRSUBSTNO(Text001,"Currency Code");
                  TotalInclVATText := STRSUBSTNO(Text1100000,"Currency Code");
                  TotalExclVATText := STRSUBSTNO(Text1100001,"Currency Code");
                END;
                FormatAddr.SalesInvBillTo(CustAddr,"Sales Header");
                
                IF "Payment Terms Code" = '' THEN
                  PaymentTerms.INIT
                ELSE BEGIN
                  PaymentTerms.GET("Payment Terms Code");
                  PaymentTerms.TranslateDescription(PaymentTerms,"Language Code");
                END;
                
                IF "Payment Method Code" = '' THEN
                  PaymentMethod.INIT
                ELSE
                  PaymentMethod.GET("Payment Method Code");
                
                FormatAddr.SalesInvShipTo(ShipToAddr,CustAddr,"Sales Header");
                ShowShippingAddr := "Sell-to Customer No." <> "Bill-to Customer No.";
                FOR i := 1 TO ARRAYLEN(ShipToAddr) DO
                  IF ShipToAddr[i] <> CustAddr[i] THEN
                    ShowShippingAddr := TRUE;
                ShowShippingAddr:=FALSE;
                CustAddr[3]:="Sales Header"."Bill-to Address";
                CustAddr[4]:="Sales Header"."Bill-to Post Code";
                CustAddr[5]:="Sales Header"."Bill-to City";
                IF Print THEN BEGIN
                //  IF ArchiveDocument THEN
                   // ArchiveManagement.StoreSalesDocument("Sales Header",LogInteraction);
                    //
                  {IF LogInteraction THEN BEGIN
                    CALCFIELDS("No. of Archived Versions");
                    IF "Bill-to Contact No." <> '' THEN
                      SegManagement.LogDocument(
                        3,"No.","Doc. No. Occurrence",
                        "No. of Archived Versions",DATABASE::Contact,"Bill-to Contact No."
                        ,"Salesperson Code","Campaign No.","Posting Description","Opportunity No.")
                    ELSE
                      SegManagement.LogDocument(
                        3,"No.","Doc. No. Occurrence",
                        "No. of Archived Versions",DATABASE::Customer,"Bill-to Customer No.",
                        "Salesperson Code","Campaign No.","Posting Description","Opportunity No.");
                  END;}
                END;
                
                //-001
                g_txtPorCuentaDe := '';
                g_txtNumClienteParaProveedor := '';
                //+001
                SL.SETRANGE("Document No.","Sales Header"."No.");
                IF SL.FINDFIRST THEN REPEAT
                IF SL.Type<>SL.Type::" " THEN BEGIN
                IF VatPostingSetup.GET(SL."VAT Bus. Posting Group",SL."VAT Prod. Posting Group") THEN
                BEGIN
                  VATAmountLine.INIT;
                  VATAmountLine."VAT Identifier" := SL."VAT Identifier";
                  VATAmountLine."VAT Calculation Type" := SL."VAT Calculation Type";
                  VATAmountLine."Tax Group Code" := SL."Tax Group Code";
                  VATAmountLine."VAT %" := VatPostingSetup."VAT %";
                  VATAmountLine."EC %" := VatPostingSetup."EC %";
                  VATAmountLine."VAT Base" := SL.Amount;
                  VATAmountLine."Amount Including VAT" := SL."Amount Including VAT";
                  VATAmountLine."Line Amount" := SL."Line Amount";
                  VATAmountLine."Pmt. Disc. Given Amount" := SL."Pmt. Disc. Given Amount";
                  VATAmountLine."Invoice Discount Amount" := SL."Inv. Discount Amount";
                  VATAmountLine.SetCurrencyCode("Sales Header"."Currency Code");
                  VATAmountLine."VAT Difference" := SL."VAT Difference";
                  VATAmountLine."EC Difference" := SL."EC Difference";
                  IF "Sales Header"."Prices Including VAT" THEN
                    VATAmountLine."Prices Including VAT" := TRUE;
                  VATAmountLine.InsertLine;
                
                END;
                END;
                UNTIL SL.NEXT=0;
                IF VATAmountLine.FINDFIRST THEN REPEAT
                  Base+=VATAmountLine."VAT Base";
                  PorIva:=VATAmountLine."VAT %";
                  PorRe:=VATAmountLine."EC %";
                  ImporteIva+=VATAmountLine."VAT Amount";
                  ImporteRe+=VATAmountLine."EC Amount";
                UNTIL VATAmountLine.NEXT=0;
                //TotalAmountInclVAT:=VATAmountLine."Amount Including VAT";
                IF rBamc.GET(Cust."No.",Cust."Preferred Bank Account Code") THEN
                 BankNameCaptionLbl:=rBamc.Name+' '+rBamc."CCC Bank No."+'-'+rBamc."CCC Bank Branch No."+'-XX-XXXXXXXXXX';
                 IF rBamc."CCC Bank Branch No."='' THEN BankNameCaptionLbl:='';
                IF PaymentMethod."CCC No."<>'' THEN BankNameCaptionLbl:=PaymentMethod."CCC No.";
                rCar.SETCURRENTKEY("Document No.","Document Type","Customer No.");
                rCar.SETRANGE(rCar."Document No.","Sales Header"."No.");
                rCar.SETRANGE(rCar."Document Type",rCar."Document Type"::Bill);
                rCar.SETRANGE(rCar."Customer No.","Sales Header"."Sell-to Customer No.");
                i:=0;
                 CLEAR(Fec);
                 CLEAR(Impor);
                IF rCar.FIND('-') THEN BEGIN
                 REPEAT
                  i:=i+1;
                  rCar.CALCFIELDS(Amount);
                  Fec[i]:=rCar."Due Date";
                  Impor[i]:=rCar.Amount;
                 UNTIL rCar.NEXT=0;
                END ELSE BEGIN
                 CLEAR(Fec);
                 CLEAR(Impor);
                 Fec[1]:="Sales Header"."Due Date";
                 Impor[1]:="Sales Header"."Amount Including VAT";
                END;
                 BankNameCaptionLbl:=rBamc.Name+' '+rBamc."CCC Bank No."+'-'+rBamc."CCC Bank Branch No."+'-XX-XXXXXXXXXX';
                 IF rBamc."CCC Bank Branch No."='' THEN BankNameCaptionLbl:='';
                 */

            end;

            trigger OnPreDataItem()
            begin
                Print := Print or not CurrReport.Preview;
                AsmInfoExistsForLine := false;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Opciones)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        Caption = 'Show Internal Information';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        Caption = 'Archive Document';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;

                        trigger OnValidate()
                        begin
                            if LogInteraction then
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
                    }
                    field(ShowAssemblyComponents; DisplayAssemblyInformation)
                    {
                        Caption = 'Show Assembly Components';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            ArchiveDocument := SalesSetup."Archive Orders";
            LogInteraction := SegManagement.FindInteractTmplCode(3) <> '';

            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get;
        CompanyInfo.Get;
        SalesSetup.Get;

        CompanyInfo3.Get;
        CompanyInfo3.CalcFields(Picture);
        CompanyInfo1.Get;
        CompanyInfo1.CalcFields(Picture2);
        CompanyInfo2.Get;
        CompanyInfo2.CalcFields("Logo CESCE");
    end;

    trigger OnPreReport()
    begin
        //-005
        DescAlbaran := '';
        //+005
    end;

    var
        Text000: Label 'Salesperson';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label 'COPY';
        Text004: Label 'Order Confirmation %1';
        Text005: Label 'Page %1';
        Text006: Label 'Total %1 Excl. VAT';
        VatPostingSetup: Record "VAT Posting Setup";
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PrepmtPaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        VATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLine: Record "VAT Amount Line" temporary;
        PrepmtVATAmountLineDeduct: Record "VAT Amount Line" temporary;
        SalesLine: Record "Service Invoice Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        TempPrepmtDimSetEntry: Record "Dimension Set Entry" temporary;
        PrepmtInvBuf: Record "Prepayment Inv. Line Buffer" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Codeunit Language;
        CurrExchRate: Record "Currency Exchange Rate";
        AsmHeader: Record "Assembly Header";
        AsmLine: Record "Assembly Line";
        SalesCountPrinted: Codeunit "Service Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesPostPrepmt: Codeunit "Sales-Post Prepayments";
        DimMgt: Codeunit DimensionManagement;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        i: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        VALExchRate: Text[50];
        PrepmtVATAmount: Decimal;
        PrepmtVATBaseAmount: Decimal;
        PrepmtAmountInclVAT: Decimal;
        PrepmtTotalAmountInclVAT: Decimal;
        PrepmtLineAmount: Decimal;
        OutputNo: Integer;
        NNC_TotalLCY: Decimal;
        NNC_TotalExclVAT: Decimal;
        NNC_VATAmt: Decimal;
        NNC_TotalInclVAT: Decimal;
        NNC_PmtDiscOnVAT: Decimal;
        NNC_TotalInclVAT2: Decimal;
        NNC_VatAmt2: Decimal;
        NNC_TotalExclVAT2: Decimal;
        NNC_SalesLineLineAmt: Decimal;
        NNC_SalesLineInvDiscAmt: Decimal;
        Print: Boolean;
        Text1100000: Label 'Total %1 Incl. VAT+EC';
        Text1100001: Label 'Total %1 Excl. VAT+EC';
        PaymentMethod: Record "Payment Method";
        NNC_PmtDiscGivenAmount: Decimal;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmInfoExistsForLine: Boolean;
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        PaymentMethodCaptionLbl: Label 'Payment Method';
        PhoneNoCaptionLbl: Label 'Phone No.';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankAccountNoCaptionLbl: Label 'Account No.';
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        OrderNoCaptionLbl: Label 'No.';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        PmtDiscGivenAmtCaptionLbl: Label 'Pmt. Discount Given Amount';
        PaymentDiscVATCaptionLbl: Label 'Payment Discount on VAT';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATPecrentCaptionLbl: Label 'VAT %';
        VATECBaseCaptionLbl: Label 'VAT+EC Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATAmtSpecCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        InvPmtDiscountsCaptionLbl: Label 'Invoice and Pmt. Discounts';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        ECAmtCaptionLbl: Label 'EC Amount';
        ECPercentCaptionLbl: Label 'EC %';
        TotalCaptionLbl: Label 'Total';
        VATBaseCaptionLbl: Label 'VAT Base';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        DescriptionCaptionLbl: Label 'Description';
        GLAccountNoCaptionLbl: Label 'G/L Account No.';
        PrepaymentSpecCaptionLbl: Label 'Prepayment Specification';
        PrepaymentVATAmtSpecCaptionLbl: Label 'Prepayment VAT Amount Specification';
        PrepmtPaymentTermsCaptionLbl: Label 'Prepmt. Payment Terms';
        HomePageCaptionLbl: Label 'Home Page';
        EmailCaptionLbl: Label 'E-Mail';
        DocumentDateCaptionLbl: Label 'Document Date';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        g_txtTipoDocumento: Text;
        TXT_FACTURA: Label 'INVOICE';
        TXT_ALBARAN: Label 'SHIPMENT';
        TXT_NUM_FAX: Label 'Fax No.';
        g_txtComentarios: Text;
        TXT_POR_CUENTA_DE: Label 'Mercancía entregada por cuenta de %1';
        g_txtNumClienteParaProveedor: Text;
        TXT_CLIE_PARA_PROV: Label 'Nº cliente para proveedor: %1';
        TXT_TIT_IMPORTE_TASA: Label 'Tax Amount';
        g_codProducto: Code[20];
        Doc: Text[30];
        SubtotalCaptionLbl: Text[250];
        Bultos: Decimal;
        ServiceShipmentBuffer: Record "Service Shipment Buffer" temporary;
        Desc: Text[250];
        Albaran: Text[20];
        TotAlb: Decimal;
        Linea: Integer;
        rcabalbaran: Record "Service Shipment Header";
        Linea2: Integer;
        g_txtDto: Text;
        g_intSimboloDto: Integer;
        DescAlbaran: Text;
        TImporte: Decimal;
        Base: Decimal;
        PorIva: Decimal;
        ImporteIva: Decimal;
        PorRe: Decimal;
        ImporteRe: Decimal;
        Fec: array[10] of Date;
        Impor: array[10] of Decimal;
        BankNameCaptionLbl: Text[250];
        ImprimirenPDF: Boolean;

    procedure InitializeRequest(NoOfCopiesFrom: Integer; ShowInternalInfoFrom: Boolean; ArchiveDocumentFrom: Boolean; LogInteractionFrom: Boolean; PrintFrom: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NoOfCopiesFrom;
        ShowInternalInfo := ShowInternalInfoFrom;
        ArchiveDocument := ArchiveDocumentFrom;
        LogInteraction := LogInteractionFrom;
        Print := PrintFrom;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    procedure IPDF()
    begin
        ImprimirenPDF := true;
    end;
}

