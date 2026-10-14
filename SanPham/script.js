console.log("Trang danh sách sản phẩm đã được tải.");
const logoutButton = document.getElementById("logoutButton");

logoutButton.addEventListener("click", function () {
    window.location.href = "../DangXuat/index.html";
});