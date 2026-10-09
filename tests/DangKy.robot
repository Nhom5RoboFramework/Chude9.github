*** Settings ***
Library    Browser

*** Test Cases ***

Đăng ký tài khoản thành công
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat01@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=successMessage    ==    Đăng ký thành công!

    Close Browser


Bỏ trống họ tên
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=email    dat02@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=fullnameError    ==    Vui lòng nhập họ tên.

    Close Browser


Bỏ trống email
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=emailError    ==    Vui lòng nhập email.

    Close Browser


Bỏ trống mật khẩu
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat03@gmail.com
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=passwordError    ==    Vui lòng nhập mật khẩu.

    Close Browser


Mật khẩu dưới 6 ký tự
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat04@gmail.com
    Fill Text    id=password    12345
    Fill Text    id=confirmPassword    12345

    Click    id=registerButton

    Get Text    id=passwordError    ==    Mật khẩu phải có ít nhất 6 ký tự.

    Close Browser


Xác nhận mật khẩu không khớp
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat05@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    654321

    Click    id=registerButton

    Get Text    id=confirmPasswordError    ==    Mật khẩu xác nhận không khớp.

    Close Browser


Email đã tồn tại
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/dangky/index.html

    # Tạo tài khoản trước
    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat_02@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=successMessage    ==    Đăng ký thành công!

    # Đăng ký lại với email đã tồn tại
    Fill Text    id=fullname    Nguyễn Văn A
    Fill Text    id=email    dat_02@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456

    Click    id=registerButton

    Get Text    id=emailError    ==    Email đã tồn tại.

    Close Browser