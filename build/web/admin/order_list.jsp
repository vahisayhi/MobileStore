<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Order Management</h2>
    </div>

    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form action="order" method="GET" class="row g-3">
                <input type="hidden" name="action" value="list">
                <div class="col-md-4">
                    <label>Order ID (Code)</label>
                    <input type="number" name="searchId" class="form-control" value="${searchId}" placeholder="Enter Order ID...">
                </div>
                <div class="col-md-4">
                    <label>Status Filter</label>
                    <select name="statusFilter" class="form-select">
                        <option value="All" ${statusFilter == 'All' ? 'selected' : ''}>All</option>
                        <option value="Pending" ${statusFilter == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Processing" ${statusFilter == 'Processing' ? 'selected' : ''}>Processing</option>
                        <option value="Done" ${statusFilter == 'Done' ? 'selected' : ''}>Done</option>
                        <option value="Cancelled" ${statusFilter == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                    </select>
                </div>
                <div class="col-md-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100">Search Orders</button>
                </div>
            </form>
        </div>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Payment Method</th>
                <th>Status (AJAX Update)</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="o" items="${orders}">
                <tr>
                    <td>#${o.orderID}</td>
                    <td>${o.customerName}</td>
                    <td>${o.orderDate}</td>
                    <td>${o.totalAmount} VNĐ</td>
                    <td>${o.paymentMethod}</td>
                    <td>
                        <select class="form-select form-select-sm" 
                                onchange="changeOrderStatus(${o.orderID}, this.value)"
                                ${o.status == 'Done' || o.status == 'Cancelled' ? 'disabled' : ''}>
                            <option value="Pending" ${o.status == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="Processing" ${o.status == 'Processing' ? 'selected' : ''}>Processing</option>
                            <option value="Done" ${o.status == 'Done' ? 'selected' : ''}>Done</option>
                            <option value="Cancelled" ${o.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                        </select>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <script>
        function changeOrderStatus(orderId, newStatus) {
            // Hiển thị thông báo xác nhận trước khi đổi
            if(!confirm("Are you sure to change Order #" + orderId + " to " + newStatus + "?")) {
                location.reload(); // Hoàn tác dropdown nếu người dùng hủy
                return;
            }

            // Dùng Fetch API đẩy ngầm dữ liệu xuống OrderController
            fetch('order?action=updateStatusAjax', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'orderId=' + orderId + '&status=' + newStatus
            })
            .then(response => response.text())
            .then(data => {
                if(data === 'success') {
                    // Nếu đổi thành 'Done' hoặc 'Cancelled' thì disable luôn cái menu, không cho sửa lại nữa
                    if(newStatus === 'Done' || newStatus === 'Cancelled') {
                        document.querySelector('select[onchange="changeOrderStatus(' + orderId + ', this.value)"]').disabled = true;
                    }
                    alert('Order #' + orderId + ' updated successfully without reloading!');
                } else {
                    alert('Failed to update status.');
                }
            })
            .catch(error => console.error('Error:', error));
        }
    </script>

<jsp:include page="footer.jsp" />