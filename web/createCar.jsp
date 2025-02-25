

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.helper.pckg.databaseHelper"%>
<%@page import="app.model.pckg.Car"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Variables de conexión
    String url = "jdbc:mysql://localhost:3306/PriceAutoSales"; // Cambia según tu configuración
    String username = "root"; // Cambia según tu configuración
    String password = ""; // Cambia según tu configuración

    Connection conn = null;
    PreparedStatement stmtBrands = null, stmtModels = null, stmtFuelTypes = null;
    ResultSet rsBrands = null, rsModels = null, rsFuelTypes = null;

    try {
        // Conectar a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // Consultas para obtener datos de las tablas
        String queryBrands = "SELECT id, brand_name FROM Marcas";
        String queryModels = "SELECT id, model_name FROM Modelos";
        String queryFuelTypes = "SELECT id, fuel_name FROM FuelTypes";

        // Ejecutar las consultas
        stmtBrands = conn.prepareStatement(queryBrands);
        stmtModels = conn.prepareStatement(queryModels);
        stmtFuelTypes = conn.prepareStatement(queryFuelTypes);

        rsBrands = stmtBrands.executeQuery();
        rsModels = stmtModels.executeQuery();
        rsFuelTypes = stmtFuelTypes.executeQuery();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>





<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Price Auto Sales</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="css/site.css" rel="stylesheet" type="text/css"/>
    </head>
    
    
    
    <body>  
        
        
        
        
        
        
        
        
        
        
        <%
            String email = (String) session.getAttribute("email");

            if (email == null) {
                RequestDispatcher rd = request.getRequestDispatcher("errorHandler?message=You must log in first");
                rd.forward(request, response);
            }
        %>    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <div class="top-bar d-none d-xl-block">
            <div class="container d-flex justify-content-between">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><a href="mailto:contact@priceautoscr.com">contact@priceautoscr.com</a></li>
                    <li class="list-inline-item">Lun - Vie: 7:30am - 5:00pm</li>
                    <li class="list-inline-item">Ok 34, Provincia De Puntarenas, Costa Rica</li>
                </ul>
                <a class="btn btn-warning btn-sm" href="/contact">📅 Book A Virtual Tour</a>
            </div>
        </div>

        <!-- Menú principal -->
        <div class="header-main">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-auto">
                        <a class="navbar-brand" href="/">
                            <img src="https://www.priceautoscr.com/PriceAuto/assets/media/general/logo.png" alt="Price Auto Sales">
                        </a>
                    </div>
                    <div class="col-lg-auto col">
                        <div class="header-contacts d-none d-md-block">
                            <span>Welcome <%=email%></span>
                        </div>
                    </div>
                    <div class="col-lg d-none d-lg-block">
                        <nav class="navbar navbar-expand-md justify-content-end">
                            <ul class="navbar-nav">
                                <li class="nav-item active"><a class="nav-link" href="menu.jsp">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="/">Inventory</a></li>
                                <li class="nav-item"><a class="nav-link" href="/">About</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Services</a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/">Schedule Appointment</a>
                                    </div>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="/">Locations</a></li>
                                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <hr>

        
        
        
        
        
        
        <!-- Contenido de prueba -->
        <div class="d-flex justify-content-center align-items-center">
            <div class="card" style="width: 18rem;">  
                
                
                
                
                <div class="card-body">
                    <form action="createCarLogic.jsp">
                        
                        
                        
                        
                        
                       <div class="mb-3">
                            <label class="form-label">Marca</label>
                            <select name="selBrand" class="form-select" required>
                                <option value="" selected disabled>Seleccione una marca</option>
                                <% while (rsBrands.next()) { %>
                                    <option value="<%= rsBrands.getInt("id") %>"><%= rsBrands.getString("brand_name") %></option>
                                <% } %>
                            </select>
                        </div>

                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                       <div class="mb-3">
                            <label class="form-label">Modelo</label>
                            <select name="selModel" class="form-select" required>
                                <option value="" selected disabled>Seleccione un modelo</option>
                                <% while (rsModels.next()) { %>
                                    <option value="<%= rsModels.getInt("id") %>"><%= rsModels.getString("model_name") %></option>
                                <% } %>
                            </select>
                        </div>
                            
                            
                            
                            
                            
                        <div class="mb-3">
                            <select name="selYear" class="form-select" aria-label="Select your manufacture year">
                                <option selected>Select your manufacture year</option>
                                <option value="2024">2024</option>
                                <option value="2023">2023</option>
                                <option value="2022">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                            </select> 
                        </div>   
                        <div class="mb-3">
                            <label for="txtColor" class="form-label">Color</label>
                            <input type="text" class="form-control" name="txtColor">
                        </div>     
                        <div class="mb-3">
                            <label for="txtEngine" class="form-label">CC Engine</label>
                            <input type="number" class="form-control" name="txtEngine">
                        </div>  
                            
                            
                            
                         <div class="mb-3">
                                <label class="form-label">Tipo de combustible</label>
                                <select name="selFuelType" class="form-select" required>
                                    <option value="" selected disabled>Seleccione el tipo de combustible</option>
                                    <% while (rsFuelTypes.next()) { %>
                                        <option value="<%= rsFuelTypes.getInt("id") %>"><%= rsFuelTypes.getString("fuel_name") %></option>
                                    <% } %>
                                </select>
                            </div>
                            
                            
                            
                        <div class="mb-3">
                            <label for="txtMileage" class="form-label">Mileage</label>
                            <input type="number" class="form-control" name="txtMileage">
                        </div>  
                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    // Cerrar conexiones
    try {
        if (rsBrands != null) rsBrands.close();
        if (rsModels != null) rsModels.close();
        if (rsFuelTypes != null) rsFuelTypes.close();
        if (stmtBrands != null) stmtBrands.close();
        if (stmtModels != null) stmtModels.close();
        if (stmtFuelTypes != null) stmtFuelTypes.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>