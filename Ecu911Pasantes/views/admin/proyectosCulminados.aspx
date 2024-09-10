<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="proyectosCulminados.aspx.cs" Inherits="Ecu911Pasantes.views.admin.proyectosCulminados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Proyectos Culminados | Admin - Sistema Pasantes
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
                                <h4>Proyectos Culminados</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Proyectos Culminados</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <asp:GridView ID="grvCulminados" OnRowCommand="grvCulminados_RowCommand" EmptyDataText="No hay datos disponibles en la tabla." AutoGenerateColumns="false" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Cedula">
                                    <ItemTemplate>
                                        <asp:Label ID="Cedula" runat="server" Text='<%#Eval("Cedula")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellidos">
                                    <ItemTemplate>
                                        <asp:Label ID="Apellidos" runat="server" Text='<%#Eval("Apellidos")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombres">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombres" runat="server" Text='<%#Eval("Nombres")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horas a Cumplir">
                                    <ItemTemplate>
                                        <asp:Label ID="Nhoras" runat="server" Text='<%#Eval("Nhoras")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Horas cumplidas">
                                    <ItemTemplate>
                                        <asp:Label ID="HorasC" runat="server" Text='<%#Eval("HorasC")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Autorizar Certificado">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbActualizar" Width="16" Height="16" CommandArgument='<%#Eval("Labor_id")%>' CommandName="Autorizar" OnClientClick="return confirmActive(this);" runat="server"><i class="icon-copy fa fa-check"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="17px" />
                                    <ItemStyle Width="17px" />
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Descargar Certificado">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnbDescargar" Width="16" Height="16" ForeColor="Red" CommandArgument='<%#Eval("Pasantes_id")%>' CommandName="Descargar" runat="server"><i class="icon-copy fa fa-download"></i></asp:LinkButton>
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
            $('#<%=grvCulminados.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
    <script>
        var object = { status: false, ele: null };
        function confirmActive(ev) {
            if (object.status) { return true; };
            swal({
                title: "¿Estás seguro?",
                text: "Que autorizar el certificado",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                cancelButtonClass: "btn-info",
                confirmButtonText: "Si, Autorizo!",
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
