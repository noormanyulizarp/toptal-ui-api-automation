*** Settings ***
Resource            ../resource.robot
Suite Teardown      Close All Browsers

*** Test Case ***
User able to search music
    [Documentation]                         User able to search usng top search button, default search  ${KEYWORD_SEARCH}
    Open Browser With Specific URL          ${YOUTUBEMUSICURL}
    Verify Searchbox
    Insert Keyword on Searchbox
    Hit Search
    Verify Search