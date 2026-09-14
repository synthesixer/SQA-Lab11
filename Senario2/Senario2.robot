*** Settings ***
Documentation     Lab11: Automated Testing for Tricentis Vehicle Insurance Application (UAT-Lab11-002)
Library           SeleniumLibrary

*** Variables ***
${URL}            http://sampleapp.tricentis.com/
${BROWSER}        Chrome

*** Test Cases ***
UAT-Lab11-002: Request Vehicle Insurance Quote Unsuccessfully
    [Documentation]    ทดสอบการขอใบเสนอราคาสำหรับรถยนต์ไม่สำเร็จเนื่องจากข้อมูลไม่ครบถ้วน พร้อมแคปรูปหลักฐาน
    Open Insurance Main Page
    Enter Invalid Vehicle Data For Automobile
    Enter Incomplete Insurance Data
    Enter Incomplete Product Data
    Verify Package Selection Is Blocked
    [Teardown]    Close Browser

*** Keywords ***
Open Insurance Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:nav_automobile    timeout=10s

Enter Invalid Vehicle Data For Automobile
    Click Element    id:nav_automobile
    Wait Until Element Is Visible    id:make    timeout=10s
    Click Button    id:nextenterinsurantdata
    
    Wait Until Element Is Visible    xpath://a[@id='entervehicledata']//span[contains(@class,'counter')]    timeout=10s
    Capture Page Screenshot    filename=01_Error_VehicleData.png

Enter Incomplete Insurance Data
    Run Keyword And Ignore Error    Click Element    id:enterinsurantdata
    Sleep    1s
    Run Keyword And Ignore Error    Click Button    id:nextenterproductdata
    
    Wait Until Element Is Visible    xpath://a[@id='enterinsurantdata']//span[contains(@class,'counter')]    timeout=10s
    Capture Page Screenshot    filename=02_Error_InsuranceData.png

Enter Incomplete Product Data
    Run Keyword And Ignore Error    Click Element    id:enterproductdata
    Sleep    1s
    Run Keyword And Ignore Error    Click Button    id:nextselectpriceoption
    
    Wait Until Element Is Visible    xpath://a[@id='enterproductdata']//span[contains(@class,'counter')]    timeout=10s
    Capture Page Screenshot    filename=03_Error_ProductData.png

Verify Package Selection Is Blocked
    Element Should Not Be Visible    id:selectsilver
    Capture Page Screenshot    filename=04_SelectionBlocked.png