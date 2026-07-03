<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>User List</h2>
        <a href="user?action=create" class="btn btn-success">Add New User</a>
    </div>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Role</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${users}">
                <tr>
                    <td>${u.userID}</td>
                    <td>${u.username}</td>
                    <td>${u.fullName}</td>
                    <td>
                        <c:choose>
                            <c:when test="${u.roleID == 1}">Admin</c:when>
                            <c:when test="${u.roleID == 2}">Staff</c:when>
                            <c:otherwise>Customer</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${u.status ? 'Active' : 'Inactive'}</td>
                    <td>
                        <a href="user?action=edit&id=${u.userID}" class="btn btn-sm btn-primary">Edit</a>
                        <a href="user?action=delete&id=${u.userID}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this user?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<jsp:include page="footer.jsp" />
