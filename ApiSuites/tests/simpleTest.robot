*** Settings ***                                
Resource        ../resources/importer.robot
Test Setup      Load Payload

*** Test Case ***
Simple Test
    [Documentation]             This test is to get movie detail
    [Tags]                      ghibli-api

    Create Session              simple-session              ${base_url}${simple_url}        verify=True
    ${response}=                Get Request                 simple-session                  /58611129-2dbc-4a81-a72f-77ddfc1b1b49
    Log                         ${response.json()}
    Set Test Variable           ${response}
    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["simple"]["id"]}")
    apiResponse.Response Body Should Be Equals              .title:contains("${param["simple"]["title"]}")

Simpe Test Two
    [Documentation]             This test is to get people details
    [Tags]                      ghibli-api

    Create Session              simple-session              ${base_url}${simple_url_two}    verify=True
    ${response}=                Get Request                 simple-session                  /986faac6-67e3-4fb8-a9ee-bad077c2e7fe
    Log                         ${response.json()}
    Set Test Variable           ${response}
    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["simpletwo"]["id"]}")
    apiResponse.Response Body Should Be Equals              .name:contains("${param["simpletwo"]["name"]}")

Simpe Test Three
    [Documentation]             This test is to get people details
    [Tags]                      ghibli-api

    ${expected_json}            Get File                    ApiSuites/resources/assertion.json
    ${expected}                 Evaluate                   json.loads('''${expected_json}''')        json

    Create Session              simple-session              ${base_url}${simple_url_two}    verify=True
    ${response}=                Get Request                 simple-session                  /0f8ef701-b4c7-4f15-bd15-368c7fe38d0a
    Log                         ${response.json()}
    Set Test Variable           ${response}

    apiResponse.Response Should Be                          200       OK
    Comparing With Expected JSON    ${response.json()}      ${expected["simplethree"]}