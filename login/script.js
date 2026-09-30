const loginForm = document.getElementById("loginForm");
const message = document.getElementById("message");

loginForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value;

    if (username === "" || password === "") {
        message.textContent = "Vui lòng nhập đầy đủ thông tin.";
        return;
    }

    // Demo đăng nhập
    if (username === "admin" && password === "123456") {
        message.textContent = "Đăng nhập thành công!";
    } else {
        message.textContent = "Tên đăng nhập hoặc mật khẩu không đúng.";
    }
});