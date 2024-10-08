﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/responsable/responsable.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="Ecu911Pasantes.views.responsable.inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Inicio | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="title pb-20">
                <h2 class="h3 mb-0">Descripción general del sistema</h2>
            </div>
            <div class="row pb-10">
                <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                    <div class="card-box height-100-p widget-style3">
                        <div class="d-flex flex-wrap">
                            <div class="widget-data">
                                <div class="weight-700 font-24 text-dark">
                                    <asp:Label ID="lblUsuarios" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="font-14 text-secondary weight-500">Total de usuarios</div>
                            </div>
                            <div class="widget-icon">
                                <div class="icon" data-color="#00eccf"><i class="icon-copy dw dw-user"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                    <div class="card-box height-100-p widget-style3">
                        <div class="d-flex flex-wrap">
                            <div class="widget-data">
                                <div class="weight-700 font-24 text-dark">
                                    <asp:Label ID="lblResponsables" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="font-14 text-secondary weight-500">Total de responsables</div>
                            </div>
                            <div class="widget-icon">
                                <div class="icon" data-color="#ff5b5b"><span class="icon-copy dw dw-user1"></span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                    <div class="card-box height-100-p widget-style3">
                        <div class="d-flex flex-wrap">
                            <div class="widget-data">
                                <div class="weight-700 font-24 text-dark">
                                    <asp:Label ID="lblActivos" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="font-14 text-secondary weight-500">Total de pasantes activos</div>
                            </div>
                            <div class="widget-icon">
                                <div class="icon"><i class="icon-copy dw dw-user2" aria-hidden="true"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 mb-20">
                    <div class="card-box height-100-p widget-style3">
                        <div class="d-flex flex-wrap">
                            <div class="widget-data">
                                <div class="weight-700 font-24 text-dark">
                                    <asp:Label ID="lblInactivos" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="font-14 text-secondary weight-500">Pasantes inactivos</div>
                            </div>
                            <div class="widget-icon">
                                <div class="icon" data-color="#09cc06"><i class="icon-copy dw dw-user3" aria-hidden="true"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6 mb-30">
                    <%--<div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20">Total de pasantes por universidad</h2>
                        <div id="chart5"></div>
                    </div>--%>
                    <div class="pd-20 card-box height-100-p">
                        <h4 class="h4 text-blue">Total de pasantes por universidad</h4>
                        <div id="chart9"></div>
                    </div>
                </div>
                <div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20">Total de pasantes por carrera</h2>
                        <div id="chart6"></div>
                    </div>
                </div>
            </div>
            <div class="card-box pb-10">
                <div class="h5 pd-20 mb-0">Asistencias diarias</div>
                <asp:GridView ID="grvAsistencias" EmptyDataText="No hay datos disponibles en la tabla." runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="table nowrap" GridLines="None" Width="100%">
                    <Columns>
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
                        <asp:TemplateField HeaderText="Hora de Entrada">
                            <ItemTemplate>
                                <asp:Label ID="HoraEntrada" runat="server" Text='<%#Eval("HoraEntrada")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Hora de Salida">
                            <ItemTemplate>
                                <asp:Label ID="HoraSalida" runat="server" Text='<%#Eval("HoraSalida")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actividades Diarias">
                            <ItemTemplate>
                                <asp:Label ID="Actividades" runat="server" Text='<%#Eval("Actividades")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo">
                            <ItemTemplate>
                                <asp:Label ID="Tipo" runat="server" Text='<%#Eval("Tipo")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <br />
            <asp:Literal ID="ltChartData" runat="server"></asp:Literal>
            <asp:Literal ID="ltChartData1" runat="server"></asp:Literal>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script>
        var chartuniversidades;
        var chartPasantes;
        var options = {
            series: [{
                name: 'Total de Pasantes',
                data: chartPasantes
            }],
            chart: {
                type: 'bar',
                height: 390,
                toolbar: { show: false },
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '100%',
                    distributed: true
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            xaxis: {
                categories: chartuniversidades,
            },
            yaxis: {
                title: {
                    text: 'Total de Pasantes'
                }
            },
            fill: {
                opacity: 1
            },
            tooltip: {
                y: {
                    formatter: function (val) {
                        return val + " pasantes"
                    }
                }
            }
        };
        var chart = new ApexCharts(document.querySelector("#chart9"), options);
        chart.render();
    </script>
    <script>
        var chartcarreras;
        var TotalPasantes;
        var options6 = {
            chart: {
                height: 350,
                type: 'area',
                parentHeightOffset: 0,
                fontFamily: 'Poppins, sans-serif',
                toolbar: {
                    show: false,
                },
            },
            colors: ['#f56767', '#1b00ff'],
            grid: {
                borderColor: '#c7d2dd',
                strokeDashArray: 5,
            },
            stroke: {
                curve: 'monotoneCubic',
                width: 2
            },
            series: [{
                name: 'Pasantes',
                data: TotalPasantes
            }],
            xaxis: {
                categories: chartcarreras,
                axisBorder: {
                    color: '#8fa6bc',
                }
            },
            yaxis: {
                labels: {
                    style: {
                        colors: '#353535',
                        fontSize: '16px',
                    },
                },
            },
            legend: {
                horizontalAlign: 'right',
                position: 'top',
                fontSize: '16px',
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.7,
                    opacityTo: 0.9,
                }
            },
            tooltip: {
                style: {
                    fontSize: '15px',
                    fontFamily: 'Poppins, sans-serif',
                },
                y: {
                    formatter: function (val) {
                        return val + " pasantes"
                    }
                }
            }
        }
        var chart6 = new ApexCharts(document.querySelector("#chart6"), options6);
        chart6.render();
    </script>


    <script>
        $('document').ready(function () {
            $('#<%=grvAsistencias.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                destroy: true,
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

