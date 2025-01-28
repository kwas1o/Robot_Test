*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          2
${FIRST_NAME}     Somsong
${LAST_NAME}      Sandee
${DESTINATION}    Europe
${CONTACT_PERSON}    Sodsai Sandee
${RELATIONSHIP}   Mother
${EMAIL}          somsong@kkumail.com
${PHONE}          081-111-1234
${FORM_URL}       http://${SERVER}/Form.html
${RECORD_SUCCESS_URL}  http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}..${/}ChromeForTesting${/}chrome${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}..${/}ChromeForTesting${/}chromedriver${/}chromedriver.exe

*** Keywords ***

Open Browser To Form Page
    [Documentation]    Launch Chrome browser using specified paths and navigate to the URL.
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}           Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${FORM_URL}

Input First Name
    [Arguments]    ${FIRST_NAME}
    Input Text    firstname    ${FIRST_NAME}

Input Last Name
    [Arguments]    ${LAST_NAME}
    Input Text    lastname    ${LAST_NAME}

Input Destination
    [Arguments]    ${DESTINATION}
    Input Text    destination    ${DESTINATION}

Input Contact Person
    [Arguments]    ${CONTACT_PERSON}
    Input Text    contactperson    ${CONTACT_PERSON}

Input Relationship
    [Arguments]    ${RELATIONSHIP}
    Input Text    relationship    ${RELATIONSHIP}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    email    ${EMAIL}

Input Phone Number
    [Arguments]    ${PHONE}
    Input Text    phone    ${PHONE}

Submit Form
    [Documentation]    Submit the form after filling out all fields.
    Click Button    submitButton

Record Success Page Should Be Open
    [Documentation]    Verifies the success page after the form is submitted.
    Location Should Be    ${RECORD_SUCCESS_URL}
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patience.

Should Show Error About Empty Destination
    [Documentation]    Verifies error message when destination is empty.
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter your destination.

Should Show Error About Empty Email
    [Documentation]    Verifies error message when email is empty.
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter your email address.

Should Show Error About Invalid Email
    [Documentation]    Verifies error message when email is invalid.
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a valid email address.

Should Show Error About Empty Phone Number
    [Documentation]    Verifies error message when phone number is empty.
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a phone number.

Should Show Error About Invalid Phone Number
    [Documentation]    Verifies error message when phone number is invalid.
    Location Should Be    ${FORM_URL}
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678