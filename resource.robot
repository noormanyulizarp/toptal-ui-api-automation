*** Settings ***
Resource    Keyword/importer.robot
Resource    variable.robot

Library     SeleniumLibrary    ${DEFAULT_TIMEOUT}
Library     Collections
Library     String
Library     DebugLibrary

*** Keywords ***
Open Browser With Specific URL
    [ARGUMENTS]                     ${URL}
    SeleniumLibrary.Open Browser    url=${URL}    browser=${CHROME}     alias=${BROWSERALIAS}
    Set Selenium Speed              0.5

Open Browser With Specific URL And Close All Browsers Before
    [ARGUMENTS]                     ${URL}
    Close All Browsers
    SeleniumLibrary.Open Browser    url=${URL}    browser=${CHROME}      alias=${BROWSERALIAS}
    Set Selenium Speed              0.5
