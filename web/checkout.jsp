<%-- 
    Document   : checkout
    Created on : 7 Jul 2026, 15:28:07
    Author     : chung
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="admin/header.jsp"/>

<div class="container my-5">
    <div class="row g-4">
        <div class="col-md-7">
            <div class="card border-0 shadow-sm p-4">
                <h4 class="fw-bold mb-4 text-dark"><i class="bi bi-geo-alt text-warning"></i> Thông Tin Nhận Hàng</h4>
                
                <form action="OrderController" method="POST" class="needs-validation" novalidate>
                    <input type="hidden" name="action" value="checkout">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Họ và tên người nhận <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="customerName" value="<c:out value='${sessionScope.user.name}' />" placeholder="Nhập đầy đủ họ tên" required>
                        <div class="invalid-feedback">Không được để trống tên người nhận.</div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Số điện thoại <span class="text-danger">*</span></label>
                            <input type="tel" class="form-control" name="phone" placeholder="Nhập số điện thoại" required>
                            <div class="invalid-feedback">Vui lòng nhập số điện thoại hợp lệ.</div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-bold">Email nhận thông báo</label>
                            <input type="email" class="form-control" name="email" value="<c:out value='${sessionScope.user.email}' />" placeholder="name@example.com">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Địa chỉ giao hàng <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="address" placeholder="Số nhà, tên đường, quận/huyện..." required>
                        <div class="invalid-feedback">Vui lòng điền địa chỉ nhận hàng.</div>
                    </div>

                    <hr class="my-4">
                    <button type="submit" class="btn btn-warning btn-lg w-100 fw-bold py-3 shadow-sm">XÁC NHẬN ĐẶT HÀNG</button>
                </form>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card border-0 shadow-sm p-4 bg-light">
                <h5 class="fw-bold mb-3 text-secondary">Hóa đơn đơn hàng</h5>
                <hr>
                <div class="d-flex justify-content-between align-items-center">
                    <span class="fw-bold">Tổng thanh toán:</span>
                    <span class="fs-4 fw-bold text-danger">29.490.000 đ</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (() => {
      'use strict'
      const forms = document.querySelectorAll('.needs-validation')
      Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
    })()
</script>

<c:import url="admin/footer.jsp"/>
