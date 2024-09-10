<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="proyectos.aspx.cs" Inherits="Ecu911Pasantes.views.admin.proyectos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Proyectos | Admin - Sistema Pasantes
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
                                <h4>Listado de proyectos</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Listado de proyectos</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-md-6 col-sm-12 text-right">
                            <asp:Button ID="btnAgregar" OnClick="lnbAgregar_Click" CssClass="btn btn-primary btn-lg" runat="server" Text="Agregar Proyecto" />
                        </div>
                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <asp:GridView ID="grvProyectos" AutoGenerateColumns="False" EmptyDataText="No hay datos disponibles en la tabla." OnRowCommand="grvProyectos_RowCommand" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" Width="100%" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Eval("Nombre")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion">
                                    <ItemTemplate>
                                        <asp:Label ID="Descripcion" runat="server" Text='<%#Eval("Descripcion")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Responsables">
                                    <ItemTemplate>
                                        <asp:Label ID="Responsable" runat="server" Text='<%#Eval("Responsable")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="Estado" runat="server" Text='<%#Eval("Estado")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEditar" Width="16" Height="16" CommandArgument='<%#Eval("Proyecto_id")%>' CommandName="Editar" runat="server"><i class="icon-copy dw dw-edit2"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEliminar" Width="16" Height="16" ForeColor="Red" CommandArgument='<%#Eval("Proyecto_id")%>' CommandName="Eliminar" OnClientClick="return confirmDelete(this);" runat="server"><i class="icon-copy dw dw-delete-3"></i></asp:LinkButton>
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
            <asp:PostBackTrigger ControlID="grvProyectos"/>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script>
        $('document').ready(function () {
            $('#<%=grvProyectos.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                scrollCollapse: true,
                autoWidth: false,
                responsive: true,
                columnDefs: [{
                    targets: "datatable-nosort",
                    orderable: false,
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
</asp:Content>
