<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Site2.Master" AutoEventWireup="true" CodeBehind="Hotro1.aspx.cs" Inherits="System_support.Suporter.Hotro1" %>
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
            <dx:TabbedLayoutGroup ActiveTabIndex="0">
                <Items>
                    <dx:LayoutGroup Caption="Cập nhật thông tin lỗi" ColCount="2">
                        <Items>
                            <dx:LayoutItem Caption="Thông tin lỗi" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" NullText="Tiêu đề lỗi">
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Nội dung tin lỗi" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="100%" NullText="Nội dung lỗi">
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="File đính kèm" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="uploaderFilesDinhKem" Height="20px" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowUploadButton="True" Width="40%" NullText="Chọn file đính kèm">
                                            <ClientSideEvents FileUploadComplete="onFileUploadComplete" />
                                            <UploadButton Text="Tải File">
                                            </UploadButton>
                                        </dx:ASPxUploadControl>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tên dự án" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" NullText="Lựa chọn dự án" TextField="Name_project" ValueField="ID_Project" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_project] WHERE ([Status_project] = @Status_project)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Status_project" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Tên đơn vị" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox6" runat="server" DataSourceID="SqlDataSource7" NullText="Lựa chọn đơn vị" TextField="Ten_dv" ValueField="ID_dv" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_donvi] WHERE ([Status] = @Status)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="Status" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phân hệ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="SqlDataSource3" NullText="Lựa chọn phân hệ" TextField="Name_module" ValueField="ID_module" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_module]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Phân loại">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SqlDataSource4" NullText="Lựa chọn phân loại" TextField="Name_Class" ValueField="ID_Class" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_module_Class]">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="ID_st" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Cấp độ">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox4" runat="server" DataSourceID="SqlDataSource5" NullText="Lựa chọn cấp độ" TextField="Name_level" ValueField="ID_level" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_Level]"></asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Trạng thái">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox5" runat="server" DataSourceID="SqlDataSource6" NullText="Lựa chọn trạng thái" TextField="Name_status" ValueField="ID_st" Width="80%">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_Issues_Status] WHERE ([ID_st] = @ID_st)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="ID_st" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cập nhật" CssClass="btn btn-bricky animation-buttons" Width="103px" />
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
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView1Client" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="Office2010Blue" Width="100%">
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
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, ND_Issues.User_create, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_Issues_Status.Name_status AS Expr1, DM_module_Class.Name_Class AS Expr2, ND_Issues.ID_st, User_login_1.User_name AS Executors FROM ND_Issues left JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv WHERE  (ND_Issues.ID_st NOT IN (4, 8)) and ND_Issues.User_create =@user">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="user" SessionField="id_nv" />
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

</asp:Content>
