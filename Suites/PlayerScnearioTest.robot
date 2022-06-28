*** Settings ***
Resource            ../resource.robot
Test Teardown       Close All Browsers
Suite Teardown      Close All Browsers

*** Test Case ***
User Able Play Song On music.youtube.com Web Player
    [Documentation]                         Non logged and non subs logged user are able to play
    Open Browser With Specific URL          ${ITEMTOPLAY[1]}
    Play From Bottom Left Player Controller
    Make Sure Player Was Played

User Able Pause Song On music.youtube.com Web Player
    [Documentation]                         Non logged and non subs user are able to play
    Open Browser With Specific URL          ${ITEMTOPLAY[1]}
    Play From Bottom Left Player Controller
    Pause From Bottom Left Player Controller
    Make Sure Player Was Paused

Logged User Able To Play And Pause Song On music.youtube.com Web Player
    [Documentation]                         Logged and non subs user are able to play, after opening link will be auto play
    Open Browser With Specific URL          ${YOUTUBEMUSICURL}
    Login With Eligible User
    Open Browser With Specific URL          ${ITEMTOPLAY[1]}
    Make Sure Player Was Played
    Play From Bottom Left Player Controller
    Make Sure Player Was Paused 

User Able to Play Next And Previous Song On music.youtube.com Web Player
    [Documentation]                         Non logged and non subs user are able to play song and do previous song
    Open Browser With Specific URL          ${ITEMTOPLAY[1]}
    Play From Bottom Left Player Controller
    Make Sure Player Was Played
    Make Sure User Able To Play Next Song
    Make Sure User Able To Play Previous Song