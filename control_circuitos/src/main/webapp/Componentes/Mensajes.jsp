<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<div class="container mt-3">

<%
    String error = (String) session.getAttribute("error");
    String success = (String) session.getAttribute("success");

    if (error != null) {
%>

    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
        <i class="fa-solid fa-circle-xmark"></i>
        <strong>Error:</strong> <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>

<%
        session.removeAttribute("error");
    }

    if (success != null) {
%>

    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
        <i class="fa-solid fa-circle-check"></i>
        <strong>Éxito:</strong> <%= success %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>

<%
        session.removeAttribute("success");
    }
%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>