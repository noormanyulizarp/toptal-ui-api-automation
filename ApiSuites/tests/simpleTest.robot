*** Settings ***                                
Resource                        ../resources/importer.robot
Test Setup
*** Variable ***
${assertionjson}                ApiSuites/resources/assertion.json

*** Test Case ***
Simple Test
    [Documentation]             This test is to get movie detail
    [Tags]                      ghibli-api
    ${payload}                  Get File                    ${assertionjson}
    ${param}                    Evaluate                    json.loads('''${payload}''')        json
    Create Session              simple-session              ${base_url}${simple_url}             verify=True
    ${response}=                Get Request                 simple-session            /58611129-2dbc-4a81-a72f-77ddfc1b1b49
    Log                         ${response.json()}
    Set Global Variable         ${response}
    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["simple"]["id"]}")
    apiResponse.Response Body Should Be Equals              .title:contains("${param["simple"]["title"]}")

Simpe Test Two
    [Documentation]             This test is to get people details
    [Tags]                      ghibli-api
    ${payload}                  Get File                    ${assertionjson}
    ${param}                    Evaluate                    json.loads('''${payload}''')        json
    Create Session              simple-session              ${base_url}${simple_url_two}        verify=True
    ${response}=                Get Request                 simple-session            /986faac6-67e3-4fb8-a9ee-bad077c2e7fe
    Log                         ${response.json()}
    Set Global Variable         ${response}
    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["simpletwo"]["id"]}")
    apiResponse.Response Body Should Be Equals              .name:contains("${param["simpletwo"]["name"]}")