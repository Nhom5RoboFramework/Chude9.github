const logoutButton = document.getElementById("logoutButton");

logoutButton.addEventListener("click", function () {

    localStorage.removeItem("currentUser");

    window.location.href = "../DangNhap/index.html";
});