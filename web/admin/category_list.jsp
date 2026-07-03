<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Category List</h2>
        <a href="category?action=create" class="btn btn-success">Add New Category</a>
    </div>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${categories}">
                <tr>
                    <td>${c.categoryID}</td>
                    <td>${c.categoryName}</td>
                    <td>${c.description}</td>
                    <td>
                        <a href="category?action=edit&id=${c.categoryID}" class="btn btn-sm btn-primary">Edit</a>
                        <a href="category?action=delete&id=${c.categoryID}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this category?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<jsp:include page="footer.jsp" />
