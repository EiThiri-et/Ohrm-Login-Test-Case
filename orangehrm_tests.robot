*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USER}     Admin
${VALID_PASS}     admin123
${INVALID_USER}   Invalid
${INVALID_PASS}   invalid123

*** Test Cases ***
Login With Valid Credentials
    Open Browser  ${URL}  firefox
    Maximize Browser Window
    Wait Until Element Is Visible  css=input[name='username']  30s
    Input Username  ${VALID_USER}
    Input Password  ${VALID_PASS}
    Click Login Button
    Sleep  5s  # Temporary wait to ensure navigation completes
    Capture Page Screenshot
    Wait Until Page Contains  Dashboard  40s
    Verify Dashboard Is Displayed
    Close Browser

Login With Invalid Credentials
    Open Browser  ${URL}  firefox
    Maximize Browser Window
    Wait Until Element Is Visible  css=input[name='username']  30s
    Input Username  ${INVALID_USER}
    Input Password  ${INVALID_PASS}
    Click Login Button
    Wait Until Element Is Visible  xpath=//p[contains(@class, 'oxd-alert-content-text')]  10s
    Verify Invalid Credentials Alert  Invalid credentials
    Capture Page Screenshot
    Close Browser

Login With Empty Credentials
    Open Browser  ${URL}  firefox
    Maximize Browser Window
    Wait Until Element Is Visible  css=button[type='submit']  30s  # Increased timeout
    Click Login Button
    Verify Required Username Message  Required
    Verify Required Password Message  Required
    Close Browser

Login With Invalid Username And Valid Password
    Open Browser  ${URL}  firefox
    Maximize Browser Window
    Wait Until Element Is Visible  css=input[name='username']  30s  # Increased timeout
    Input Username  ${INVALID_USER}
    Input Password  ${VALID_PASS}
    Click Login Button
    Wait Until Element Is Visible  xpath=//p[contains(@class, 'oxd-alert-content-text')]  30s  # Increased timeout
    Verify Invalid Credentials Alert  Invalid credentials
    Close Browser

Login With Valid Username And Invalid Password
    Open Browser  ${URL}  firefox
    Maximize Browser Window
    Wait Until Element Is Visible  css=input[name='username']  30s  # Increased timeout
    Input Username  ${VALID_USER}
    Input Password  ${INVALID_PASS}
    Click Login Button
    Wait Until Element Is Visible  xpath=//p[contains(@class, 'oxd-alert-content-text')]  30s  # Increased timeout
    Verify Invalid Credentials Alert  Invalid credentials
    Close Browser
*** Keywords ***
Input Username
    [Arguments]  ${username}
    Input Text  css=input[name='username']  ${username}

Input Password
    [Arguments]  ${password}
    Input Text  css=input[name='password']  ${password}

Click Login Button
    Click Button  css=button[type='submit']

Verify Required Username Message
    [Arguments]  ${expected_msg}
    ${msg}=  Get Text  xpath=//span[contains(@class, 'oxd-input-field-error-message')]
    Should Be Equal  ${msg}  ${expected_msg}

Verify Required Password Message
    [Arguments]  ${expected_msg}
    ${msg}=  Get Text  xpath=//span[contains(@class, 'oxd-input-field-error-message')]
    Should Be Equal  ${msg}  ${expected_msg}

Verify Dashboard Is Displayed
    ${header}=  Get Text  xpath=//h6[text()='Dashboard']
    Should Be Equal  ${header}  Dashboard
Verify Invalid Credentials Alert
    [Arguments]  ${expected_msg}
    ${msg}=  Get Text  xpath=//p[contains(@class, 'oxd-alert-content-text')]
    Should Be Equal  ${msg}  ${expected_msg}
