*** Variables ***
${searchbox_element}           xpath=//*[@class="search-icon style-scope ytmusic-search-box"]
${searchbox_input]}            xpath=//input[@id="input"]
${button_search}               xpath=//input[@placeholder="Search"]

*** Keywords ***
Verify Searchbox
    SeleniumLibrary.Wait Until Element Is Visible      ${searchbox_element}       timeout=${FAST_TIMEOUT}

Activated Search
    SeleniumLibrary.Wait Until Element Is Visible      ${searchbox_element}       timeout=${FAST_TIMEOUT}
    SeleniumLibrary.Click Element                      ${searchbox_element}

Hit Search
    Press Keys          ${button_search}                RETURN