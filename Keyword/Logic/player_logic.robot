*** Keywords ***
Press Play Button From Bottom Left Player Controller
    ${PlayBtnVisible}   Run Keyword And Return Status
    ...                 Click Play Button

    Run Keyword If      not ${PlayBtnVisible}
    ...                 Activate Play Button

Press Pause Button From Bottom Left Player Controller
    ${PauseBtnVisible}  Run Keyword And Return Status
    ...                 Click Pause Button

    Run Keyword If      not ${PauseBtnVisible}
    ...                 Activate Pause Button

Play From Bottom Left Player Controller
    Verify Bottom Left Player Controller Are Visible
    Verify Play Button Are Visbile
    Press Play Button From Bottom Left Player Controller

Pause From Bottom Left Player Controller
    Verify Bottom Left Player Controller Are Visible
    Verify Pause Button Are Visbile
    Press Pause Button From Bottom Left Player Controller

Wait Player For A Seconds
    [Arguments]         ${seconds}=${SLEEP_FOR_5_SECOND}
    Sleep               ${seconds}

Make Sure Player Was Played
    Wait Player For A Seconds
    ${LeftCtrlVisbl}    Run Keyword And Return Status
    ...                 Verify Timer On Left Player Controller Are Visible

    Run Keyword If      not ${LeftCtrlVisbl}   Run Keywords
    ...                 Handling Ads On Player
    ...                 Verify Timer On Left Player Controller Are Visible
    ...                 Player Timer Are Played 

    Run Keyword If      ${LeftCtrlVisbl}        Run Keywords
    ...                 Verify Timer On Left Player Controller Are Visible
    ...                 Player Timer Are Played

Make Sure Player Was Paused
    Wait Player For A Seconds
    ${LeftCtrlVisbl}    Run Keyword And Return Status
    ...                 Verify Timer On Left Player Controller Are Visible

    Run Keyword If      not ${LeftCtrlVisbl}        Run Keywords
    ...                 Handling Ads On Player
    ...                 Verify Timer On Left Player Controller Are Visible
    ...                 Player Timer Are Paused

Handling Ads On Player
    Wait Player For A Seconds
    ${adsShown}         Run Keyword And Return Status
    ...                 Verify Skip Ads Button Are Visible

    Run Keyword If      ${adsShown}         Run Keywords
    ...                 Press Skip Ads Button

Verify Skip Ads Button Are Visible
    ${skipAdsShown}     Run Keyword And Return Status
    ...                 Verify Lewati Iklan Are Visible

    Run Keyword If      not ${skipAdsShown}
    ...                 Verify Skip Ads Lewati Iklan Are Visible

Press Skip Ads Button
    ${ableToClickSkip}  Run Keyword And Return Status
    ...                 Click Lewati Iklan Text

    Run Keyword If      not ${ableToClickSkip}
    ...                 Click Skip Ads Text

Player Timer Are Played
    Get Item Duration Details
    Wait Player For A Seconds
    Should Not Be Equal     ${currentDuration}       ${ZERODURATION}

Player Timer Are Paused
    Get Item Duration Details
    Set Test Variable       ${oldcurrentDuration}   ${currentDuration}

    Press Pause Button From Bottom Left Player Controller

    Get Item Duration Details
    Should Not Be Equal     ${currentDuration}       ${oldcurrentDuration}

Get Item Duration Details
    Get Timer Information
    Get Song Total Duration
    Get Song Current Duration

Get Song Total Duration
    [ARGUMENTS]         ${timervalue}=${timervalue}
    ${totalDuration}    Fetch From Right    ${timervalue}       ${TIMER_SEPARATOR}
    ${totalDuration}    Remove String       ${totalDuration}    ${SPACE}
    Set Suite Variable  ${totalDuration}

Get Song Current Duration
    [ARGUMENTS]         ${timervalue}=${timervalue}
    ${currentDuration}  Fetch From Left     ${timervalue}       ${TIMER_SEPARATOR}
    ${currentDuration}  Remove String       ${currentDuration}  ${SPACE}
    Set Suite Variable  ${currentDuration}

Make Sure Play And Pause Button Are Paused
    Get Button Play And Pause State
    Should Be Equal         ${PlayAndPauseState}    ${TEXT_PAUSE}

Make Sure Play And Pause Button Are Playing
    Get Button Play And Pause State
    Should Be Equal         ${PlayAndPauseState}    ${TEXT_PLAYING}

#song     
Get Song Information
    Get Song title
    Get Song Artist

Set Old Song Information
    Get Song Information
    Set Suite Variable      ${OLD_SONG_SINGER}      ${SONG_SINGER}
    Set Suite Variable      ${OLD_SONG_TITLE}       ${SONG_TITLE}

Set Current Song Information
    Get Song Information
    Set Suite Variable      ${CURRENT_SONG_SINGER}  ${SONG_SINGER}
    Set Suite Variable      ${CURRENT_SONG_TITLE}   ${SONG_TITLE}

Verify Different Artist
    Should Not Be Equal     ${OLD_SONG_SINGER}  ${CURRENT_SONG_SINGER}

Verify Different Title
    Should Not Be Equal     ${OLD_SONG_TITLE}  ${CURRENT_SONG_TITLE}

Verify Current Playing
    ${ArtistAreSame}        Run Keyword And Return Status           
    ...                     Verify Different Artist

    Run Keyword If          ${ArtistAreSame}
    ...                     Verify Different Title

Hit Next Button 
    ${nextBtnShown}         Run Keyword And Return Status
    ...                     Verify Hit Next Song Button
    
    Run Keyword If          ${nextBtnShown}
    ...                     Click Next Song Button

Hit Previous Button
    ${prevBtnShown}         Run Keyword And Return Status
    ...                     Verify Previous Song Button
    
    Run Keyword If          ${prevBtnShown}
    ...                     Click Previous Song Button

Make Sure User Able To Play Previous Song
    Set Old Song Information
    Hit Previous Button
    Set Current Song Information
    Verify Current Playing

Make Sure User Able To Play Next Song
    Set Old Song Information
    Hit Next Button
    Set Current Song Information
    Verify Current Playing