<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <h2>${user != null ? 'Edit User' : 'Add New User'}</h2>
    <form action="user?action=${user != null ? 'edit' : 'create'}" method="POST">
        <c:if test="${user != null}">
            <input type="hidden" name="id" value="${user.userID}">
        </c:if>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="${user.username}" ${user != null ? 'readonly' : ''} required>
            </div>
            <div class="col-md-6 mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" value="${user.password}" required>
            </div>
        </div>
        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="fullName" class="form-control" value="${user.fullName}" required>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="${user.email}">
            </div>
            <div class="col-md-6 mb-3">
                <label>Phone</label>
                <input type="text" name="phone" class="form-control" value="${user.phone}">
            </div>
        </div>
        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control" rows="2">${user.address}</textarea>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Role</label>
                <select name="roleID" class="form-control">
                    <option value="1" ${user.roleID == 1 ? 'selected' : ''}>Admin</option>
                    <option value="2" ${user.roleID == 2 ? 'selected' : ''}>Staff</option>
                    <option value="3" ${user.roleID == 3 ? 'selected' : ''}>Customer</option>
                </select>
            </div>
            <div class="col-md-6 mb-3 d-flex align-items-end">
                <div class="form-check">
                    <input type="checkbox" name="status" class="form-check-input" id="status" ${user == null || user.status ? 'checked' : ''}>
                    <label class="form-check-label" for="status">Active</label>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="user?action=list" class="btn btn-secondary">Cancel</a>
    </form>
<jsp:include page="footer.jsp" />
