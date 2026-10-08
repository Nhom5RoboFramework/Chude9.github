*** Settings ***
Library    Browser


*** Test Cases ***

Đăng nhập thành công
    New Browser    chromium    headless=False    channel=chrome

    # Tạo tài khoản test
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Robot Test
    Fill Text    id=email    robot_login_success@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=successMessage    ==    Đăng ký thành công!

    # Chuyển sang trang đăng nhập
    New Page    http://localhost:8000/dangnhap/index.html

    Fill Text    id=email    robot_login_success@gmail.com
    Fill Text    id=password    123456

    Click    id=loginButton

    Get Text    id=successMessage    ==    Đăng nhập thành công!

    Close Browser


Bỏ trống email
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangnhap/index.html

    Fill Text    id=password    123456

    Click    id=loginButton

    Get Text    id=emailError    ==    Vui lòng nhập email.

    Close Browser


Bỏ trống mật khẩu
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangnhap/index.html

    Fill Text    id=email    robot_test@gmail.com

    Click    id=loginButton

    Get Text    id=passwordError    ==    Vui lòng nhập mật khẩu.

    Close Browser


Email không tồn tại
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangnhap/index.html

    Fill Text    id=email    email_khong_ton_tai@gmail.com
    Fill Text    id=password    123456

    Click    id=loginButton

    Get Text    id=loginError    ==    Email không tồn tại.

    Close Browser


Mật khẩu không chính xác
    New Browser    chromium    headless=False    channel=chrome

    # Tạo tài khoản test
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Robot Password Test
    Fill Text    id=email    robot_wrong_password@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=successMessage    ==    Đăng ký thành công!

    # Chuyển sang đăng nhập
    New Page    http://localhost:8000/dangnhap/index.html

    Fill Text    id=email    robot_wrong_password@gmail.com
    Fill Text    id=password    111111

    Click    id=loginButton

    Get Text    id=loginError    ==    Mật khẩu không chính xác.

    Close Browser