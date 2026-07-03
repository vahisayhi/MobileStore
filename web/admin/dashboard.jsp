<jsp:include page="header.jsp" />
    <h2>Dashboard</h2>
    <p>Welcome to the MobileStore Administration Panel.</p>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Manage Products</h5>
                    <p class="card-text">View, add, edit, or delete phones.</p>
                    <a href="phone?action=list" class="btn btn-light">Go</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Manage Categories</h5>
                    <p class="card-text">Organize product categories.</p>
                    <a href="category?action=list" class="btn btn-light">Go</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Manage Users</h5>
                    <p class="card-text">Control accounts and roles.</p>
                    <a href="user?action=list" class="btn btn-light">Go</a>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />
