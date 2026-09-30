// =============================
// HIỂN THỊ / ẨN MẬT KHẨU
// =============================

function togglePassword(inputId, button) {

    const input = document.getElementById(inputId);

    if (input.type === "password") {

        input.type = "text";

        button.textContent = "🙈";

    } else {

        input.type = "password";

        button.textContent = "👁";
    }
}


// =============================
// KIỂM TRA ĐỘ MẠNH MẬT KHẨU
// =============================

const password = document.getElementById("password");
const strengthBar = document.getElementById("strengthBar");

password.addEventListener("input", function () {

    const value = password.value;

    let strength = 0;

    if (value.length >= 6) {
        strength++;
    }

    if (/[A-Z]/.test(value)) {
        strength++;
    }

    if (/[0-9]/.test(value)) {
        strength++;
    }

    if (/[^A-Za-z0-9]/.test(value)) {
        strength++;
    }

    if (strength === 0) {

        strengthBar.style.width = "0%";

    } else if (strength === 1) {

        strengthBar.style.width = "25%";
        strengthBar.style.background = "#ef4444";

    } else if (strength === 2) {

        strengthBar.style.width = "50%";
        strengthBar.style.background = "#f59e0b";

    } else if (strength === 3) {

        strengthBar.style.width = "75%";
        strengthBar.style.background = "#eab308";

    } else {

        strengthBar.style.width = "100%";
        strengthBar.style.background = "#22c55e";
    }
});


// =============================
// FORM ĐĂNG KÝ
// =============================

const form = document.getElementById("registerForm");

form.addEventListener("submit", function (event) {

    event.preventDefault();

    // Lấy dữ liệu
    const fullname =
        document.getElementById("fullname").value.trim();

    const email =
        document.getElementById("email").value.trim();

    const username =
        document.getElementById("username").value.trim();

    const passwordValue =
        document.getElementById("password").value;

    const confirmPassword =
        document.getElementById("confirmPassword").value;

    const terms =
        document.getElementById("terms").checked;


    // Xóa thông báo cũ
    document.getElementById("fullnameError").textContent = "";
    document.getElementById("emailError").textContent = "";
    document.getElementById("usernameError").textContent = "";
    document.getElementById("passwordError").textContent = "";
    document.getElementById("confirmError").textContent = "";
    document.getElementById("termsError").textContent = "";

    let valid = true;


    // =============================
    // KIỂM TRA HỌ TÊN
    // =============================

    if (fullname === "") {

        document.getElementById("fullnameError")
            .textContent = "Vui lòng nhập họ và tên.";

        valid = false;
    }


    // =============================
    // KIỂM TRA EMAIL
    // =============================

    const emailRegex =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (email === "") {

        document.getElementById("emailError")
            .textContent = "Vui lòng nhập email.";

        valid = false;

    } else if (!emailRegex.test(email)) {

        document.getElementById("emailError")
            .textContent = "Email không đúng định dạng.";

        valid = false;
    }


    // =============================
    // KIỂM TRA USERNAME
    // =============================

    if (username === "") {

        document.getElementById("usernameError")
            .textContent = "Vui lòng nhập tên đăng nhập.";

        valid = false;

    } else if (username.length < 4) {

        document.getElementById("usernameError")
            .textContent =
            "Tên đăng nhập phải có ít nhất 4 ký tự.";

        valid = false;
    }


    // =============================
    // KIỂM TRA PASSWORD
    // =============================

    if (passwordValue === "") {

        document.getElementById("passwordError")
            .textContent = "Vui lòng nhập mật khẩu.";

        valid = false;

    } else if (passwordValue.length < 6) {

        document.getElementById("passwordError")
            .textContent =
            "Mật khẩu phải có ít nhất 6 ký tự.";

        valid = false;
    }


    // =============================
    // XÁC NHẬN PASSWORD
    // =============================

    if (confirmPassword === "") {

        document.getElementById("confirmError")
            .textContent =
            "Vui lòng nhập lại mật khẩu.";

        valid = false;

    } else if (passwordValue !== confirmPassword) {

        document.getElementById("confirmError")
            .textContent =
            "Mật khẩu xác nhận không khớp.";

        valid = false;
    }


    // =============================
    // ĐIỀU KHOẢN
    // =============================

    if (!terms) {

        document.getElementById("termsError")
            .textContent =
            "Bạn cần đồng ý với điều khoản.";

        valid = false;
    }


    // =============================
    // ĐĂNG KÝ THÀNH CÔNG
    // =============================

    if (valid) {

        const success =
            document.getElementById("successMessage");

        success.style.display = "block";

        // Lưu thử thông tin vào trình duyệt
        const user = {
            fullname: fullname,
            email: email,
            username: username
        };

        localStorage.setItem(
            "user",
            JSON.stringify(user)
        );

        // Reset form
        form.reset();

        strengthBar.style.width = "0%";

        // Sau 3 giây ẩn thông báo
        setTimeout(function () {

            success.style.display = "none";

        }, 3000);
    }

});