*** Settings ***
Library    Browser


*** Test Cases ***

Mở trang danh sách sản phẩm
    [Tags]    FR11    TC13
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/sanpham/index.html

    Get Title    ==    PetCare - Cửa hàng thú cưng

    Close Browser


Kiểm tra tiêu đề danh sách sản phẩm
    [Tags]    FR11    TC14
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/sanpham/index.html

    Get Text    .section-heading h2    contains    Danh sách sản phẩm

    Close Browser


Kiểm tra sản phẩm Thức ăn cho chó
    [Tags]    FR11    TC15
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/sanpham/index.html

    Get Text    id=product1-name    ==    Thức ăn cho chó
    Get Text    id=product1-price    ==    150.000đ

    Close Browser


Kiểm tra sản phẩm Đồ chơi cho mèo
    [Tags]    FR11    TC16
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/sanpham/index.html

    Get Text    id=product2-name    ==    Đồ chơi cho mèo
    Get Text    id=product2-price    ==    300.000đ

    Close Browser


Kiểm tra đủ 4 sản phẩm
    [Tags]    FR11    TC17
    New Browser    chromium    headless=False    channel=chrome
    New Page    http://localhost:8000/sanpham/index.html

    Get Element Count    .product-card    ==    4

    Close Browser