*** Variables ***
${login_button_selector}                name=login
${singin_button_selector}               xpath=//*[@class="sign-in-link style-scope ytmusic-nav-bar"]
${loginpage_text_selector}              xpath=//span[text()="to continue to YouTube Music"]
${succeslogin_verificator_selectpr}     xpath=//*[@class="sign-in-link style-scope ytmusic-nav-bar"]
${input_password_selector}              xpath=//input[@type="password"]
${input_email_selector}                 xpath=//input[@type="email"]
${nextbutton_onLogin_page}              xpath=//span[text()="Next"]

*** Keywords ***
Click Login Button
    Wait Until Page Contains Element    ${login_button_selector}       timeout=${FAST_TIMEOUT}

Click Sign In Button
    SeleniumLibrary.Click Link          ${singin_button_selector}

Verify on Sign In Page
    SeleniumLibrary.Wait Until Element Is Visible        ${loginpage_text_selector}     timeout=${FAST_TIMEOUT}

Insert Email User   
    [Arguments]             ${EMAIL}=${EMAIL}
    Sleep                   ${SLEEP_FOR_2_SECOND}
    SeleniumLibrary.Wait Until Page Contains Element     ${input_email_selector}        timeout=${MEDIUM_TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible        ${input_email_selector}        timeout=${MEDIUM_TIMEOUT}
    SeleniumLibrary.Input Text                           ${input_email_selector}        ${EMAIL}

Activated Email Input
    Click Element                           ${input_email_selector}

Click Next Button   
    SeleniumLibrary.Click Element           ${nextbutton_onLogin_page}

Insert Password User
    [Arguments]             ${PASSWORD}=${PASSWORD}
    Sleep                   ${SLEEP_FOR_5_SECOND}
    SeleniumLibrary.Wait Until Page Contains Element    ${input_password_selector}      timeout=${MEDIUM_TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible       ${input_password_selector}      timeout=${MEDIUM_TIMEOUT}
    Sleep                   ${SLEEP_FOR_2_SECOND}
    SeleniumLibrary.Input Text                          ${input_password_selector}      ${PASSWORD}

Verify Successfully Login
    SeleniumLibrary.Element Should Not Be Visible       ${succeslogin_verificator_selectpr}      timeout=5
    Sleep                   ${SLEEP_FOR_5_SECOND}