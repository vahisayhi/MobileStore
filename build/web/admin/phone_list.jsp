<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Phone List</h2>
        <a href="phone?action=create" class="btn btn-success">Add New Phone</a>
    </div>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${phones}">
                <tr>
                    <td>${p.phoneID}</td>
                    <td>${p.phoneName}</td>
                    <td>${p.unitPrice}</td>
                    <td>${p.quantity}</td>
                    <td>${p.status ? 'Active' : 'Inactive'}</td>
                    <td>
                        <a href="phone?action=edit&id=${p.phoneID}" class="btn btn-sm btn-primary">Edit</a>
                        <a href="phone?action=delete&id=${p.phoneID}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this phone?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<jsp:include page="footer.jsp" />
