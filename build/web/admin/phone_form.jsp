<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
    <h2>${phone != null ? 'Edit Phone' : 'Add New Phone'}</h2>
    <form action="phone?action=${phone != null ? 'edit' : 'create'}" method="POST">
        <c:if test="${phone != null}">
            <input type="hidden" name="id" value="${phone.phoneID}">
        </c:if>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Phone Name</label>
                <input type="text" name="phoneName" class="form-control" value="${phone.phoneName}" required>
            </div>
            <div class="col-md-3 mb-3">
                <label>Unit Price</label>
                <input type="number" name="unitPrice" class="form-control" value="${phone.unitPrice}" required>
            </div>
            <div class="col-md-3 mb-3">
                <label>Quantity</label>
                <input type="number" name="quantity" class="form-control" value="${phone.quantity}" required>
            </div>
        </div>
        <div class="mb-3">
            <label>Description</label>
            <textarea name="description" class="form-control" rows="3">${phone.description}</textarea>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label>Brand</label>
                <select name="brandID" class="form-control" required>
                    <c:forEach var="b" items="${brands}">
                        <option value="${b.brandID}" ${phone.brandID == b.brandID ? 'selected' : ''}>${b.brandName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6 mb-3">
                <label>Category</label>
                <select name="categoryID" class="form-control" required>
                    <c:forEach var="c" items="${categories}">
                        <option value="${c.categoryID}" ${phone.categoryID == c.categoryID ? 'selected' : ''}>${c.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="mb-3">
            <label>Image URL</label>
            <input type="text" name="image" class="form-control" value="${phone.image}">
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" name="status" class="form-check-input" id="status" ${phone == null || phone.status ? 'checked' : ''}>
            <label class="form-check-label" for="status">Active</label>
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="phone?action=list" class="btn btn-secondary">Cancel</a>
    </form>
<jsp:include page="footer.jsp" />
