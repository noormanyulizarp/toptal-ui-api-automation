*** Keywords ***
Login With Eligible User
    [ARGUMENTS]                         ${EMAIL}=${EMAIL}   ${PASSWORD}=${PASSWORD}
    Go To Sign In Page
    Insert Email And Password Value     ${EMAIL}        ${PASSWORD}
    Click Next Button
    Verify Successfully Login

Go To Sign In Page
    ${AbleToClick}  Run Keyword And Return Status
    ...             Click Sign In Button

    Run Keyword If  not ${AbleToClick}
    ...             Run Keyword and Ignore Error        Handle Alert	                timeout=${DEFAULT_TIMEOUT}

    Verify on Sign In Page

Insert Email And Password Value
    [ARGUMENTS]     ${EMAIL}=${EMAIL}   ${PASSWORD}=${PASSWORD}

    ${status}       Run Keyword And Return Status
    ...             Insert Email User   ${EMAIL}

    Run Keyword If  not ${status}       Run Keywords
    ...             Activated Email Input
    ...             Insert Email User   ${EMAIL}

    Click Next Button
    Insert Password User                ${PASSWORD}