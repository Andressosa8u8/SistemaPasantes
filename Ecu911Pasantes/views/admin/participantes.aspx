<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="participantes.aspx.cs" Inherits="Ecu911Pasantes.views.admin.participantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Participantes | Admin - Sistema Pasantes
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
                                <h4>Listado de participantes de un proyecto</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Listado de participantes de un proyecto</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <asp:GridView ID="grvParticipantes" EmptyDataText="No hay datos disponibles en la tabla." runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Apellido">
                                    <ItemTemplate>
                                        <asp:Label ID="PrimerApellido" runat="server" Text='<%#Eval("PrimerApellido")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="PrimerNombre" runat="server" Text='<%#Eval("PrimerNombre")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Universidad">
                                    <ItemTemplate>
                                        <asp:Label ID="Universidad" runat="server" Text='<%#Eval("Universidad")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Proyecto">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombre" runat="server" Text='<%#Eval("Nombre")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion del Proyecto">
                                    <ItemTemplate>
                                        <asp:Label ID="Descripcion" runat="server" Text='<%#Eval("Descripcion")%>'></asp:Label>
                                    </ItemTemplate>
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
            $('#<%=grvParticipantes.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
