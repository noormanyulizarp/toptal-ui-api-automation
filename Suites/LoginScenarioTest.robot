*** Settings ***
Resource            ../resource.robot
Suite Setup         Open Browser With Specific URL     ${YOUTUBEMUSICURL}
Suite Teardown      Close All Browsers

*** Test Case ***
Able To Login On Web music.youtube.com Use Google Account
    Open Browser With Specific URL     ${YOUTUBEMUSICURL}
    Login With Eligible User






