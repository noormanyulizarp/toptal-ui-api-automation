*** Settings ***                                
Resource            ../resources/importer.robot
Test Setup          Load Payload

*** Variable ***
${film_id}=             /58611129-2dbc-4a81-a72f-77ddfc1b1b49      
${people_id_one}=           /986faac6-67e3-4fb8-a9ee-bad077c2e7fe
${people_id_two}=       /0f8ef701-b4c7-4f15-bd15-368c7fe38d0a

*** Test Case ***
API FIlm Response Details Cointains Id And Title
    [Documentation]             This test is to get movie detail and shou d contains id and name
    [Tags]                      ghibli-api

    Create Session              simple-session              ${base_url}${films}         verify=True
    ${response}=                Get Request                 simple-session              ${film_id}       
    Log                         ${response.json()}
    Set Test Variable           ${response}

    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["movie_mocked_data"]["id"]}")
    apiResponse.Response Body Should Be Equals              .title:contains("${param["movie_mocked_data"]["title"]}")

API Peoples Response Details Have Id And Name
    [Documentation]             This test is to get people details and should contains id and name
    [Tags]                      ghibli-api

    Create Session              simple-session              ${base_url}${people}    verify=True
    ${response}=                Get Request                 simple-session          ${people_id_one}
    Log                         ${response.json()}
    Set Test Variable           ${response}

    apiResponse.Response Should Be                          200       OK
    apiResponse.Response Body Should Be Equals              .id:contains("${param["people_mocked_data"]["id"]}")
    apiResponse.Response Body Should Be Equals              .name:contains("${param["people_mocked_data"]["name"]}")

API Peoples Response Details Have Same Payload As Assertion
    [Documentation]             This test is to get people details, and the payload are same with the assertion
    [Tags]                      ghibli-api

    ${expected_json}            Get File                    ApiSuites/resources/assertion.json
    ${expected}                 Evaluate                    json.loads('''${expected_json}''')        json

    Create Session              simple-session              ${base_url}${people}    verify=True
    ${response}=                Get Request                 simple-session          ${people_id_two}
    Log                         ${response.json()}
    Set Test Variable           ${response}

    apiResponse.Response Should Be                          200       OK
    Comparing With Expected JSON                            ${response.json()}      ${expected["another_people_mocked_data"]}