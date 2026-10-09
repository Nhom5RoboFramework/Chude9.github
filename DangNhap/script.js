const form = document.getElementById("loginForm");

form.addEventListener("submit", function (e) {
    e.preventDefault();

    // Xóa thông báo cũ
    document.getElementById("emailError").textContent = "";
    document.getElementById("passwordError").textContent = "";
    document.getElementById("loginError").textContent = "";
    document.getElementById("successMessage").textContent = "";

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;

    let isValid = true;

    // Kiểm tra email
    if (email === "") {
        document.getElementById("emailError").textContent =
            "Vui lòng nhập email.";
        isValid = false;
    }

    // Kiểm tra mật khẩu
    if (password === "") {
        document.getElementById("passwordError").textContent =
            "Vui lòng nhập mật khẩu.";
        isValid = false;
    }

    if (!isValid) {
        return;
    }

    // Lấy danh sách tài khoản
    const users = JSON.parse(localStorage.getItem("users")) || [];

    // Tìm tài khoản
    const user = users.find(function (user) {
        return user.email === email;
    });

    // Không tìm thấy email
    if (!user) {
        document.getElementById("loginError").textContent =
            "Email không tồn tại.";
        return;
    }

    // Sai mật khẩu
    if (user.password !== password) {
        document.getElementById("loginError").textContent =
            "Mật khẩu không chính xác.";
        return;
    }

    localStorage.setItem("currentUser", JSON.stringify(user));

    console.log("Sắp chuyển trang...");
    window.location.href = "../SanPham/index.html";
});