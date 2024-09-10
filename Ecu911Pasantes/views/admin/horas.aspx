<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="horas.aspx.cs" Inherits="Ecu911Pasantes.views.admin.horas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Horas | Admin - Sistema Pasantes
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
                                <h4>Listado de horas</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Listado de horas</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <asp:GridView ID="grvHoras" EmptyDataText="No hay datos disponibles en la tabla." OnRowCommand="grvHoras_RowCommand" AutoGenerateColumns="false" Width="100%" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Descipción">
                                    <ItemTemplate>
                                        <asp:Label ID="ConceptoH" runat="server" Text='<%#Eval("ConceptoH")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cantidad de Horas">
                                    <ItemTemplate>
                                        <asp:Label ID="Cantidad" runat="server" Text='<%#Eval("Cantidad")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pasante">
                                    <ItemTemplate>
                                        <asp:Label ID="Pasante" runat="server" Text='<%#Eval("Pasante")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="Fecha" runat="server" Text='<%#Eval("Fecha")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Labor">
                                    <ItemTemplate>
                                        <asp:Label ID="ConceptoL" runat="server" Text='<%#Eval("ConceptoL")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="Estado" runat="server" Text='<%#Eval("Estado")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Editar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEditar" Width="16" Height="16" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Editar" runat="server"><i class="icon-copy dw dw-edit2"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Eliminar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbEliminar" Width="16" Height="16" ForeColor="Red" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Eliminar" OnClientClick="return confirm('Esta seguro que desea eliminar este registro..')" runat="server"><i class="icon-copy dw dw-delete-3"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Actualizar">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbActualizar" Width="16" Height="16" ForeColor="Blue" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Actualizar" OnClientClick="return confirm('Esta seguro que desea validar esta hora..')" runat="server"><i class="icon-copy fa fa-check" aria-hidden="true"></i></asp:LinkButton>
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
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script>
        $('document').ready(function () {
            $('#<%=grvHoras.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                scrollCollapse: false,
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
