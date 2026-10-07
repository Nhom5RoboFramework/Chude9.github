const form = document.getElementById("registerForm");

form.addEventListener("submit", function (e) {
    e.preventDefault();

    // Xóa lỗi cũ
    document.getElementById("fullnameError").textContent = "";
    document.getElementById("emailError").textContent = "";
    document.getElementById("passwordError").textContent = "";
    document.getElementById("confirmPasswordError").textContent = "";

    document.getElementById("successMessage").textContent = "";

    const fullname = document.getElementById("fullname").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    let isValid = true;

    // Kiểm tra họ tên
    if (fullname === "") {
        document.getElementById("fullnameError").textContent =
            "Vui lòng nhập họ tên.";
        isValid = false;
    }

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
    } else if (password.length < 6) {
        document.getElementById("passwordError").textContent =
            "Mật khẩu phải có ít nhất 6 ký tự.";
        isValid = false;
    }

    // Kiểm tra xác nhận mật khẩu
    if (confirmPassword === "") {
        document.getElementById("confirmPasswordError").textContent =
            "Vui lòng xác nhận mật khẩu.";
        isValid = false;
    } else if (password !== confirmPassword) {
        document.getElementById("confirmPasswordError").textContent =
            "Mật khẩu xác nhận không khớp.";
        isValid = false;
    }

    if (!isValid) {
        return;
    }

    // Lấy danh sách tài khoản
    const users = JSON.parse(localStorage.getItem("users")) || [];

    // Kiểm tra email đã tồn tại
    const existingUser = users.find(user => user.email === email);

    if (existingUser) {
        document.getElementById("emailError").textContent =
            "Email đã tồn tại.";
        return;
    }

    // Thêm tài khoản mới
    users.push({
        fullname: fullname,
        email: email,
        password: password
    });

    localStorage.setItem("users", JSON.stringify(users));

    document.getElementById("successMessage").textContent =
        "Đăng ký thành công!";

    form.reset();
});