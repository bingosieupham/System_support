<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Site2.Master" AutoEventWireup="true" CodeBehind="FixError.aspx.cs" Inherits="System_support.Suporter.FixError" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script  type="text/javascript">
        var stateKhachHang = {};
        var stateKhachHang1 = {};
        var stateKhachHang3 = {};

        
        function KH_Sua(element, key) {
            var maQuanLy = GridView1Client.GetRowKey(key);
            GridView1Client.GetRowValues(key, "ID", function (result) {
                stateKhachHang = { state: "EDIT", key: maQuanLy };
                var args = 'LOAD_EDIT';
                $('#hdfmaquanly').val(maQuanLy);
                CBCNV_1_client.SetContentHtml("");
                CBCNV_1_client.PerformCallback(args);
                // alert($('#hdfmaquanly').val());
                $('#CBCNV_1').modal('show');
            });
        }
        function KH_Sua1(element, key) {
            var maQuanLy1 = key;
            GridView2Client.GetRowValues(key, "ID_detail", function (result) {
                stateKhachHang1 = { state: "EDIT", key: maQuanLy1 };
                var args = 'LOAD_EDIT';
                $('#hdfmaquanly1').val(maQuanLy1);
                CBCNV_2_client.SetContentHtml("");
                CBCNV_2_client.PerformCallback(args);
                $("#check1").hide();
                // alert($('#hdfmaquanly').val());
                $('#CBCNV_2').modal('show');
            });
        }
        function KH_OnClickSave() {
            var stateKH = stateKhachHang.state;
            if (stateKH == "EDIT") {
                maQuanLy = stateKhachHang.key;
                args = "SAVE_EDIT|" + maQuanLy;
                CBCNV_1_client.PerformCallback(args);
            }
        }

         function KH_OnClickSave1() {
            var stateKH1 = stateKhachHang1.state;
            if (stateKH1 == "EDIT") {
                maQuanLy1 = stateKhachHang1.key;
                args = "SAVE_EDIT|" + maQuanLy1;
                CBCNV_2_client.PerformCallback(args);
            }
        }


      $(document).ready(function () {
            $('#them1').click(
                function () {
                    stateKhachHang3 = { state: "NEW" };
                    $('#CBCNV_3').modal('show');
                });
        });



        function KH_EndCallBack(s, e) {
            if (s.cpKhang) {
                switch (s.cpKhang) {
                    case "1":
                        $('#CBCNV_1').modal('hide');
                        GridView1Client.PerformCallback();
                        GridView3Client.PerformCallback();
                        GridView4Client.PerformCallback();
                        GridView5Client.PerformCallback();
                          GridView2Client.PerformCallback();
                        break;
                    case "0":
                        // $("#CBCNV_1").modal('hide');
                        alert("Lỗi cập nhật !");
                        break;
                    case "2":
                        $('#CBCNV_1').modal('hide');
                        alert("Đang có tình trạng xử lý chưa kết thúc");
                        break;
                }
                delete s.cpKhang;
            }
        }
        function KH_EndCallBack1(s, e) {
            if (s.cpKhang) {
                switch (s.cpKhang) {
                    case "1":
                        $('#CBCNV_2').modal('hide');
                        GridView2Client.PerformCallback();
                        GridView1Client.PerformCallback();
                        GridView3Client.PerformCallback();
                        GridView4Client.PerformCallback();
                         GridView5Client.PerformCallback();
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

        function KH_EndCallBack3(s, e) {
            if (s.cpKhang) {
                switch (s.cpKhang) {
                    case "1":
                        $('#CBCNV_3').modal('hide');
                        GridView2Client.PerformCallback();
                        GridView1Client.PerformCallback();
                        GridView3Client.PerformCallback();
                        GridView4Client.PerformCallback();
                         GridView5Client.PerformCallback();
                        break;
                    case "0":
                        // $("#CBCNV_1").modal('hide');
                        alert("Lỗi cập nhật !");
                        break;
                    case "2":
                        $('#CBCNV_3').modal('hide');
                        alert("Đang có tình trạng xử lý chưa kết thúc");
                        break;
                }
                delete s.cpKhang;
            }
        }

        function change(s, e) {
            //alert(element);
            if (s.GetSelectedItem().value == 4) {
                $("#check1").show();
                //alert(document.getElementById($('#check1')));
            }
            else if (s.GetSelectedItem().value == 8) {
                $("#check1").show();
            }
            else {
                 $("#check1").hide();
            }
          
        }

        function change1(s, e) {
            var x1 = s.GetSelectedItem().value;
            alert(x1);
            if (s.GetSelectedItem().value == 4) {
                $("#check2").show();
                $("#check3").show();
                //alert(document.getElementById($('#check1')));
            }
            else if (s.GetSelectedItem().value == 8) {
                $("#check2").show();
                $("#check3").show();
            }
            else if(s.GetSelectedItem().value == <%#  Eval("ID_st") %>)
                {
                $("#check2").hide();
                $("#check3").hide();
            }
            else {
                $("#check2").hide();
                $("#check3").show();
            }
        }
    </script>
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Theme="Office2010Blue">
        <Items>
            <dx:TabbedLayoutGroup>
                <Items>
                    <dx:LayoutGroup Caption="Process issue">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView runat="server" AutoGenerateColumns="False" EnableRowsCache="False" KeyFieldName="ID" ClientInstanceName="GridView1Client" DataSourceID="SqlDataSource1" Theme="Office2010Blue" Width="100%" ID="ASPxGridView1" OnCustomCallback="ASPxGridView1_CustomCallback">
                                            <SettingsDetail ShowDetailRow="True"></SettingsDetail>

                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Width="100%" ClientInstanceName="GridView2Client" EnablePagingGestures="False" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="Office2010Blue">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                        <SettingsText EmptyDataRow="Chưa có dữ liệu hiển thị !" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn FieldName="ID_detail" ReadOnly="True" VisibleIndex="0" Caption="ID chi tiết">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Visible="False">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Info_process" VisibleIndex="3" Caption="Ghi nhận th&#244;ng tin">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Reply_process" VisibleIndex="4" Caption="Phản hồi th&#244;ng tin">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="Create_date" VisibleIndex="6" Caption="Thời gian tạo">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_update" VisibleIndex="7" Caption="Người phản hồi">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" VisibleIndex="8" Caption="Thời gian phản hồi">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Name_status" VisibleIndex="2" Caption="Trạng th&#225;i">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_name" VisibleIndex="5" Caption="Người tạo">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status1" VisibleIndex="9" Caption="T&#236;nh trạng">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" VisibleIndex="16" Width="30px">
                                                                <DataItemTemplate>
                                                                    <div class="btn-group <%# (int)Eval("Status") > 0 ? "hidden" : "" %> ">
                                                                        <button type="button" class="btn btn-xs " data-toggle="tooltip" onclick="KH_Sua1(this,'<%# Eval("ID_detail") %>')" title="Sửa">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                        </button>
                                                                    </div>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:sqldatasource id="SqlDataSource11" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID) order by ND_detail_Issues.ID_detail ">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID_is" Type="Int32"/>
                                                        </SelectParameters>
                                                    </asp:sqldatasource>

                                                </DetailRow>
                                            </Templates>

                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>

                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="VirtualSmooth"></Settings>

                                            <SettingsBehavior AutoExpandAllGroups="True"></SettingsBehavior>

                                            <SettingsDataSecurity AllowInsert="False" AllowEdit="False" AllowDelete="False"></SettingsDataSecurity>

                                            <SettingsSearchPanel Visible="True"></SettingsSearchPanel>

                                            <SettingsText EmptyDataRow="Chưa c&#243; dữ liệu hiển thị !"></SettingsText>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Tên dự án" Visible="False"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Trạng thái"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Cấp độ" Width="50px">
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Phân hệ" Width="70px">
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Người tạo" Width="50px">
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Tiêu đề" Width="400px">
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Nội dung" Visible="False"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Phân loại" Width="50px"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Thời gian tạo">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime"></PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Thời gian kết thúc">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime"></PropertiesDateEdit>
                                                    <HeaderStyle Wrap="True" />
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Người xử lý" Width="50px">
                                                    <CellStyle Wrap="True">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ten_dv" ShowInCustomizationForm="True" Caption="Đơn vị" VisibleIndex="11"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Phone" ShowInCustomizationForm="True" Caption="Điện thoại" VisibleIndex="16" Visible="False"></dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Filekem1" ShowInCustomizationForm="True" Caption="File" VisibleIndex="5">
                                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText"></Settings>

                                                    <BatchEditModifiedCellStyle Wrap="True"></BatchEditModifiedCellStyle>
                                                    <DataItemTemplate>
                                                        <div>
                                                            <p class="text-primary text-bold">
                                                                <a href='../file/<%# Eval("TenFile")%>'><%#(String.IsNullOrEmpty(Eval("TenFile").ToString()) ? " " :   "File")%></a>
                                                            </p>
                                                        </div>

                                                    </DataItemTemplate>

                                                    <HeaderStyle Wrap="True"></HeaderStyle>

                                                    <CellStyle>
                                                        <BackgroundImage HorizontalPosition="center"></BackgroundImage>
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataColumn ShowInCustomizationForm="True" Name="colOpt_1" Width="30px" Caption=" " VisibleIndex="17">
                                                    <DataItemTemplate>
                                                        <div class="btn-group">
                                                            <button class="btn btn-xs" data-toggle="tooltip" onclick="KH_Sua(this,'<%# Container.VisibleIndex %>')" title="Sửa" type="button">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>

                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18"></dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem SummaryType="Count" FieldName="TenDT" DisplayFormat="Count  = {0}"></dx:ASPxSummaryItem>
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale ShowInColumn="Name_level" Format="RedYellowGreen" FieldName="ID_level"></dx:GridViewFormatConditionColorScale>
                                            </FormatConditions>

                                            <Styles>
                                                <Header Wrap="True"></Header>

                                                <Cell Wrap="True"></Cell>
                                                <FixedColumn HorizontalAlign="Center">
                                                </FixedColumn>
                                            </Styles>
                                        </dx:ASPxGridView>

                                        <asp:sqldatasource runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues left JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st NOT IN (4,8))" id="SqlDataSource1"></asp:sqldatasource>


                                    </dx:LayoutItemNestedControlContainer>
                                                 </LayoutItemNestedControlCollection>
                                           
                                  </dx:LayoutItem>
                   
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Assigned To Consultant">
                        <Items>
                            <dx:LayoutItem Caption="">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView3Client" DataSourceID="SqlDataSource13" EnableRowsCache="False" KeyFieldName="ID" OnCustomCallback="ASPxGridView3_CustomCallback" Theme="Office2010Blue" Width="100%">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView2Client" DataSourceID="SqlDataSource12" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="Office2010Blue" Width="100%">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
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
                                                            <dx:GridViewDataTextColumn FieldName="User_update" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" VisibleIndex="8">
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
                                                                        <button class="btn btn-xs " data-toggle="tooltip" onclick="KH_Sua1(this,'<%#  Eval("ID_detail") %>')" title="Sửa" type="button">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                        </button>
                                                                    </div>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:sqldatasource id="SqlDataSource12" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID) order by ND_detail_Issues.ID_detail">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID_is" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:sqldatasource>
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
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Dự &#225;n">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Trạng th&#225;i">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cấp độ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Ph&#226;n hệ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Người tạo">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Ti&#234;u đề">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nội dung">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Ph&#226;n loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ng&#224;y tạo">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Thời gian kết th&#250;c">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Người xử l&#253;">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" ShowInCustomizationForm="True" VisibleIndex="15">
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
                                                <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17" Width="30px">
                                                    <DataItemTemplate>
                                                        <div class="btn-group">
                                                            <button class="btn btn-xs" data-toggle="tooltip" onclick="KH_Sua(this,'<%# Container.VisibleIndex %>')" title="Sửa" type="button">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale FieldName="ID_level" Format="RedYellowGreen" ShowInColumn="Name_level" />
                                            </FormatConditions>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:sqldatasource id="SqlDataSource13" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st = 5)">
                                        </asp:sqldatasource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Assigned To Technical">
                        <Items>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxGridView ID="ASPxGridView5" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView4Client" DataSourceID="SqlDataSource15" EnableRowsCache="False" KeyFieldName="ID" OnCustomCallback="ASPxGridView5_CustomCallback" Theme="Office2010Blue" Width="100%">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView2Client" DataSourceID="SqlDataSource14" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="Office2010Blue" Width="100%">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
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
                                                            <dx:GridViewDataTextColumn FieldName="User_update" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" VisibleIndex="8">
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
                                                                        <button class="btn btn-xs " data-toggle="tooltip" onclick="KH_Sua1(this,'<%# (int)Eval("ID_detail") %>')" title="Sửa" type="button">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                        </button>
                                                                    </div>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:sqldatasource id="SqlDataSource14" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID) order by ND_detail_Issues.ID_detail">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID_is" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:sqldatasource>
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
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Dự &#225;n">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="T&#236;nh trạng">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cấp độ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Ph&#226;n hệ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Người tạo">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Ti&#234;u đề">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nội dung">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Ph&#226;n loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ng&#224;y tạo">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Thời gian kết th&#250;c">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Người xử l&#253;">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" ShowInCustomizationForm="True" VisibleIndex="15">
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
                                                <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17" Width="30px">
                                                    <DataItemTemplate>
                                                        <div class="btn-group">
                                                            <button class="btn btn-xs" data-toggle="tooltip" onclick="KH_Sua(this,'<%# Container.VisibleIndex %>')" title="Sửa" type="button">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale FieldName="ID_level" Format="RedYellowGreen" ShowInColumn="Name_level" />
                                            </FormatConditions>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:sqldatasource id="SqlDataSource15" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st = 6)">
                                        </asp:sqldatasource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                    <dx:LayoutGroup Caption="Fixed issue">
                        <Items>
                            <dx:LayoutItem Caption="Status">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" DataSourceID="SqlDataSource7" Theme="Office2010Blue" TextField="Name_status" ValueField="ID_st" AutoPostBack="True"></dx:ASPxComboBox>
                                        <asp:sqldatasource runat="server" id="SqlDataSource7" connectionstring='<%$ ConnectionStrings:Hotro_DVConnectionString %>' selectcommand="SELECT * FROM [DM_Issues_Status] WHERE [ID_st] in (4,8)"></asp:sqldatasource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                         <dx:ASPxGridView ID="ASPxGridView7" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridView5Client" DataSourceID="SqlDataSource8" KeyFieldName="ID" OnCustomCallback="ASPxGridView7_CustomCallback" Theme="Office2010Blue" Width="100%" EnableRowsCache="False">
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" KeyFieldName="ID_detail" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Width="100%" ClientInstanceName="GridView2Client" EnablePagingGestures="False" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="Office2010Blue">
                                                        <SettingsPager Visible="False">
                                                        </SettingsPager>
                                                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
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
                                                            <dx:GridViewDataTextColumn FieldName="User_update" VisibleIndex="7">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataDateColumn FieldName="update_date" VisibleIndex="8">
                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss">
                                                                </PropertiesDateEdit>
                                                            </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Name_status" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="User_name" VisibleIndex="5">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status1" VisibleIndex="9" Caption="Status">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" VisibleIndex="16" Width="30px" Visible="False">
                                                                <DataItemTemplate>
                                                                    <div class="btn-group <%# (int)Eval("Status") > 0 ? "hidden" : "" %> ">
                                                                        <button type="button" class="btn btn-xs " data-toggle="tooltip" onclick="KH_Sua1(this,'<%# Eval("ID_detail") %>')" title="Sửa">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                        </button>
                                                                    </div>
                                                                </DataItemTemplate>
                                                            </dx:GridViewDataColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="11">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:ASPxGridView>
                                                    <asp:sqldatasource id="SqlDataSource11" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT ND_detail_Issues.ID_detail, ND_detail_Issues.ID, ND_detail_Issues.Info_process, ND_detail_Issues.Reply_process, ND_detail_Issues.Create_date, ND_detail_Issues.update_date, DM_Issues_Status.Name_status, User_login.User_name, CASE ND_detail_Issues.Status WHEN 0 THEN N'Chưa xử lý' ELSE N'Đã xử lý' END AS Status1, ND_detail_Issues.Status, User_login_1.User_name AS User_update FROM ND_detail_Issues LEFT OUTER JOIN DM_Issues_Status ON ND_detail_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN User_login ON ND_detail_Issues.User_reciever = User_login.ID_nv LEFT OUTER JOIN User_login AS User_login_1 ON ND_detail_Issues.User_update = User_login_1.ID_nv WHERE (ND_detail_Issues.ID = @ID) order by ND_detail_Issues.ID_detail">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="ID" SessionField="ID_is" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:sqldatasource>
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
                                                <dx:GridViewDataTextColumn FieldName="Name_project" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Dự &#225;n">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_status" ShowInCustomizationForm="True" VisibleIndex="5" Caption="T&#236;nh trạng">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_level" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cấp độ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_module" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Ph&#226;n hệ">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_create" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="User_name" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Người tạo">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Title_issue" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Ti&#234;u đề">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Content_issue" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nội dung">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Name_Class" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Ph&#226;n loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Created_date" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ng&#224;y tạo">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Resolution_date" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Thời gian kết th&#250;c">
                                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm:ss" EditFormat="DateTime">
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Executor" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Người xử l&#253;">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TenFile" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Ten_dv" ShowInCustomizationForm="True" VisibleIndex="15">
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
                                                <dx:GridViewDataColumn Caption=" " Name="colOpt_1" ShowInCustomizationForm="True" VisibleIndex="17" Width="30px" Visible="False">
                                                    <DataItemTemplate>
                                                        <div class="btn-group">
                                                            <button class="btn btn-xs" data-toggle="tooltip" onclick="KH_Sua(this,'<%# Container.VisibleIndex %>')" title="Sửa" type="button">
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                        </div>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID_level" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>

                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Count  = {0}" FieldName="TenDT" SummaryType="Count" />
                                            </GroupSummary>
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionColorScale FieldName="ID_level" Format="RedYellowGreen" ShowInColumn="Name_level" />
                                            </FormatConditions>
                                            <Styles>
                                                <Header Wrap="True">
                                                </Header>
                                                <Cell Wrap="True">
                                                </Cell>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:sqldatasource id="SqlDataSource8" runat="server" connectionstring="<%$ ConnectionStrings:Hotro_DVConnectionString %>" selectcommand="SELECT DM_project.Name_project, DM_Issues_Status.Name_status, DM_Level.Name_level, DM_module.Name_module, User_login.User_name, ND_Issues.Title_issue, ND_Issues.ID, ND_Issues.Content_issue, DM_module_Class.Name_Class, ND_Issues.Created_date, ND_Issues.Resolution_date, ND_Issues.TenFile, DM_donvi.Ten_dv, User_login.Phone, User_login_1.User_name AS Executor, ND_Issues.ID_level FROM ND_Issues INNER JOIN DM_donvi ON ND_Issues.ID_dv = DM_donvi.ID_dv LEFT OUTER JOIN User_login AS User_login_1 ON ND_Issues.Executors = User_login_1.ID_nv LEFT OUTER JOIN DM_project ON ND_Issues.ID_Project = DM_project.ID_Project LEFT OUTER JOIN DM_Issues_Status ON ND_Issues.ID_st = DM_Issues_Status.ID_st LEFT OUTER JOIN DM_Level ON ND_Issues.ID_level = DM_Level.ID_level LEFT OUTER JOIN DM_module ON ND_Issues.ID_module = DM_module.ID_module LEFT OUTER JOIN User_login ON ND_Issues.User_create = User_login.ID_nv LEFT OUTER JOIN DM_module_Class ON ND_Issues.ID_class = DM_module_Class.ID_Class WHERE (ND_Issues.ID_st = (@id_stt))">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ASPxComboBox3" DefaultValue="8" Name="id_stt" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:sqldatasource>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:TabbedLayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
    
    
   
     <asp:HiddenField ClientIDMode="static" ID="hdfmaquanly" runat="server" />
     <asp:HiddenField ClientIDMode="static" ID="hdfmaquanly1" runat="server" />

    <div class="modal modal-primary fade" id="CBCNV_1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title primary font-110"><strong>
                           <label>X&#7917; lý thông tin</label> </strong></h4>
                    </div>
                      <div class="modal-body">
                      
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" OnCallback="ASPxCallbackPanel1_Callback" ClientInstanceName="CBCNV_1_client">
                             <ClientSideEvents EndCallback="KH_EndCallBack" />
                             <PanelCollection>
                                <dx:PanelContent ID="PanelContent4" runat="server">
                                    <div role="form">
                                        <div class="row"  style="margin-bottom:10px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label6" runat="server" Text="Tiêu đề"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%"></dx:ASPxTextBox>

                                                    </div>
                                            </div>
                                           <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label1" runat="server" Text="N&#7897;i dung"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo3" runat="server" Height="71px" Width="100%"></dx:ASPxMemo>

                                                    </div>
                                            </div>
                                         <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label2" runat="server" Text="Dự án"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                   <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="100%" ValueType="System.String" DataSourceID="SqlDataSource2" TextField="Name_project" ValueField="ID_Project"></dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_project] WHERE ([Status_project] = @Status_project)">
         <SelectParameters>
             <asp:Parameter DefaultValue="1" Name="Status_project" Type="Int32" />
         </SelectParameters>
    </asp:SqlDataSource>
                                                    </div>
                                               
                                            </div>
                                           <div class="row" style="margin-bottom:15px;">
                                               <div class="col-md-3"  >
                                                        <asp:Label ID="Label7" runat="server" Text="Phân hệ"></asp:Label>
                                                   </div>
                                                <div class="col-md-3" >
                                                   <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" Width="100%" ValueType="System.String" DataSourceID="SqlDataSource3" TextField="Name_module" ValueField="ID_module"></dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_module]"></asp:SqlDataSource>
    
                                                    </div>
                                               <div class="col-md-3"  >
                                                        <asp:Label ID="Label8" runat="server" Text="Phân loại"></asp:Label>
                                                   </div>
                                                <div class="col-md-3" >
                                                   <dx:ASPxComboBox ID="ASPxComboBox6" runat="server" Width="100%" ValueType="System.String" DataSourceID="SqlDataSource6" TextField="Name_Class" ValueField="ID_Class"></dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_module_Class]"></asp:SqlDataSource>
    
                                                    </div>
                                               </div>
                                      <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label3" runat="server" Text="Cấp độ"></asp:Label>
                                                   </div>
                                                <div class="col-md-3" >
                                                    <dx:ASPxComboBox ID="ASPxComboBox4" runat="server"  Width="100%" ValueType="System.String" DataSourceID="SqlDataSource4" TextField="Name_level" ValueField="ID_level"></dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_Level]"></asp:SqlDataSource>
    </div>
                                               <div class="col-md-3"  >
                                                        <asp:Label ID="Label4" runat="server" Text="Trạng thái"></asp:Label>
                                                   </div>
                                                <div class="col-md-3" >
                                                   <dx:ASPxComboBox ID="ASPxComboBox5" runat="server" Width="100%" ValueType="System.String" DataSourceID="SqlDataSource5" TextField="Name_status" ValueField="ID_st">
                                                       <ClientSideEvents SelectedIndexChanged="change" />
                                                   </dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_Issues_Status]"></asp:SqlDataSource>
    
                                                    </div>
                                            </div>              
                                      <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label9" runat="server" Text="Ghi nhận thông tin"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="100%" ></dx:ASPxMemo>

                                                    </div>
                                            </div>

                                      <div class="row" style="margin-bottom:15px;display: none;" id="check1">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label10" runat="server" Text="Phản hồi thông tin"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo2" runat="server" Height="71px" Width="100%" ></dx:ASPxMemo>

                                                    </div>
                                            </div>
                                        </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </div>
                    <div class="modal-footer">              
                        <button id="btnSave" type="button" onclick="KH_OnClickSave()" class="btn btn-primary">K&#7871;t thúc</button>
                        <%--<button id="btnSave1" type="button" onclick="KH_OnClickSave1()" class="btn btn-primary">Ghi thông tin ph&#7843;n h&#7891;i</button>
                        <button id="btnSave2" type="button" onclick="KH_OnClickSave2()" class="btn btn-primary">Chuy&#7875;n c&#7845;p trên</button>--%>
                        <button type="button" class="btn btn-default" data-dismiss="modal">&#272;óng</button>
                    </div>

                </div>
        </div>
        </div> 

     <div class="modal modal-primary fade" id="CBCNV_2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title primary font-110"><strong>
                           <label>Cập nhật chi tiết thông tin</label> </strong></h4>
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

                                           <div class="row" style="margin-bottom:15px;">
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label12" runat="server" Text="Cập nhật tình trạng"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxComboBox ID="ASPxComboBox7" runat="server" Width="100%" ValueType="System.String" DataSourceID="SqlDataSource9" TextField="Name_status" ValueField="ID_st">
                                                        <ClientSideEvents SelectedIndexChanged="change1" />
                                                    </dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Hotro_DVConnectionString %>" SelectCommand="SELECT * FROM [DM_Issues_Status] where id_st not in(1)"></asp:SqlDataSource>
    
                                            </div>
                                               </div>

                                           <div class="row" style="margin-bottom:15px;display: none;"  id="check3" >
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label13" runat="server" Text="Ghi nhận thông tin tình trạng mới"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo5" runat="server" Height="71px" Width="100%" ></dx:ASPxMemo>

                                                    </div>
                                            </div>
                                        <div class="row" style="margin-bottom:15px;display: none;" id="check2"   >
                                                   <div class="col-md-3"  >
                                                        <asp:Label ID="Label14" runat="server" Text="Phản hồi thông tin tình trạng mới"></asp:Label>
                                                   </div>
                                                <div class="col-md-9" >
                                                    <dx:ASPxMemo ID="ASPxMemo4" runat="server" Height="71px" Width="100%" ></dx:ASPxMemo>

                                                    </div>
                                            </div>
                                         </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </div>
                    <div class="modal-footer">              
                        <button id="btnSave1" type="button" onclick="KH_OnClickSave1()" class="btn btn-primary">Cập nhật</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">&#272;óng</button>
                    </div>

                </div>
        </div>
        </div> 


   
</asp:Content>
