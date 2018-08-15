<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Site1.Master" AutoEventWireup="true" CodeBehind="Hotro.aspx.cs" Inherits="System_support.EndUser.Hotro" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
           var stateKhachHang1 = {};
         function onFileUploadStart(s, e) {
              uploadInProgress = true;
              uploadErrorOccurred = false;
              UploadedFilesTokenBox.SetIsValid(true);

          }

          function onFileUploadComplete(s, e) {
              var callbackData = e.callbackData.split("|"),
                  uploadedFileName = callbackData[0];
              $('#hdffile').val(uploadedFileName);
              alert("Tải file thành công !");
              uploadedFiles.push(uploadedFileName);


        }

          function KH_Sua1(element, key) {
             var maQuanLy1 = GridView2Client.GetRowKey(key);
            GridView2Client.GetRowValues(key, "ID_detail", function (result) {
                stateKhachHang1 = { state: "EDIT", key: maQuanLy1 };
                var args = 'LOAD_EDIT';
                $('#hdfmaquanly1').val(maQuanLy1);
                CBCNV_2_client.SetContentHtml("");
                CBCNV_2_client.PerformCallback(args);
                // alert($('#hdfmaquanly').val());
                $('#CBCNV_2').modal('show');
            });
        }
         function KH_OnClickSave1() {
            var stateKH1 = stateKhachHang1.state;
            if (stateKH1 == "EDIT") {
                maQuanLy1 = stateKhachHang1.key;
                args = "SAVE_EDIT|" + maQuanLy1;
                CBCNV_2_client.PerformCallback(args);
            }
        }
        function KH_EndCallBack1(s, e) {
            if (s.cpKhang) {
                switch (s.cpKhang) {
                    case "1":
                        $('#CBCNV_2').modal('hide');
                        GridView2Client.PerformCallback();
                        GridView3Client.PerformCallback();
                        break;
                    case "0":
                        // $("#CBCNV_1").modal('hide');
                        alert("Lỗi cập nhật !");
                        break;
                    case "2":
                         $('#CBCNV_2').modal('hide');
                        alert("Đang có tình trạng xử lý chưa kết thúc");
                        break;
                }
                delete s.cpKhang;
            }
        }
            </script>
    </script>
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%" Theme="Office2010Blue">
        <Items>
            <dx:TabbedLayoutGroup ActiveTabIndex="1" Width="100%">
                <Items>
                    <dx:LayoutGroup Caption="Cập nhật thông tin lỗi" ColCount="2">
                        <Items>
                            <dx:LayoutItem Caption="Thông tin lỗi" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Nội dung tin lỗi" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="100%">
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="File đính kèm">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="uploaderFilesDinhKem" Height="20px" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowUploadButton="True" Width="100%">
                                            <ClientSideEvents FileUploadComplete="onFileUploadComplete" />
                                            <UploadButton Text="Tải File">
                                            </UploadButton>
                                        </dx:ASPxUploadControl>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <asp:Label ID="Label19" runat="server" Font-Italic="True" Font-Names="arial" Font-Size="10pt" Font-Strikeout="False" ForeColor="#FF3300" Text="Nếu có nhiều tệp đính kèm, vui lòng tập hợp vào file .rar và upload"></asp:Label>
                                        <br />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cập nhật" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ColSpan="2" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView1Client" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Office2010Blue" Width="100%" Visible="False">
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />
                                            <SettingsBehavior AutoExpandAllGroups="True" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsSearchPanel Visible="True" />
                                            <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Dự án">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Trạng thái">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cấp độ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Phân hệ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Người tạo">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Tiêu đề">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nội dung">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Phân loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ngày tạo">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Thời gian kết thúc">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executors" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Người xử lý">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="File" FieldName="Filekem1" ShowInCustomizationForm="True" VisibleIndex="3" Width="20px">
                                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                                    <BatchEditModifiedCellStyle Wrap="True">
                                                    </BatchEditModifiedCellStyle>
                                                    <DataItemTemplate>
                                                        <div>
                                                            <p class="text-primary text-bold">
                                                                <a href='../file/<%# Eval("TenFile")%>'><%#(String.IsNullOrEmpty(Eval("TenFile").ToString()) ? " " :   "File")%></a>
                                                            </p>
                                                        </div>
                                                    </DataItemTemplate>
                                                    <HeaderStyle Wrap="True" />
                                                    <CellStyle>
                                                        <BackgroundImage HorizontalPosition="center" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <Styles>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, ND_Issues.User_create, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_Issues_Status.Name_status AS Expr1, DM_module_Class.Name_Class AS Expr2, ND_Issues.ID_st, User_login_1.User_name AS Executors FROM ND_Issues left JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv WHERE (ND_Issues.ID_dv = @donvi) AND (ND_Issues.ID_st NOT IN (4, 8))">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="donvi" SessionField="donvi" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Tình trạng xử lý">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="ID" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="Office2010Blue" Width="100%" EnableRowsCache="False">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView12" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView12_BeforePerformDataSelect" Width="100%" ClientInstanceName="GridView2Client" Theme="Office2010Blue" OnCustomCallback="ASPxGridView12_CustomCallback">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="ID_detail" ReadOnly="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Info_process" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Reply_process" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="Create_date" VisibleIndex="6">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_update" Visible="false" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" Visible="false" VisibleIndex="8">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Name_status" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_name" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status1" VisibleIndex="9" Caption="Status">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" VisibleIndex="16" Width="30px">
                                                    <DataItemTemplate>
                                                        <div class="btn-group <%# (int)Eval("Status") > 0 ? "hidden" : "" %> ">
                                                            <button type="button" class="btn btn-xs "  data-toggle="tooltip" onclick="KH_Sua1(this,'<%# Container.VisibleIndex %>')" title="Sửa" >
                                                                <i class="fa fa-location-arrow"></i>
                                                            </button>
                                                        </div>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </DetailRow>
                                            </Templates>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />
                                            <SettingsBehavior AutoExpandAllGroups="True" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsSearchPanel Visible="True" />
                                            <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Dự án">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Tình trạng">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cấp độ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Phân hệ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Người tạo">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Tiêu đề">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nội dung" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Phân loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ngày tạo">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Thời gian kết thúc">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Người xử lý">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" Visible="false" ShowInCustomizationForm="True" VisibleIndex="15">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Điện thoại" FieldName="Phone" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="File" FieldName="Filekem1" ShowInCustomizationForm="True" VisibleIndex="4" Width="20px">
                                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                                    <BatchEditModifiedCellStyle Wrap="True">
                                                    </BatchEditModifiedCellStyle>
                                                    <DataItemTemplate>
                                                        <div>
                                                            <p class="text-primary text-bold">
                                                                <a href='../file/<%# Eval("TenFile")%>'><%#(String.IsNullOrEmpty(Eval("TenFile").ToString()) ? " " :   "File")%></a>
                                                            </p>
                                                        </div>
                                                    </DataItemTemplate>
                                                    <HeaderStyle Wrap="True" />
                                                    <CellStyle>
                                                        <BackgroundImage HorizontalPosition="center" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                       
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale FieldName="ID_level" Format="RedWhiteBlue" ShowInColumn="Name_level" />
                                            </FormatConditions>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st IN (1,2,3,5,6,9) AND (ND_Issues.ID_dv = @id_dv))">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="id_dv" SessionField="donvi" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Fix/Dev" Visible="False">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView13" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" EnableRowsCache="False" KeyFieldName="ID" OnCustomCallback="ASPxGridView13_CustomCallback" Theme="Office2010Blue" Width="100%" ClientInstanceName="GridView3Client">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView14" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView2Client" DataSourceID="SqlDataSource12" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView12_BeforePerformDataSelect" OnCustomCallback="ASPxGridView12_CustomCallback" Theme="Office2010Blue" Width="100%">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="ID_detail" ReadOnly="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Info_process" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Reply_process" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="Create_date" VisibleIndex="6">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_update" Visible="false" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" Visible="false" VisibleIndex="8">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Name_status" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_name" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Status" FieldName="Status1" VisibleIndex="9">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" VisibleIndex="16" Width="30px">
                                                                <DataItemTemplate>
                                                                    <div class='btn-group <%# (int)Eval("Status") > 0 ? "hidden" : "" %> '>
                                                                        <button class="btn btn-xs " data-toggle="tooltip" onclick="KH_Sua1(this,'<%# Container.VisibleIndex %>')" title="Sửa" type="button">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                        </button>
                                                                    </div>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </DetailRow>
                                            </Templates>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />
                                            <SettingsBehavior AutoExpandAllGroups="True" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsSearchPanel Visible="True" />
                                            <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Dự án" FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tình trạng" FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Cấp độ" FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Phân hệ" FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Người tạo" FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Tiêu đề" FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nội dung" FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Phân loại" FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn Caption="Ngày tạo" FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn Caption="Thời gian kết thúc" FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="Người xử lý" FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Điện thoại" FieldName="Phone" ShowInCustomizationForm="True" VisibleIndex="16">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="File" FieldName="Filekem1" ShowInCustomizationForm="True" VisibleIndex="4" Width="20px">
                                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                                    <BatchEditModifiedCellStyle Wrap="True">
                                                    </BatchEditModifiedCellStyle>
                                                    <DataItemTemplate>
                                                        <div>
                                                            <p class="text-primary text-bold">
                                                                <a href='../file/<%# Eval("TenFile")%>'><%#(String.IsNullOrEmpty(Eval("TenFile").ToString()) ? " " :   "File")%></a>
                                                            </p>
                                                        </div>
                                                    </DataItemTemplate>
                                                    <HeaderStyle Wrap="True" />
                                                    <CellStyle>
                                                        <BackgroundImage HorizontalPosition="center" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale FieldName="ID_level" Format="RedWhiteBlue" ShowInColumn="Name_level" />
                                            </FormatConditions>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st = 7) AND (ND_Issues.ID_dv = @id_dv)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="id_dv" SessionField="donvi" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Đã xử lý">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView4Client" DataSourceID="SqlDataSource5" KeyFieldName="ID" OnCustomCallback="ASPxGridView4_CustomCallback" Theme="Office2010Blue" Width="100%">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" KeyFieldName="ID" OnBeforePerformDataSelect="ASPxGridView5_BeforePerformDataSelect" Width="100%">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="ID_detail" ReadOnly="True" VisibleIndex="0">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Info_process" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Reply_process" VisibleIndex="4">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="Create_date" VisibleIndex="6">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_update" Visible="false" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" Visible="false" VisibleIndex="8">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Name_status" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_name" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Status1" VisibleIndex="9" Caption="Status">
                                                            </dx:GridViewDataTextColumn>
                                                         
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID) and ND_detail_Issues.id_st in (3,4,8) order by ND_detail_Issues.ID_detail">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </DetailRow>
                                            </Templates>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />
                                            <SettingsBehavior AutoExpandAllGroups="True" />
                                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                            <SettingsSearchPanel Visible="True" />
                                            <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Name_project" Visible="false" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" ShowInCustomizationForm="True" VisibleIndex="15">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Phone" FieldName="Phone" ShowInCustomizationForm="True" VisibleIndex="16">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="File" FieldName="Filekem1" ShowInCustomizationForm="True" VisibleIndex="3" Width="20px">
                                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                                    <BatchEditModifiedCellStyle Wrap="True">
                                                    </BatchEditModifiedCellStyle>
                                                    <DataItemTemplate>
                                                        <div>
                                                            <p class="text-primary text-bold">
                                                                <a href='../file/<%# Eval("TenFile")%>'><%#(String.IsNullOrEmpty(Eval("TenFile").ToString()) ? " " :   "File")%></a>
                                                            </p>
                                                        </div>
                                                    </DataItemTemplate>
                                                    <HeaderStyle Wrap="True" />
                                                    <CellStyle>
                                                        <BackgroundImage HorizontalPosition="center" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st in (7,4,8)) AND (ND_Issues.ID_dv = @id_dv)  ">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="id_dv" SessionField="donvi" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:TabbedLayoutGroup>
        </Items>
</dx:ASPxFormLayout>
     <asp:HiddenField ClientIDMode="static" ID="hdffile" runat="server" />
      <asp:HiddenField ClientIDMode="static" ID="hdfmaquanly1" runat="server" />

     <div class="modal modal-primary fade" id="CBCNV_2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title primary font-110"><strong>
                           <label>X&#7917; lý thông tin</label> </strong></h4>
                    </div>
                      <div class="modal-body">
                      
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" OnCallback="ASPxCallbackPanel2_Callback" ClientInstanceName="CBCNV_2_client">
                             <ClientSideEvents EndCallback="KH_EndCallBack1" />
                             <PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server">
                                    <div role="form">
                                        <div class="row"  style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label5" runat="server" Text="Tiêu đề"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="" ForeColor="Red" width="100%" Wrap="True" ></dx:ASPxLabel>

                                                    </div>
                                            </div>
                                           <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label11" runat="server" Text="N&#7897;i dung"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="" ForeColor="Red" width="100%" Wrap="True"></dx:ASPxLabel>

                                                    </div>
                                            </div>
                      

                                      <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label17" runat="server" Text="Ghi nhận thông tin"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="" ForeColor="Red" width="100%" Wrap="True"></dx:ASPxLabel>

                                                    </div>
                                            </div>

                                      <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label18" runat="server" Text="Phản hồi thông tin"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo6" runat="server" Height="71px" Width="100%" ></dx:ASPxMemo>

                                                    </div>
                                            </div>
                                         </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </div>
                    <div class="modal-footer">              
                        <button id="btnSave" type="button" onclick="KH_OnClickSave1()" class="btn btn-primary">Cập nhật</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">&#272;óng</button>
                    </div>

                </div>
        </div>
        </div> 
</asp:Content>
