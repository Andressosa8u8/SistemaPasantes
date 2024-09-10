<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="responsables.aspx.cs" Inherits="Ecu911Pasantes.views.admin.responsables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Responsables | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Listado de responsables</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Listado de responsables</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-md-6 col-sm-12 text-right">
                            <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-primary btn-lg" runat="server" Text="Agregar Responsable" />
                        </div>
                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <asp:GridView ID="grvResponsables" AutoGenerateColumns="False" OnRowDataBound="grvResponsables_RowDataBound" EmptyDataText="No hay datos disponibles en la tabla." CssClass="table table-centered w-100 dt-responsive nowrap" OnRowCommand="grvResponsables_RowCommand" GridLines="None" Width="100%" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Cedula">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblCedula" CommandArgument='<%#Eval("Usu_id")%>' CommandName="Detalles" runat="server"><asp:Label ID="Cedula" runat="server" Text='<%#Eval("Cedula")%>'></asp:Label></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombres">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombres" runat="server" Text='<%#Eval("Nombres")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellidos">
                                    <ItemTemplate>
                                        <asp:Label ID="Apellidos" runat="server" Text='<%#Eval("Apellidos")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Area">
                                    <ItemTemplate>
                                        <asp:Label ID="Area" runat="server" Text='<%#Eval("Area")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cargo">
                                    <ItemTemplate>
                                        <asp:Label ID="Cargo" runat="server" Text='<%#Eval("Cargo")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="Estado" runat="server" Text='<%#Eval("Estado")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEditar" Width="16" Height="16" CommandArgument='<%#Eval("Usu_id")%>' CommandName="Editar" runat="server"><i class="icon-copy dw dw-edit2"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEliminar" Width="16" Height="16" ForeColor="Red" CommandArgument='<%#Eval("Usu_id")%>' CommandName="Eliminar" OnClientClick="return confirmDelete(this);" runat="server"><i class="icon-copy dw dw-delete-3"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="grvResponsables"/>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript">
        $('document').ready(function () {
            $('#<%=grvResponsables.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                scrollCollapse: true,
                autoWidth: true,
                responsive: true,
                columnDefs: [{
                    targets: "datatable-nosort",
                    orderable: true,
                }],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                "language": {
                    "info": "Mostrando _START_-_END_ de _TOTAL_ Registros",
                    "zeroRecords": "No se encontró nada - lo siento",
                    "lengthMenu": "Mostrar _MENU_ Registros por página",
                    "emptyTable": "No hay datos disponibles en la tabla",
                    "search": "Buscar:",
                    searchPlaceholder: "Buscar",
                    paginate: {
                        next: '<i class="ion-chevron-right"></i>',
                        previous: '<i class="ion-chevron-left"></i>'
                    }
                },
            });
        });
    </script>
    <script>
        var object = { status: false, ele: null };
        function confirmDelete(ev) {
            if (object.status) { return true; };
            swal({
                title: "¿Estás seguro?",
                text: "Que desea eliminar este registro",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                cancelButtonClass: "btn-info",
                confirmButtonText: "Si, Borralo!",
                cancelButtonText: "Cancelar",
                closeOnConfirm: true
            },
                function () {
                    object.status = true;
                    object.ele = ev;
                    object.ele.click();
                });
            return false;
        };
    </script>
</asp:Content>

