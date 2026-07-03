<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <h2>${category != null ? 'Edit Category' : 'Add New Category'}</h2>
    <form action="category?action=${category != null ? 'edit' : 'create'}" method="POST">
        <c:if test="${category != null}">
            <input type="hidden" name="id" value="${category.categoryID}">
        </c:if>
        <div class="mb-3">
            <label>Category Name</label>
            <input type="text" name="categoryName" class="form-control" value="${category.categoryName}" required>
        </div>
        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="3">${category.description}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="category?action=list" class="btn btn-secondary">Cancel</a>
    </form>
<jsp:include page="footer.jsp" />
