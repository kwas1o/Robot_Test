*** Settings ***
Library    SeleniumLibrary
Resource    resource.robot

*** Variables ***
${DELAY}          1

*** Test Cases ***

Open Form:
    Open Browser To Form Page
    
Empty Destination:
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    ${EMPTY}
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone Number    081-111-1234
    Submit Form
    Should Show Error About Empty Destination
    [Teardown]    Close Browser

Open Form:
    Open Browser To Form Page
    
Empty Email:
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    ${EMPTY}
    Input Phone Number    081-111-1234
    Submit Form
    Should Show Error About Empty Email
    [Teardown]    Close Browser

Open Form:
    Open Browser To Form Page
    
Invalid Email:
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@”
    Input Phone Number    081-111-1234
    Submit Form
    Should Show Error About Invalid Email
    [Teardown]    Close Browser

Open Form:
    Open Browser To Form Page
    
Empty Phone Number:
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone Number    ${EMPTY}
    Submit Form
    Should Show Error About Empty Phone Number
    [Teardown]    Close Browser

Open Form:
    Open Browser To Form Page
    
Invalid Phone Number:
    Input First Name    Somsong
    Input Last Name    Sandee
    Input Destination    Europe
    Input Contact person    Sodsai Sandee
    Input Relationship    Mother
    Input Email    somsong@kkumail.com
    Input Phone Number    191
    Submit Form
    Should Show Error About Invalid Phone Number
    [Teardown]    Close Browser
