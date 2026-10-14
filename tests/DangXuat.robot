*** Settings ***
Library    Browser


*** Test Cases ***

Đăng xuất thành công
    [Tags]    FR13    TC18
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangKy/index.html

    Fill Text    id=fullname    Robot Dang Xuat
    Fill Text    id=email    robot_logout_success@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456
    Click    id=registerButton
    Get Text    id=successMessage    ==    Đăng ký thành công!

    Go To    http://localhost:8000/DangNhap/index.html
    Fill Text    id=email    robot_logout_success@gmail.com
    Fill Text    id=password    123456
    Click    id=loginButton

    Wait For Elements State    .section-heading h2    visible
    Get Text    .section-heading h2    contains    Danh sách sản phẩm

    Go To    http://localhost:8000/DangXuat/index.html
    Click    id=logoutButton

    Wait For Elements State    id=loginForm    visible
    Get Url    ==    http://localhost:8000/DangNhap/index.html

    Close Browser


Kiểm tra nút Đăng xuất
    [Tags]    FR13    TC19
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangXuat/index.html

    Get Element    id=logoutButton

    Close Browser


Kiểm tra nội dung nút Đăng xuất
    [Tags]    FR13    TC20
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangXuat/index.html

    Get Text    id=logoutButton    ==    Đăng xuất

    Close Browser


Kiểm tra currentUser bị xóa
    [Tags]    FR13    TC21
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangKy/index.html

    Fill Text    id=fullname    Robot Current User
    Fill Text    id=email    robot_logout_currentuser@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456
    Click    id=registerButton

    Go To    http://localhost:8000/DangNhap/index.html
    Fill Text    id=email    robot_logout_currentuser@gmail.com
    Fill Text    id=password    123456
    Click    id=loginButton

    Wait For Elements State    h1    visible

    ${current_user_before}=    Evaluate JavaScript    ${None}    () => localStorage.getItem("currentUser")
    Should Not Be Equal    ${current_user_before}    ${None}

    Go To    http://localhost:8000/DangXuat/index.html
    Click    id=logoutButton

    Wait For Elements State    id=loginForm    visible

    ${current_user_after}=    Evaluate JavaScript    ${None}    () => localStorage.getItem("currentUser")
    Should Be Equal    ${current_user_after}    ${None}

    Close Browser


Kiểm tra tài khoản vẫn còn sau khi đăng xuất
    [Tags]    FR13    TC22
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangKy/index.html

    Fill Text    id=fullname    Robot User
    Fill Text    id=email    robot_logout_users@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456
    Click    id=registerButton

    Go To    http://localhost:8000/DangNhap/index.html
    Fill Text    id=email    robot_logout_users@gmail.com
    Fill Text    id=password    123456
    Click    id=loginButton

    Wait For Elements State    h1    visible

    Go To    http://localhost:8000/DangXuat/index.html
    Click    id=logoutButton

    Wait For Elements State    id=loginForm    visible

    ${users}=    Evaluate JavaScript    ${None}    () => localStorage.getItem("users")
    Should Contain    ${users}    robot_logout_users@gmail.com

    Close Browser


Đăng nhập lại sau khi đăng xuất
    [Tags]    FR13    FR10    TC23
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/DangKy/index.html

    Fill Text    id=fullname    Robot Login Again
    Fill Text    id=email    robot_logout_again@gmail.com
    Fill Text    id=password    123456
    Fill Text    id=confirmPassword    123456
    Click    id=registerButton

    Go To    http://localhost:8000/DangNhap/index.html
    Fill Text    id=email    robot_logout_again@gmail.com
    Fill Text    id=password    123456
    Click    id=loginButton

    Wait For Elements State    h1    visible

    Go To    http://localhost:8000/DangXuat/index.html
    Click    id=logoutButton

    Wait For Elements State    id=loginForm    visible

    Fill Text    id=email    robot_logout_again@gmail.com
    Fill Text    id=password    123456
    Click    id=loginButton

    Wait For Elements State    .section-heading h2    visible
    Get Text    .section-heading h2    contains    Danh sách sản phẩm

    Close Browser