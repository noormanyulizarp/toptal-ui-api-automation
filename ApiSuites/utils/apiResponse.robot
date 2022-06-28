*** Settings ***
Resource               ../resources/importer.robot

*** Keyword ***
Response Should Be
    [Arguments]             ${value}=200                            ${reason}=OK
    Run Keyword If          '${value}'=='200'
    ...                     Should Be Equal As Strings              ${response.status_code}     ${value}
    ...                     Should Be Equal As Strings              ${response.reason}          ${reason}
    ...                     ELSE IF                                 '${value}'=='500'
    ...                     Should Not Be Equal As Strings          ${response.reason}          ${value}
    ...                     ELSE IF                                 '${value}'=='403'
    ...                     Should Not Be Equal As Strings          ${response.reason}          ${value}
    ...                     ELSE IF                                 '${value}'=='404'
    ...                     Should Be Equal As Strings              ${response.status_code}     ${value}
    ...                     ELSE IF                                 '${value}'=='401'
    ...                     Should Be Equal As Strings              ${response.status_code}     ${value}

Response Body Should Be Equals
    [Arguments]             @{values}
    Log To Console          ${response.json()}
    Log                     ${response.json()}
    FOR                     ${value}                                IN                          @{values}
        ${value}            convert to string                       ${value}
        ${state}            Run Keyword And Return Status           Element Should Exist        ${response.json()["data"]}
        ...                 ${value}
        Run Keyword If      '${state}'=='True'                      Element Should Exist        ${response.json()["data"]}                    ${value}
        ...                 ELSE                                    Element Should Exist        ${response.text}                              ${value}
    END

Comparing With Expected JSON
    ${response_json}=       Convert To Json         ${response_json}
    ${expected_json}=       Convert To Json         ${expected}
    Compare With Expected Json                      ${response_json}    ${expected_json}

Response Body Should Be Equal
    [Arguments]         ${key}          ${index}     ${value}
    ${data}=            Set Variable    ${response.json()["data"][${index}]["${key}"]}
    ${data}=            Convert To String            ${data}
    should be equal     ${data}         ${value}

Response Should Be Match With Return Count
    [Arguments]         ${codition}              ${count_json}
    Log To Console      len(${response.json()["data"]})
    Should Be true      len(${response.json()["data"]}) ${codition} ${count_json}