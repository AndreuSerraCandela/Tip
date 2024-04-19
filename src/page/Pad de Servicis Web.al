Page 50022 "Customer List Andreu"
{

    CaptionML = ENU = 'Customer List',
               ESP = 'Lista de clientes';
    SourceTable = Customer;
    PageType = List;
    Editable = false;
    CardPageID = "Customer Card";
    // PromotedActionCategoriesML = ENU = 'New,Process,Report,Approve,New Document,Request Approval,Customer',
    //                             ESP = 'Nuevo,Procesar,Informar,Aprobar,Nuevo documento,Solicitar aprobación,Cliente';

    layout
    {

        area(Content)
        {


            repeater(Detalle)
            {

                Field("No."; Rec."No.")
                {
                    ToolTipML = ENU = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.',
                                ESP = 'Especifica el n£mero del cliente. El campo se rellena autom ticamente a partir de una serie numérica definida o de forma manual porque se habilitó la entrada manual de n£meros en la configuración de series numéricas.';
                    ApplicationArea = All;
                }

                Field("Search Name"; Rec."Search Name") { }

                Field(Name; Rec.Name)
                {
                    ToolTipML = ENU = 'Specifies the customer''''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.',
                           ESP = 'Especifica el nombre del cliente. Este nombre aparecer  en todos los documentos de venta del cliente. Puede insertar un m ximo de 50 caracteres, tanto n£meros como letras.';
                    ApplicationArea = All;
                }
            }
        }

        area(factboxes)
        {
            part(PowerBIEmbeddedReportPart; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
            part(Control99; "CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
                Visible = CRMIsCoupledToRecord and CRMIntegrationEnabled;
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::Customer),
                              "No." = FIELD("No.");
                Visible = NOT IsOfficeAddin;
            }
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1903433807; "Cartera Receiv. Statistics FB")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            part(Control1903433607; "Cartera Fact. Statistics FB")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            part(Control1907829707; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1902613707; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
#if not CLEAN21
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
                ObsoleteReason = 'Use the part PowerBIEmbeddedReportPart instead';
                ObsoleteState = Pending;
                ObsoleteTag = '21.0';
            }
#endif
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Customer),
                                  "No." = FIELD("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action("&Payment Days")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = '&Payment Days';
                    Image = PaymentDays;
                    RunObject = Page "Payment Days";
                    RunPageLink = "Table Name" = CONST(Customer),
                                  Code = FIELD("Payment Days Code");
                    ToolTip = 'View or edit the payment days that are associated with the payment code.';
                }
                action("N&on-Payment Periods")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'N&on-Payment Periods';
                    Image = PaymentPeriod;
                    RunObject = Page "Non-Payment Periods";
                    RunPageLink = "Table Name" = CONST(Customer),
                                  Code = FIELD("Non-Paymt. Periods Code");
                    ToolTip = 'View or edit the periods for which payments will not be made.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(18),
                                      "No." = FIELD("No.");
                        ShortCutKey = 'Alt+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action(DimensionsMultiple)
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            Cust: Record Customer;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Cust);
                            DefaultDimMultiple.SetMultiRecord(Cust, Rec.FieldNo("No."));
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = Page "Customer Bank Account List";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View or set up the customer''s bank accounts. You can set up any number of bank accounts for each customer.';
                }
                action("Direct Debit Mandates")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Direct Debit Mandates';
                    Image = MakeAgreement;
                    RunObject = Page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View the direct-debit mandates that reflect agreements with customers to collect invoice payments from their bank account.';
                }
                action(ShipToAddresses)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ship-&to Addresses';
                    Image = ShipAddress;
                    RunObject = Page "Ship-to Address List";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View or edit alternate shipping addresses where the customer wants items delivered if different from the regular address.';
                }
#if not CLEAN22
                action("Payment A&ddresses")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment A&ddresses';
                    Image = Addresses;
                    RunObject = Page "Customer Pmt. Address List";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'View or edit customers'' payment address. If necessary, you can assign more than one payment address to a customer record. The payment addresses are listed by customer number.';
                    Visible = false;
                    ObsoleteReason = 'Address is taken from the fields Bill-to Address, Bill-to City, etc.';
                    ObsoleteState = Pending;
                    ObsoleteTag = '22.0';
                }
#endif
                action("C&ontact")
                {
                    AccessByPermission = TableData Contact = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'C&ontact';
                    Image = ContactPerson;
                    ToolTip = 'View or edit detailed information about the contact person at the customer.';

                    trigger OnAction()
                    begin
                        Rec.ShowContact();
                    end;
                }
                action("Item References")
                {
                    AccessByPermission = TableData "Item Reference" = R;
                    ApplicationArea = Suite, ItemReferences;
                    Caption = 'Item Refe&rences';
                    Image = Change;
                    RunObject = Page "Item References";
                    RunPageLink = "Reference Type" = CONST(Customer),
                                  "Reference Type No." = FIELD("No.");
                    RunPageView = SORTING("Reference Type", "Reference Type No.");
                    ToolTip = 'Set up the customer''s own identification of items that you sell to the customer. Item references to the customer''s item number means that the item number is automatically shown on sales documents instead of the number that you use.';
                }
                action(OnlineMap)
                {
                    ApplicationArea = All;
                    Caption = 'Online Map';
                    Image = Map;
                    Scope = Repeater;
                    ToolTip = 'View the address on an online map.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap();
                    end;
                }
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
#if not CLEAN19
                action(SentEmails)
                {
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action SentEmails moved under history';
                    ObsoleteTag = '19.0';
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sent Emails';
                    Image = ShowList;
                    ToolTip = 'View a list of emails that you have sent to this customer.';
                    Visible = false;

                    trigger OnAction()
                    var
                        Email: Codeunit Email;
                    begin
                        Email.OpenSentEmails(Database::Customer, Rec.SystemId);
                    end;
                }
#endif
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dataverse';
                Visible = CRMIntegrationEnabled or CDSIntegrationEnabled;
                Enabled = (BlockedFilterApplied and (Rec.Blocked = Rec.Blocked::" ")) or not BlockedFilterApplied;
                action(CRMGotoAccount)
                {
                    ApplicationArea = Suite;
                    Caption = 'Account';
                    Image = CoupledCustomer;
                    ToolTip = 'Open the coupled Dataverse account.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record" = IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send or get updated data to or from Dataverse.';

                    trigger OnAction()
                    var
                        Customer: Record Customer;
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        CustomerRecordRef: RecordRef;
                    begin
                        CurrPage.SetSelectionFilter(Customer);
                        Customer.Next();

                        if Customer.Count = 1 then
                            CRMIntegrationManagement.UpdateOneNow(Customer.RecordId)
                        else begin
                            CustomerRecordRef.GetTable(Customer);
                            CRMIntegrationManagement.UpdateMultipleNow(CustomerRecordRef);
                        end
                    end;
                }
                action(UpdateStatisticsInCRM)
                {
                    ApplicationArea = Suite;
                    Caption = 'Update Account Statistics';
                    Enabled = CRMIsCoupledToRecord;
                    Image = UpdateXML;
                    ToolTip = 'Send customer statistics data to Dataverse to update the Account Statistics FactBox.';
                    Visible = CRMIntegrationEnabled;

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment = 'Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dataverse record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dataverse account.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    // action(MatchBasedCoupling)
                    // {
                    //     AccessByPermission = TableData "CRM Integration Record" = IM;
                    //     ApplicationArea = Suite;
                    //     Caption = 'Match-Based Coupling';
                    //     Image = CoupledCustomer;
                    //     ToolTip = 'Couple customers to accounts in Dataverse based on criteria.';

                    //     trigger OnAction()
                    //     var
                    //         Customer: Record Customer;
                    //         CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    //         RecRef: RecordRef;
                    //     begin
                    //         CurrPage.SetSelectionFilter(Customer);
                    //         RecRef.GetTable(Customer);
                    //         CRMIntegrationManagement.MatchBasedCoupling(RecRef);
                    //     end;
                    // }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record" = D;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dataverse account.';

                        trigger OnAction()
                        var
                            Customer: Record Customer;
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                            RecRef: RecordRef;
                        begin
                            CurrPage.SetSelectionFilter(Customer);
                            RecRef.GetTable(Customer);
                            CRMCouplingManagement.RemoveCoupling(RecRef.RecordId);
                        end;
                    }
                }
                group(Create)
                {
                    Caption = 'Create';
                    Image = NewCustomer;
                    action(CreateInCRM)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Account in Dataverse';
                        Image = NewCustomer;
                        ToolTip = 'Generate the account in the coupled Dataverse account.';

                        trigger OnAction()
                        var
                            Customer: Record Customer;
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CurrPage.SetSelectionFilter(Customer);
                            CRMIntegrationManagement.CreateNewRecordsInCRM(Customer);
                        end;
                    }
                    action(CreateFromCRM)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Create Customer in Business Central';
                        Image = NewCustomer;
                        ToolTip = 'Generate the customer in the coupled Dataverse account.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.CreateNewCustomerFromCRM();
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the customer table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(CustomerLedgerEntries)
                {
                    ApplicationArea = Suite;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = FIELD("No.");
                    RunPageView = SORTING("Customer No.")
                                  ORDER(Descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Customer Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action("S&ales")
                {
                    ApplicationArea = Advanced;
                    Caption = 'S&ales';
                    Image = Sales;
                    RunObject = Page "Customer Sales";
                    RunPageLink = "No." = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ToolTip = 'Shows a summary of customer ledger entries. You select the time interval in the View by field. The Period column on the left contains a series of dates that are determined by the time interval you have selected.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Suite;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Customer Entry Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ToolTip = 'View entry statistics for the record.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = Page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter" = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Date Filter" = FIELD("Date Filter");
                    ToolTip = 'View statistics for customers that use multiple currencies.';
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;
                    ToolTip = 'View serial or lot numbers that are assigned to items.';

                    trigger OnAction()
                    var
                        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                    begin
                        ItemTrackingDocMgt.ShowItemTrackingForEntity(1, Rec."No.", '', '', '');
                    end;
                }
                action("Sent Emails")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sent Emails';
                    Image = ShowList;
                    ToolTip = 'View a list of emails that you have sent to this customer.';

                    trigger OnAction()
                    var
                        Email: Codeunit Email;
                    begin
                        Email.OpenSentEmails(Database::Customer, Rec.SystemId);
                    end;
                }
            }
            group(Action24)
            {
                Caption = 'S&ales';
                Image = Sales;
                action(Sales_InvoiceDiscounts)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code = FIELD("Invoice Disc. Code");
                    ToolTip = 'Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
                }
#if not CLEAN21
                action(Sales_Prices)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Prices';
                    Image = Price;
                    ToolTip = 'View or set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    Visible = not ExtendedPriceEnabled;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '18.0';

                    trigger OnAction()
                    begin
                        ShowPrices();
                    end;
                }
                action(Sales_LineDiscounts)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    ToolTip = 'View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    Visible = not ExtendedPriceEnabled;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '18.0';

                    trigger OnAction()
                    begin
                        ShowLineDiscounts();
                    end;
                }
#endif
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Prepayments;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type" = CONST(Customer),
                                  "Sales Code" = FIELD("No.");
                    RunPageView = SORTING("Sales Type", "Sales Code");
                    ToolTip = 'View or edit the percentages of the price that can be paid as a prepayment. ';
                }
                action("Recurring Sales Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Recurring Sales Lines';
                    Image = CodesList;
                    RunObject = Page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No." = FIELD("No.");
                    ToolTip = 'Set up recurring sales lines for the customer, such as a monthly replenishment order, that can quickly be inserted on a sales document for the customer.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTip = 'View a list of ongoing sales quotes.';
                }
                action(Orders)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTip = 'View a list of ongoing sales orders for the customer.';
                }
                action("Return Orders")
                {
                    ApplicationArea = SalesReturnOrder;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    RunPageView = SORTING("Sell-to Customer No.");
                    ToolTip = 'Open the list of ongoing return orders.';
                }
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Issued &Reminders';
                        Image = OrderReminder;
                        RunObject = Page "Issued Reminder List";
                        RunPageLink = "Customer No." = FIELD("No.");
                        RunPageView = SORTING("Customer No.", "Posting Date");
                        ToolTip = 'View the reminders that you have sent to the customer.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Issued &Finance Charge Memos';
                        Image = FinChargeMemo;
                        RunObject = Page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = FIELD("No.");
                        RunPageView = SORTING("Customer No.", "Posting Date");
                        ToolTip = 'View the finance charge memos that you have sent to the customer.';
                    }
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Suite;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Sell-to Customer No.");
                    ToolTip = 'Open the list of ongoing blanket orders.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    ApplicationArea = Service;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = Page "Service Orders";
                    RunPageLink = "Customer No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Customer No.");
                    ToolTip = 'Open the list of ongoing service orders.';
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Service;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    RunObject = Page "Customer Service Contracts";
                    RunPageLink = "Customer No." = FIELD("No.");
                    RunPageView = SORTING("Customer No.", "Ship-to Code");
                    ToolTip = 'Open the list of ongoing service contracts.';
                }
                action("Service &Items")
                {
                    ApplicationArea = Service;
                    Caption = 'Service &Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Customer No." = FIELD("No.");
                    RunPageView = SORTING("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
                    ToolTip = 'View or edit the service items that are registered for the customer.';
                }
            }
        }
        area(creation)
        {
            action(NewSalesBlanketOrder)
            {
                ApplicationArea = Suite;
                Caption = 'Blanket Sales Order';
                Image = BlanketOrder;
                RunObject = Page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a blanket sales order for the customer.';
            }
            action(NewSalesQuote)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Quote';
                Image = NewSalesQuote;
                RunObject = Page "Sales Quote";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
            }
            action(NewSalesInvoice)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoice';
                Image = NewSalesInvoice;
                RunObject = Page "Sales Invoice";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a sales invoice for the customer.';
            }
            action(NewSalesOrder)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Order';
                Image = Document;
                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a sales order for the customer.';
            }
            action(NewSalesCrMemo)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Credit Memo';
                Image = CreditMemo;
                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new sales credit memo to revert a posted sales invoice.';
            }
            action(NewSalesReturnOrder)
            {
                ApplicationArea = SalesReturnOrder;
                Caption = 'Sales Return Order';
                Image = ReturnOrder;
                RunObject = Page "Sales Return Order";
                RunPageLink = "Sell-to Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new sales return order for items or services.';
            }
            action(NewServiceQuote)
            {
                ApplicationArea = Service;
                Caption = 'Service Quote';
                Image = Quote;
                RunObject = Page "Service Quote";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service quote for the customer.';
            }
            action(NewServiceInvoice)
            {
                ApplicationArea = Service;
                Caption = 'Service Invoice';
                Image = Invoice;
                RunObject = Page "Service Invoice";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service invoice for the customer.';
            }
            action(NewServiceOrder)
            {
                ApplicationArea = Service;
                Caption = 'Service Order';
                Image = Document;
                RunObject = Page "Service Order";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service order for the customer.';
            }
            action(NewServiceCrMemo)
            {
                ApplicationArea = Service;
                Caption = 'Service Credit Memo';
                Image = CreditMemo;
                RunObject = Page "Service Credit Memo";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new service credit memo for the customer.';
            }
            action(NewReminder)
            {
                ApplicationArea = Suite;
                Caption = 'Reminder';
                Image = Reminder;
                RunObject = Page Reminder;
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new reminder for the customer.';
                AboutTitle = 'Create a new document';
                AboutText = 'Get started on a new reminder, order, or other document for the customer selected in the list.';
            }
            action(NewFinChargeMemo)
            {
                ApplicationArea = Suite;
                Caption = 'Finance Charge Memo';
                Image = FinChargeMemo;
                RunObject = Page "Finance Charge Memo";
                RunPageLink = "Customer No." = FIELD("No.");
                RunPageMode = Create;
                ToolTip = 'Create a new finance charge memo.';
            }
        }
        area(processing)
        {
#if not CLEAN20
            group(Action104)
            {
                Caption = 'History';
                Image = History;
                ObsoleteState = Pending;
                ObsoleteReason = 'Duplicated action of CustomerLedgerEntries';
                ObsoleteTag = '20.0';
#if not CLEAN19
                action(CustomerLedgerEntriesHistory)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    RunObject = Page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = FIELD("No.");
                    RunPageView = SORTING("Customer No.");
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Duplicated action of CustomerLedgerEntries';
                    ObsoleteTag = '19.0';
                }
#endif
            }
#endif
            group(PricesAndDiscounts)
            {
                Caption = 'Prices & Discounts';
                action(Prices_InvoiceDiscounts)
                {
                    ApplicationArea = Advanced;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Cust. Invoice Discounts";
                    RunPageLink = Code = FIELD("Invoice Disc. Code");
                    Scope = Repeater;
                    ToolTip = 'Set up different discounts applied to invoices for the selected customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
                }
                action(PriceLists)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Price Lists';
                    Image = Price;
                    Scope = Repeater;
                    Visible = ExtendedPriceEnabled;
                    ToolTip = 'View or set up sales price lists for products that you sell to the customer. A product price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        PriceUXManagement: Codeunit "Price UX Management";
                    begin
                        PriceUXManagement.ShowPriceLists(Rec, "Price Amount Type"::Any);
                    end;
                }
                action(PriceLines)
                {
                    AccessByPermission = TableData "Sales Price Access" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Prices';
                    Image = Price;
                    Scope = Repeater;
                    Visible = ExtendedPriceEnabled;
                    ToolTip = 'View or set up sales price lines for products that you sell to the customer. A product price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        PriceSource: Record "Price Source";
                        PriceUXManagement: Codeunit "Price UX Management";
                    begin
                        Rec.ToPriceSource(PriceSource);
                        PriceUXManagement.ShowPriceListLines(PriceSource, "Price Amount Type"::Price);
                    end;
                }
                action(DiscountLines)
                {
                    AccessByPermission = TableData "Sales Discount Access" = R;
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Discounts';
                    Image = LineDiscount;
                    Scope = Repeater;
                    Visible = ExtendedPriceEnabled;
                    ToolTip = 'View or set up different discounts for products that you sell to the customer. A product line discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';

                    trigger OnAction()
                    var
                        PriceSource: Record "Price Source";
                        PriceUXManagement: Codeunit "Price UX Management";
                    begin
                        Rec.ToPriceSource(PriceSource);
                        PriceUXManagement.ShowPriceListLines(PriceSource, "Price Amount Type"::Discount);
                    end;
                }
#if not CLEAN21
                action(PriceListsDiscounts)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Price Lists (Discounts)';
                    Image = LineDiscount;
                    Visible = false;
                    ToolTip = 'View or set up different discounts for products that you sell to the customer. A product line discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action PriceLists shows all sales price lists with prices and discounts';
                    ObsoleteTag = '18.0';

                    trigger OnAction()
                    var
                        PriceUXManagement: Codeunit "Price UX Management";
                        AmountType: Enum "Price Amount Type";
                    begin
                        PriceUXManagement.ShowPriceLists(Rec, AmountType::Discount);
                    end;
                }
                action(Prices_Prices)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Prices';
                    Image = Price;
                    Scope = Repeater;
                    Visible = not ExtendedPriceEnabled;
                    ToolTip = 'View or set up different prices for items that you sell to the selected customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';

                    trigger OnAction()
                    begin
                        ShowPrices();
                    end;
                }
                action(Prices_LineDiscounts)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    Scope = Repeater;
                    Visible = not ExtendedPriceEnabled;
                    ToolTip = 'View or set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';

                    trigger OnAction()
                    begin
                        ShowLineDiscounts();
                    end;
                }
#endif
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = (NOT OpenApprovalEntriesExist) AND EnabledApprovalWorkflowsExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckCustomerApprovalsWorkflowEnabled(Rec) then
                            ApprovalsMgmt.OnSendCustomerForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    begin
                        ApprovalsMgmt.OnCancelCustomerApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(Rec.RecordId);
                    end;
                }
            }
            group(Workflow)
            {
                Caption = 'Workflow';
                action(CreateApprovalWorkflow)
                {
                    ApplicationArea = Suite;
                    Caption = 'Create Approval Workflow';
                    Enabled = NOT EnabledApprovalWorkflowsExist;
                    Image = CreateWorkflow;
                    ToolTip = 'Set up an approval workflow for creating or changing customers, by going through a few pages that will guide you.';

                    trigger OnAction()
                    begin
                        PAGE.RunModal(PAGE::"Cust. Approval WF Setup Wizard");
                        SetWorkflowManagementEnabledState();
                    end;
                }
                action(ManageApprovalWorkflows)
                {
                    ApplicationArea = Suite;
                    Caption = 'Manage Approval Workflows';
                    Enabled = EnabledApprovalWorkflowsExist;
                    Image = WorkflowSetup;
                    ToolTip = 'View or edit existing approval workflows for creating or changing customers.';

                    trigger OnAction()
                    var
                        WorkflowManagement: Codeunit "Workflow Management";
                    begin
                        WorkflowManagement.NavigateToWorkflows(DATABASE::Customer, EventFilter);
                        SetWorkflowManagementEnabledState();
                    end;
                }
            }
            action("Cash Receipt Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cash Receipt Journal';
                Image = CashReceiptJournal;
                RunObject = Page "Cash Receipt Journal";
                ToolTip = 'Open the cash receipt journal to post incoming payments.';
            }
            action("Sales Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Journal';
                Image = Journals;
                RunObject = Page "Sales Journal";
                ToolTip = 'Post any sales transaction for the customer.';
            }
            action(ApplyTemplate)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Apply Template';
                Image = ApplyTemplate;
                ToolTip = 'Apply a template to update one or more entities with your standard settings for a certain type of entity.';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    CustomerTemplMgt: Codeunit "Customer Templ. Mgt.";
                begin
                    CurrPage.SetSelectionFilter(Customer);
                    CustomerTemplMgt.UpdateCustomersFromTemplate(Customer);
                end;
            }
            action(WordTemplate)
            {
                ApplicationArea = All;
                Caption = 'Apply Word Template';
                ToolTip = 'Apply a Word template on the selected records.';
                Image = Word;

                trigger OnAction()
                var
                    Customer: Record Customer;
                    WordTemplateSelectionWizard: Page "Word Template Selection Wizard";
                begin
                    CurrPage.SetSelectionFilter(Customer);
                    WordTemplateSelectionWizard.SetData(Customer);
                    WordTemplateSelectionWizard.RunModal();
                end;
            }
            action(Email)
            {
                ApplicationArea = All;
                Caption = 'Send Email';
                Image = Email;
                ToolTip = 'Send an email to this customer.';
                Enabled = CanSendEmail;

                trigger OnAction()
                var
                    TempEmailItem: Record "Email Item" temporary;
                    EmailScenario: Enum "Email Scenario";
                begin
                    TempEmailItem.AddSourceDocument(Database::Customer, Rec.SystemId);
                    TempEmailitem."Send to" := Rec."E-Mail";
                    TempEmailItem.Send(false, EmailScenario::Default);
                end;
            }
            action(PaymentRegistration)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Register Customer Payments';
                Image = Payment;
                RunObject = Page "Payment Registration";
                RunPageLink = "Source No." = FIELD("No.");
                ToolTip = 'Process your customer payments by matching amounts received on your bank account with the related unpaid sales invoices, and then post the payments.';
            }
#if not CLEAN21
            group(Display)
            {
                Caption = 'Display';
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Use the Personalization mode to hide and show this factbox.';
                ObsoleteTag = '21.0';
                action(ReportFactBoxVisibility)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show/Hide Power BI Reports';
                    Image = "Report";
                    ToolTip = 'Select if the Power BI FactBox is visible or not.';
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Use the Personalization mode to hide and show this factbox.';
                    ObsoleteTag = '21.0';

                    trigger OnAction()
                    begin
                        CurrPage."Power BI Report FactBox".PAGE.SetFactBoxVisibility(PowerBIVisible);
                    end;
                }
            }
#endif
        }
        area(reporting)
        {
            group(Reports)
            {
                Caption = 'Reports';
                group(SalesReports)
                {
                    Caption = 'Sales Reports';
                    Image = "Report";
                    action(ReportCustomerTop10List)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - Top 10 List';
                        Image = "Report";
                        RunObject = Report "Customer - Top 10 List";
                        ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
                    }
                    action(ReportCustomerSalesList)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - Sales List';
                        Image = "Report";
                        RunObject = Report "Customer - Sales List";
                        ToolTip = 'View customer sales for a period, for example, to report sales activity to customs and tax authorities. You can choose to include only customers with total sales that exceed a minimum amount. You can also specify whether you want the report to show address details for each customer.';
                    }
                    action(ReportSalesStatistics)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Sales Statistics';
                        Image = "Report";
                        RunObject = Report "Sales Statistics";
                        ToolTip = 'View customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.';
                    }
                }
                group(FinanceReports)
                {
                    Caption = 'Finance Reports';
                    Image = "Report";
                    action(Statement)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Statement';
                        Image = "Report";
                        RunObject = Report "Customer Statement";
                        ToolTip = 'View a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';
                    }
                    action(BackgroundStatement)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Scheduled Statements';
                        Image = "Report";
                        ToolTip = 'Schedule Customer Statements in the Job Queue.';

                        trigger OnAction()
                        var
                            CustomerLayoutStatement: Codeunit "Customer Layout - Statement";
                        begin
                            //CustomerLayoutStatement.EnqueueReport();
                        end;
                    }
                    action(ReportCustomerBalanceToDate)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - Balance to Date';
                        Image = "Report";
                        RunObject = Report "Customer - Balance to Date";
                        ToolTip = 'View a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
                    }
                    action(ReportCustomerTrialBalance)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Customer - Trial Balance';
                        Image = "Report";
                        RunObject = Report "Customer - Trial Balance";
                        ToolTip = 'View the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.';
                    }
                    action(ReportCustomerDetailTrial)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer - Detail Trial Bal.';
                        Image = "Report";
                        RunObject = Report "Customer - Detail Trial Bal.";
                        ToolTip = 'View the balance for customers with balances on a specified date. The report can be used at the close of an accounting period, for example, or for an audit.';
                    }
                    action(ReportCustomerSummaryAging)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Customer - Summary Aging';
                        Image = "Report";
                        RunObject = Report "Customer - Summary Aging";
                        ToolTip = 'View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
                    }
                    action(ReportCustomerDetailedAging)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Customer - Detailed Aging';
                        Image = "Report";
                        RunObject = Report "Customer Detailed Aging";
                        ToolTip = 'View, print, or save a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
                    }
                    action(ReportAgedAccountsReceivable)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Aged Accounts Receivable';
                        Image = "Report";
                        RunObject = Report "Aged Accounts Receivable";
                        ToolTip = 'View an overview of when customer payments are due or overdue, divided into four periods. You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
                    }
                    action(ReportCustomerPaymentReceipt)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Customer - Payment Receipt';
                        Image = "Report";
                        RunObject = Report "Customer - Payment Receipt";
                        ToolTip = 'View a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.';
                    }
                }
                action(Reminder)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Reminder';
                    Image = Reminder;
                    RunObject = Report Reminder;
                    ToolTip = 'Create a new reminder for the customer.';
                }
            }
            group(General)
            {
                Caption = 'General';
                action("Customer List")
                {
                    ApplicationArea = Suite;
                    Caption = 'Customer List';
                    Image = "Report";
                    RunObject = Report "Customer - List";
                    ToolTip = 'View various kinds of basic information for customers, such as customer posting group, discount group, finance charge and payment information, salesperson, the customer''s default currency and credit limit (in LCY), and the customer''s current balance (in LCY).';
                }
                action("Customer Register")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Register';
                    Image = "Report";
                    RunObject = Report "Customer Register";
                    ToolTip = 'View posted customer ledger entries divided into, and sorted according to, registers. By using a filter, you can select exactly the entries in the registers that you need to see. If you have created many entries and you do not set a filter, the report will print a large amount of information.';
                }
                action("Customer - Top 10 List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Top 10 List';
                    Image = "Report";
                    RunObject = Report "Customer - Top 10 List";
                    ToolTip = 'View which customers purchase the most or owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
                }
            }
            group(Sales)
            {
                Caption = 'Sales';
                Image = Sales;
                action("Customer - Order Summary")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Order Summary';
                    Image = "Report";
                    RunObject = Report "Customer - Order Summary";
                    ToolTip = 'View the order detail (the quantity not yet shipped) for each customer in three periods of 30 days each, starting from a selected date. There are also columns with orders to be shipped before and after the three periods and a column with the total order detail for each customer. The report can be used to analyze a company''s expected sales volume.';
                }
                action("Customer - Order Detail")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Order Detail';
                    Image = "Report";
                    RunObject = Report "Customer - Order Detail";
                    ToolTip = 'View a list of orders divided by customer. The order amounts are totaled for each customer and for the entire list. The report can be used, for example, to obtain an overview of sales over the short term or to analyze possible shipment problems.';
                }
                action("Customer - Sales List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer - Sales List';
                    Image = "Report";
                    RunObject = Report "Customer - Sales List";
                    ToolTip = 'View customer sales for a period, for example, to report sales activity to customs and tax authorities. You can choose to include only customers with total sales that exceed a minimum amount. You can also specify whether you want the report to show address details for each customer.';
                }
                action("Sales Statistics")
                {
                    ApplicationArea = Suite;
                    Caption = 'Sales Statistics';
                    Image = "Report";
                    RunObject = Report "Sales Statistics";
                    ToolTip = 'View customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.';
                }
                action("Customer/Item Sales")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer/Item Sales';
                    Image = "Report";
                    RunObject = Report "Customer/Item Sales";
                    ToolTip = 'View a list of item sales for each customer during a selected time period. The report contains information on quantity, sales amount, profit, and possible discounts. It can be used, for example, to analyze a company''s customer groups.';
                }
            }
            action("Customer - Due Payments")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer - Due Payments';
                Image = "Report";
                RunObject = Report "Customer - Due Payments";
                ToolTip = 'View a list of payments due from a particular customer sorted by due date.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(PaymentRegistration_Promoted; PaymentRegistration)
                {
                }
                actionref(Email_Promoted; Email)
                {
                }
                actionref(ApplyTemplate_Promoted; ApplyTemplate)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
            group(Category_Category6)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category5)
            {
                Caption = 'New Document', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(NewSalesQuote_Promoted; NewSalesQuote)
                {
                }
                actionref(NewSalesOrder_Promoted; NewSalesOrder)
                {
                }
                actionref(NewSalesInvoice_Promoted; NewSalesInvoice)
                {
                }
                actionref(NewSalesCrMemo_Promoted; NewSalesCrMemo)
                {
                }
                actionref(NewReminder_Promoted; NewReminder)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Customer', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(CustomerLedgerEntries_Promoted; CustomerLedgerEntries)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
                group(Category_Dimensions)
                {
                    Caption = 'Dimensions';
                    ShowAs = SplitButton;

                    actionref(DimensionsMultiple_Promoted; DimensionsMultiple)
                    {
                    }
                    actionref(DimensionsSingle_Promoted; DimensionsSingle)
                    {
                    }
                }
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
#if not CLEAN19
                actionref(SentEmails_Promoted; SentEmails)
                {
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action SentEmails moved under history';
                    ObsoleteTag = '19.0';
                }
#endif
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref(OnlineMap_Promoted; OnlineMap)
                {
                }

                separator(Navigate_Separator)
                {
                }

                actionref("C&ontact_Promoted"; "C&ontact")
                {
                }
                actionref("Sent Emails_Promoted"; "Sent Emails")
                {
                }
                actionref("Item &Tracking Entries_Promoted"; "Item &Tracking Entries")
                {
                }
                actionref("Item References_Promoted"; "Item References")
                {
                }
                actionref(Quotes_Promoted; Quotes)
                {
                }
                actionref(Orders_Promoted; Orders)
                {
                }
                actionref("Return Orders_Promoted"; "Return Orders")
                {
                }
#if not CLEAN21
                actionref("Cash Receipt Journal_Promoted"; "Cash Receipt Journal")
                {
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action is being demoted based on overall low usage.';
                    ObsoleteTag = '21.0';
                }
#endif
#if not CLEAN21
                actionref("Sales Journal_Promoted"; "Sales Journal")
                {
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action is being demoted based on overall low usage.';
                    ObsoleteTag = '21.0';
                }
#endif
            }
            group(Category_Category9)
            {
                Caption = 'Prices & Discounts', Comment = 'Generated from the PromotedActionCategories property index 8.';

#if not CLEAN21
                actionref(Prices_Prices_Promoted; Prices_Prices)
                {
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';
                }
#endif
#if not CLEAN21
                actionref(Prices_LineDiscounts_Promoted; Prices_LineDiscounts)
                {
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                    ObsoleteTag = '17.0';
                }
#endif
                actionref(PriceLists_Promoted; PriceLists)
                {
                }
                actionref(PriceLines_Promoted; PriceLines)
                {
                }
                actionref(DiscountLines_Promoted; DiscountLines)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(BackgroundStatement_Promoted; BackgroundStatement)
                {
                }
                actionref(Statement_Promoted; Statement)
                {
                }
                actionref("Customer - Order Summary_Promoted"; "Customer - Order Summary")
                {
                }
#if not CLEAN21
                actionref("Customer - Sales List_Promoted"; "Customer - Sales List")
                {
                    Visible = false;
                    ObsoleteState = Pending;
                    ObsoleteReason = 'Action is being demoted based on overall low usage.';
                    ObsoleteTag = '21.0';
                }
#endif
                actionref("Customer - Due Payments_Promoted"; "Customer - Due Payments")
                {
                }
            }
            group(Category_Synchronize)
            {
                Caption = 'Synchronize';
                Visible = CRMIntegrationEnabled or CDSIntegrationEnabled;

                group(Category_Coupling)
                {
                    Caption = 'Coupling';
                    ShowAs = SplitButton;

                    actionref(ManageCRMCoupling_Promoted; ManageCRMCoupling)
                    {
                    }
                    actionref(DeleteCRMCoupling_Promoted; DeleteCRMCoupling)
                    {
                    }
                    // actionref(MatchBasedCoupling_Promoted; MatchBasedCoupling)
                    // {
                    // }
                }
                actionref(CRMSynchronizeNow_Promoted; CRMSynchronizeNow)
                {
                }
                actionref(UpdateStatisticsInCRM_Promoted; UpdateStatisticsInCRM)
                {
                }
                actionref(CRMGotoAccount_Promoted; CRMGotoAccount)
                {
                }
                actionref(ShowLog_Promoted; ShowLog)
                {
                }
            }
        }
    }


    VAR
        SocialListeningSetupVisible: Boolean;
        SocialListeningVisible: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        EnabledApprovalWorkflowsExist: Boolean;
        EventFilter: Text;
        PowerBIServiceMgt: Codeunit "Power BI Service Mgt.";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        [InDataSet]
        CanSendEmail: Boolean;
        ExtendedPriceEnabled: Boolean;
        CDSIntegrationEnabled: Boolean;
        BlockedFilterApplied: Boolean;


#if not CLEAN21
        PowerBIVisible: Boolean;
#endif
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        IsOfficeAddin: Boolean;
        CaptionTxt: Text;

    trigger onInit()
    BEGIN
        SetCustomerNoVisibilityOnFactBoxes;
    END;

    trigger OnOpenPage()
    VAR
        CRMIntegrationManagement: Codeunit 5330;
    BEGIN
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;

        SetWorkflowManagementEnabledState;
    END;

    trigger OnAfterGetRecord()
    BEGIN
        SetSocialListeningFactboxVisibility;
    END;

    trigger OnAfterGetCurrRecord()
    VAR
        CRMCouplingManagement: Codeunit 5331;
    BEGIN
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RECORDID) AND CRMIntegrationEnabled;
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RECORDID);

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RECORDID);
    END;

    PROCEDURE GetSelectionFilter(): Text;
    VAR
        Cust: Record 18;
        SelectionFilterManagement: Codeunit 46;
    BEGIN
        CurrPage.SETSELECTIONFILTER(Cust);
        EXIT(SelectionFilterManagement.GetSelectionFilterForCustomer(Cust));
    END;

    PROCEDURE SetSelection(VAR Cust: Record 18);
    BEGIN
        CurrPage.SETSELECTIONFILTER(Cust);
    END;

    LOCAL PROCEDURE SetSocialListeningFactboxVisibility();
    VAR
    // SocialListeningMgt: Codeunit 871;
    BEGIN
        // SocialListeningMgt.GetCustFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    END;

    LOCAL PROCEDURE SetCustomerNoVisibilityOnFactBoxes();
    BEGIN
        // CurrPage.SalesHistSelltoFactBox.PAGE.SetCustomerNoVisibility(FALSE);
        // CurrPage.SalesHistBilltoFactBox.PAGE.SetCustomerNoVisibility(FALSE);
        // CurrPage.CustomerDetailsFactBox.PAGE.SetCustomerNoVisibility(FALSE);
        // CurrPage.CustomerStatisticsFactBox.PAGE.SetCustomerNoVisibility(FALSE);
    END;

    LOCAL PROCEDURE SetWorkflowManagementEnabledState();
    VAR
        WorkflowManagement: Codeunit 1501;
        WorkflowEventHandling: Codeunit 1520;
    BEGIN
        EventFilter := WorkflowEventHandling.RunWorkflowOnSendCustomerForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnCustomerChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::Customer, EventFilter);
    END;

    [Obsolete('Replaced by the new implementation (V16) of price calculation.', '17.0')]
    local procedure ShowPrices()
    var
        SalesPrice: Record "Sales Price";
    begin
        SalesPrice.SetCurrentKey("Sales Type", "Sales Code");
        SalesPrice.SetRange("Sales Type", SalesPrice."Sales Type"::Customer);
        SalesPrice.SetRange("Sales Code", Rec."No.");
        Page.Run(Page::"Sales Prices", SalesPrice);
    end;

    [Obsolete('Replaced by the new implementation (V16) of price calculation.', '17.0')]
    local procedure ShowLineDiscounts()
    var
        SalesLineDiscount: Record "Sales Line Discount";
    begin
        SalesLineDiscount.SetCurrentKey("Sales Type", "Sales Code");
        SalesLineDiscount.SetRange("Sales Type", SalesLineDiscount."Sales Type"::Customer);
        SalesLineDiscount.SetRange("Sales Code", Rec."No.");
        Page.Run(Page::"Sales Line Discounts", SalesLineDiscount);
    end;



}

Page 50501 "Productos Cliente"
{

    SourceTable = "Item Reference";
    SourceTableView = SORTING("Item No.", "Variant Code", "Unit of Measure", "Reference Type", "Reference Type No.", "Reference No.")
                    WHERE("Reference Type" = CONST(Customer));
    PageType = List;
    SourceTableTemporary = true;



    layout
    {

        area(Content)
        {


            repeater(Detalle)
            {

                Field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Item No.',
                     ESP = 'Nº Producto';
                    ToolTipML = ENU = 'The number that identifies the item.',
                     ESP = 'El número que identifica el producto.';
                }

                Field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Reference No.',
                     ESP = 'Nº Referencia';
                    ToolTipML = ENU = 'The number that identifies the reference.',
                     ESP = 'El número que identifica la referencia.';
                }

                Field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description',
                     ESP = 'Descripción';
                    ToolTipML = ENU = 'The description of the item.',
                     ESP = 'La descripción del producto.';
                }

                Field("Item Description"; Item.Description)
                {
                    ApplicationArea = All;
                    CaptionML = ESP = 'Descripción Producto';
                }

                Field("Sales Price Unit Price"; SalesPrice."Unit Price")
                {
                    ApplicationArea = All;
                    CaptionML = ESP = 'Precio';
                }

                Field("Reference Type No."; Rec."Reference Type No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Reference Type No.',
                           ESP = 'Cliente';
                }

            }
        }
    }

    VAR
        Item: Record 27;
        SalesPrice: Record 7002 TEMPORARY;
        SalesPriceCalcMgt: Codeunit 7000;
        Customer: Record 18;
        ItemCrossReference: Record "Item Reference";

    trigger OnOpenPage()
    BEGIN
        ItemCrossReference.COPYFILTERS(Rec);
        IF ItemCrossReference.FINDFIRST THEN
            REPEAT
                IF NOT Item.GET(ItemCrossReference."Item No.") THEN Item.INIT;
                CLEAR(SalesPriceCalcMgt);
                IF NOT Customer.GET(ItemCrossReference."Reference Type No.") THEN Customer.INIT;
                SalesPriceCalcMgt.FindSalesPrice(SalesPrice, ItemCrossReference."Reference Type No.", '', Customer."Customer Price Group", '',
                ItemCrossReference."Item No.", ItemCrossReference."Variant Code",
                ItemCrossReference."Unit of Measure", '', TODAY, FALSE);
                IF SalesPrice.FINDFIRST THEN BEGIN
                    Rec := ItemCrossReference;
                    IF SalesPrice."Unit Price" <> 0 THEN rEC.INSERT();
                END;
            UNTIL ItemCrossReference.NEXT = 0;
    END;

    trigger OnAfterGetRecord()
    BEGIN
        IF NOT Item.GET(Rec."Item No.") THEN Item.INIT;
        IF Rec.Description <> '' THEN Item.Description := Rec.Description;
        CLEAR(SalesPriceCalcMgt);
        IF NOT Customer.GET(Rec."Reference Type No.") THEN Customer.INIT;
        SalesPriceCalcMgt.FindSalesPrice(SalesPrice, Rec."Reference Type No.", '', Customer."Customer Price Group", '',
        Rec."Item No.", Rec."Variant Code",
        Rec."Unit of Measure", '', TODAY, FALSE);
        SalesPriceCalcMgt.CopySalesPrice(SalesPrice);
    END;

    trigger OnAfterGetCurrRecord()
    BEGIN
        IF NOT Item.GET(Rec."Item No.") THEN Item.INIT;
        IF Rec.Description <> '' THEN Item.Description := Rec.Description;
        CLEAR(SalesPriceCalcMgt);
        IF NOT Customer.GET(Rec."Reference Type No.") THEN Customer.INIT;
        SalesPriceCalcMgt.FindSalesPrice(SalesPrice, Rec."Reference Type No.", '', Customer."Customer Price Group", '',
        Rec."Item No.", Rec."Variant Code",
        Rec."Unit of Measure", '', TODAY, FALSE);
        SalesPriceCalcMgt.CopySalesPrice(SalesPrice);
    END;
}

Page 50981 "Service Item List Andreu"
{

    Editable = false;
    CaptionML = ENU = 'Service Item List',
               ESP = 'Lista producto servicio';
    SourceTable = "Service Item";
    PageType = List;
    CardPageID = "Service Item Card";
    RefreshOnActivate = true;

    layout
    {

        area(Content)
        {


            repeater(Detalle)
            {

                Field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU = 'Contains the number of the item.',
                           ESP = 'Contiene el n£mero del producto.';
                }

                Field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTipML = ENU = 'Contains a description of this item.',
                           ESP = 'Contiene una descripción de este producto.';
                }

                Field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU = 'Contains the number of the customer who owns this item.',
                           ESP = 'Contiene el n£mero del cliente propietario de este producto.';
                }

                Field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU = 'Contains the ship-to code for the customer who owns this item.',
                           ESP = 'Contiene el código de dirección envío del cliente propietario de este producto.';
                }

            }
        }
        area(FactBoxes)
        {

            systempart(RecordLinks; Links)
            {
                ApplicationArea = All;
                Visible = FALSE;
            }

            systemPart(Notes; Notes)
            {
                ApplicationArea = All;
            }

        }
    }
    ACTIONS
    {
        area(Processing)
        {


            Group("&Service Item")
            {
                CaptionML = ENU = '&Service Item',
                                 ESP = '&Producto servicio';
                Image = ServiceItem;
                action("Com&ponent List")
                {
                    ApplicationArea = All;
                    Caption = 'Com&ponent List';
                    Image = Components;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = CONST(true),
                                  "Parent Service Item No." = FIELD("No.");
                    RunPageView = SORTING(Active, "Parent Service Item No.", "Line No.");
                    ToolTip = 'View the list of components in the service item.';
                }
                Group(Dimensions)
                {
                    CaptionML = ENU = 'Dimensions',
                                 ESP = 'Dimensiones';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = All;
                        ShortCutKey = 'Shift+Ctrl+D';
                        CaptionML = ENU = '&Dimensions-Single',
                                 ESP = 'Dimensiones-&Individual';
                        RunObject = Page 540;
                        RunPageLink = "Table ID" = CONST(5940),
                                  "No." = FIELD("No.");
                        Image = Dimensions;
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = All;
                        AccessByPermission = TableData 348 = R;
                        CaptionML = ENU = 'Dimensions-&Multiple',
                                 ESP = 'Dimensiones-&M£ltiple';
                        ToolTipML = ENU = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.',
                                 ESP = 'Permite ver o editar dimensiones para un grupo de registros. Se pueden asignar códigos de dimensión a transacciones para distribuir los costes y analizar la información histórica.';
                        Image = DimensionSets;
                        trigger OnAction()
                        var
                            ServiceItem: Record "Service Item";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(ServiceItem);
                            DefaultDimMultiple.SetMultiRecord(ServiceItem, Rec.FieldNo("No."));
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                Group(Estadísticas)
                {
                    CaptionML = ENU = 'Statistics',
                                 ESP = 'Estadísticas';
                    Image = Statistics;
                    action("Statistics")
                    {
                        ApplicationArea = All;
                        ShortCutKey = F7;
                        CaptionML = ENU = 'Statistics',
                                 ESP = 'Estadísticas';
                        RunObject = Page 5982;
                        RunPageLink = "No." = FIELD("No.");
                        Promoted = true;
                        Image = Statistics;
                        PromotedCategory = Process;
                    }
                    action("Tr&endscape")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Tr&endscape',
                                 ESP = 'Tr&endscape';
                        RunObject = Page 5983;
                        RunPageLink = "No." = FIELD("No.");
                        Image = Trendscape;
                    }
                }
                Group(roubleshooting)
                {
                    CaptionML = ENU = 'Troubleshooting',
                                 ESP = 'Solución de problemas';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Troubleshooting Setup',
                                 ESP = 'Config. detección errores';
                        RunObject = Page 5993;
                        RunPageLink = Type = CONST("Service Item"),
                                  "No." = FIELD("No.");
                        Promoted = true;
                        Image = Troubleshoot;
                        PromotedCategory = Process;
                    }
                    action("Solución de problemas")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Troubleshooting',
                                 ESP = 'Solución de problemas';
                        Image = Troubleshoot;
                        trigger OnAction()
                        VAR
                            TroubleshootingHeader: Record 5943;
                        BEGIN
                            TroubleshootingHeader.ShowForServItem(Rec);
                        END;
                    }
                    action("Resource Skills")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Resource Skills',
                                 ESP = 'Cualificaciones recurso';
                        RunObject = Page 6019;
                        RunPageLink = Type = CONST("Service Item"),
                                  "No." = FIELD("No.");
                        Image = ResourceSkills;
                    }
                    action("S&killed Resources")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'S&killed Resources',
                                 ESP = '&Recursos cualificados';
                        Image = ResourceSkills;
                        trigger OnAction()
                        var
                            SkilledResourceList: Page "Skilled Resource List";
                            ResourceSkill: Record "Resource Skill";
                        BEGIN
                            CLEAR(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item", Rec."No.", Rec.Description);
                            SkilledResourceList.RUNMODAL;
                        END;
                    }
                    action("Co&mments")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Co&mments',
                                 ESP = 'C&omentarios';
                        RunObject = Page 5911;
                        RunPageLink = "Table Name" = CONST("Service Item"),
                                  "Table Subtype" = CONST(0),
                                  "No." = FIELD("No.");
                        Image = ViewComments;
                    }
                }
                Group(Documents)
                {
                    CaptionML = ENU = 'Documents',
                                 ESP = 'Documentos';
                    Image = Documents;
                    Group("S&ervice Orders")
                    {
                        CaptionML = ENU = 'S&ervice Orders',
                                 ESP = 'P&edidos servicio';
                        Image = Order;
                        action("&Item Line")
                        {
                            ApplicationArea = All;
                            CaptionML = ENU = '&Item Lines',
                                 ESP = 'Líns. &prod.';
                            RunObject = Page 5903;
                            RunPageView = SORTING("Service Item No.", "Line No.");

                            RunPageLink = "Service Item No." = FIELD("No.");
                            Image = ItemLines;
                        }
                        action("&Service Lines")
                        {
                            ApplicationArea = All;
                            CaptionML = ENU = '&Service Lines',
                                 ESP = 'Líneas &servicio';
                            RunObject = Page 5904;
                            RunPageView = SORTING("Service Item No.", "Line No.");

                            RunPageLink = "Service Item No." = FIELD("No.");
                            Image = ServiceLines;
                        }
                    }
                    Group("Service Shi&pments")
                    {
                        CaptionML = ENU = 'Service Shi&pments',
                                 ESP = '&Envíos servicio';
                        Image = Shipment;
                        action("&Item Lines")
                        {
                            ApplicationArea = All;
                            CaptionML = ENU = '&Item Lines',
                                 ESP = 'Líns. &prod.';
                            RunObject = Page 5950;
                            RunPageView = SORTING("Service Item No.", "Line No.");

                            RunPageLink = "Service Item No." = FIELD("No.");
                            Image = ItemLines;
                        }
                        action("&Service Line")
                        {
                            ApplicationArea = All;
                            CaptionML = ENU = '&Service Lines',
                                 ESP = 'Líneas &servicio';
                            RunObject = Page 5949;
                            RunPageView = SORTING("Service Item No.", "Line No.");

                            RunPageLink = "Service Item No." = FIELD("No.");
                            Image = ServiceLines;
                        }
                        action("Ser&vice Contracts")
                        {
                            ApplicationArea = All;
                            CaptionML = ENU = 'Ser&vice Contracts',
                                 ESP = 'Con&tratos servicios';
                            RunObject = Page 6075;
                            RunPageView = SORTING("Service Item No.", "Contract Status");
                            RunPageLink = "Service Item No." = FIELD("No.");
                            Promoted = true;
                            Image = ServiceAgreement;
                            PromotedCategory = Process;
                        }
                    }
                }
                Group(History)
                {
                    CaptionML = ENU = 'History',
                                 ESP = 'Historial';
                    Image = History;
                    action("Service Item Lo&g")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Service Item Lo&g',
                                 ESP = 'Lo&g prod. servicio';
                        RunObject = Page 5989;
                        RunPageLink = "Service Item No." = FIELD("No.");
                        Image = Log;
                    }
                    action("Service Ledger E&ntries")
                    {
                        ApplicationArea = All;
                        ShortCutKey = 'Ctrl+F7';
                        CaptionML = ENU = 'Service Ledger E&ntries',
                                 ESP = 'Movs. &servicio';
                        RunObject = Page 5912;
                        RunPageView = SORTING("Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", Type, "Posting Date");
                        RunPageLink = "Service Item No. (Serviced)" = FIELD("No."),
                                  "Service Order No." = FIELD("Service Order Filter"),
                                  "Service Contract No." = FIELD("Contract Filter"),
                                  "Posting Date" = FIELD("Date Filter");
                        Image = ServiceLedger;
                    }
                    action("&Warranty Ledger Entries")
                    {
                        CaptionML = ENU = '&Warranty Ledger Entries',
                                 ESP = 'Movs. &garantía';
                        RunObject = Page 5913;
                        RunPageView = SORTING("Service Item No. (Serviced)", "Posting Date", "Document No.");

                        RunPageLink = "Service Item No. (Serviced)" = FIELD("No.");
                        Image = WarrantyLedger;
                    }
                }
            }
        }


        area(Creation)
        {
            Group(New)
            {
                CaptionML = ENU = 'New',
                                 ESP = 'Nuevo';

                action("New Item")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'New Item',
                                 ESP = 'Nuevo producto';
                    RunObject = Page 30;
                    Promoted = true;
                    Image = NewItem;
                    PromotedCategory = New;
                    RunPageMode = Create;
                }
            }
        }
        area(Reporting)
        {
            action("Service Item")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Service Item',
                                 ESP = 'Producto servicio';
                RunObject = Report 5935;
                Promoted = true;
                Image = Report;
                PromotedCategory = Report;
            }
            action("Service Item Label")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Service Item Label',
                                 ESP = 'Etiqueta producto servicio';
                RunObject = Report 5901;
                Promoted = true;

                Image = Report;
                PromotedCategory = Report;
            }
            action("Service Item Resource usage")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Service Item Resource usage',
                                 ESP = 'Uso recurso productos servicio';
                RunObject = Report 5939;
                Promoted = true;
                Image = Report;
                PromotedCategory = Report;
            }
            action("Service Item Out of Warranty")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Service Item Out of Warranty',
                                 ESP = 'Producto de servicio fuera de garantía';
                RunObject = Report 5937;
                Promoted = true;
                Image = Report;
                PromotedCategory = Report;
            }
        }
    }


}

