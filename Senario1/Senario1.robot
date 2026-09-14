*** Settings ***
Documentation     Lab11: Automated Testing for Tricentis Vehicle Insurance Application (Improved)
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${URL}            http://sampleapp.tricentis.com/
${BROWSER}        Chrome
${EMAIL}          puttimed.c@kkumail.com
${PASSWORD}       123456wwwWWW!

*** Test Cases ***
UAT-Lab11-001: Request Vehicle Insurance Quote Successfully
    [Documentation]    ทดสอบการขอใบเสนอราคาสำหรับรถยนต์สำเร็จ (ปรับปรุง Synchronization, วันที่ และเพิ่มการแคปรูป)
    Open Insurance Main Page
    Enter Vehicle Data For Automobile
    Enter Insurance Data
    Enter Product Data
    Select Price Option
    Send Quote
    [Teardown]    Close Browser

*** Keywords ***
Open Insurance Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:nav_automobile    timeout=10s

Enter Vehicle Data For Automobile
    Click Element    id:nav_automobile
    Wait Until Element Is Visible    id:make    timeout=10s
    Select From List By Value    id:make    BMW
    Input Text    id:engineperformance    110
    Input Text    id:dateofmanufacture    09/09/2020
    Select From List By Value    id:numberofseats    5
    Select From List By Value    id:fuel    Electric Power
    Input Text    id:listprice    30000
    Input Text    id:licenseplatenumber    CKK1234
    Input Text    id:annualmileage    10000
    Capture Page Screenshot    filename=01_VehicleData.png
    Click Button    id:nextenterinsurantdata

Enter Insurance Data
    Wait Until Element Is Visible    id:firstname    timeout=10s
    Input Text    id:firstname    Puttimed
    Input Text    id:lastname    Chomsrisawat
    Input Text    id:birthdate    01/31/1990
    Click Element    xpath://label[contains(., 'Male')]
    Input Text    id:streetaddress    KKU
    Select From List By Value    id:country    Thailand
    Input Text    id:zipcode    40000
    Input Text    id:city    Khon Kaen
    Select From List By Value    id:occupation    Employee
    Click Element    xpath://label[contains(., 'Other')]
    Capture Page Screenshot    filename=02_InsuranceData.png
    Click Button    id:nextenterproductdata

Enter Product Data
    Wait Until Element Is Visible    id:startdate    timeout=10s
    ${future_date}=    Get Current Date    increment=+45 days    result_format=%m/%d/%Y
    Input Text    id:startdate    ${future_date}
    Select From List By Value    id:insurancesum    7000000
    Select From List By Value    id:meritrating    Bonus 1
    Select From List By Value    id:damageinsurance    No Coverage
    Click Element    xpath://label[contains(., 'Euro Protection')]
    Select From List By Value    id:courtesycar    Yes
    Capture Page Screenshot    filename=03_ProductData.png
    Click Button    id:nextselectpriceoption

Select Price Option
    Wait Until Element Is Visible    xpath://input[@id='selectsilver']/following-sibling::span    timeout=10s
    Click Element    xpath://input[@id='selectsilver']/following-sibling::span
    Capture Page Screenshot    filename=04_PriceOption.png
    Wait Until Element Is Visible    id:nextsendquote    timeout=10s
    Click Button    id:nextsendquote

Send Quote
    Wait Until Element Is Visible    id:email    timeout=10s
    Input Text    id:email    ${EMAIL}
    Input Text    id:phone    0049201123456
    Input Text    id:username    puttimed.c
    Input Text    id:password    ${PASSWORD}
    Input Text    id:confirmpassword    ${PASSWORD}
    Input Text    id:Comments    Please contact via email only
    Capture Page Screenshot    filename=05_SendQuoteData.png
    Click Button    id:sendemail
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Sending e-mail success!')]    timeout=30s
    Capture Page Screenshot    filename=06_SuccessMessage.png