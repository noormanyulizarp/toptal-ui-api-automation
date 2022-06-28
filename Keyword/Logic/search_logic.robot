*** Keywords ***
Insert Keyword on Searchbox
    [Arguments]             ${KEYWORD_SEARCH}=${KEYWORD_SEARCH}
    Activated Search
    SeleniumLibrary.Wait Until Element Is Visible       ${searchbox_input]}      timeout=${MEDIUM_TIMEOUT}
    SeleniumLibrary.Input Text                          ${searchbox_input]}      ${KEYWORD_SEARCH}

Verify Search
    [Arguments]             ${KEYWORD_SEARCH}=${KEYWORD_SEARCH}
    SeleniumLibrary.Wait Until Element Is Visible       xpath=//a[contains(text(),"${KEYWORD_SEARCH}")]  timeout=${MEDIUM_TIMEOUT}
    Sleep       3