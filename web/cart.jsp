<%-- 
    Document   : cart
    Created on : 7 Jul 2026, 15:27:08
    Author     : chung
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="admin/header.jsp"/>

<div class="container my-5">
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.jsp" class="text-dark text-decoration-none">Trang chủ</a></li>
            <li class="breadcrumb-item active text-secondary" aria-current="page">
                <c:out value="${not empty phone.name ? phone.name : 'Chi tiết sản phẩm'}" />
            </li>
        </ol>
    </nav>

    <div class="row g-5 bg-white p-4 rounded shadow-sm">
        <div class="col-md-6 text-center border-end border-light">
            <img src="<c:out value='${not empty phone.image ? phone.image : "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600"}' />" 
                 class="img-fluid rounded" alt="Product Image" style="max-height: 400px; object-fit: contain;">
        </div>

        <div class="col-md-6">
            <h2 class="fw-bold text-dark mb-2">
                <c:out value="${not empty phone.name ? phone.name : 'iPhone 15 Pro Max 256GB'}" />
            </h2>
            
            <div class="mb-3">
                <span class="badge bg-warning text-dark px-3 py-2 fs-6">Chính hãng</span>
                <span class="text-muted small ms-2">| Tình trạng: 
                    <c:choose>
                        <c:when test="${phone.stock > 0}"><span class="text-success fw-bold">Còn hàng (<c:out value="${phone.stock}"/>)</span></c:when>
                        <c:otherwise><span class="text-danger fw-bold">Tạm hết hàng</span></c:otherwise>
                    </c:choose>
                </span>
            </div>

            <h3 class="text-danger fw-bold mb-4">
                <c:out value="${not empty phone.price ? phone.price : '29.490.000'}" /> đ
            </h3>

            <div class="bg-light p-3 rounded mb-4">
                <ul class="list-unstyled mb-0 small" style="line-height: 2;">
                    <li><i class="bi bi-palette text-secondary me-2"></i> <strong>Màu sắc:</strong> <c:out value="${not empty phone.color ? phone.color : 'Titan Tự Nhiên'}" /></li>
                    <li><i class="bi bi-shield-check text-secondary me-2"></i> <strong>Bảo hành:</strong> 12 tháng chính hãng Đại học FPT Lab.</li>
                </ul>
            </div>

            <form action="CartServlet" method="POST">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="phoneId" value="<c:out value='${not empty phone.id ? phone.id : "1"}' />">
                
                <div class="d-flex align-items-center gap-3 mb-4">
                    <label class="fw-bold">Số lượng:</label>
                    <input type="number" class="form-control text-center" name="quantity" value="1" min="1" style="width: 80px;">
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-dark btn-lg py-3 fw-bold" ${phone.stock == 0 ? 'disabled' : ''}>
                        <i class="bi bi-cart-plus me-2"></i> THÊM VÀO GIỎ HÀNG
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<c:import url="admin/footer.jsp"/>