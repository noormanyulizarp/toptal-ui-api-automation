*** Variables ***
${left_controller_player}               xpath=//span[@class="time-info style-scope ytmusic-player-bar"]
${play_pause_button}                    id=play-pause-button
${player_background}                    id=player-bar-background
${left_controller_player_timer_line}    xpath=//span[@class="time-info style-scope ytmusic-player-bar"]
${inner_player_ads}                     xpath=//div[@class="ytp-ad-player-overlay"]
${inner_player_ads_sipp_button}         xpath=//*[@class="ytp-ad-skip-button-container"]
${inner_player_ads_sipp_button_alt}     xpath=//*[@class="ytp-ad-skip-button ytp-button"]
${lewatiIklan_text_selector}            xpath=//*[contains(text(),"Lewati Iklan")]
${skipAds_text_selector}                xpath=//*[contains(text(),"Skip Ads")]
${next_button_btm_controller}           xpath=//*[@class="next-button style-scope ytmusic-player-bar"]
${prev_button_btm_controller}           xpath=//*[@class="previous-button style-scope ytmusic-player-bar"]
${song_subtitle_btm_controller}         xpath=//*[@class="subtitle style-scope ytmusic-player-bar"]
${song_title_btm_controller}            xpath=//*[@class="title style-scope ytmusic-player-bar"]

*** Keywords ***
#player
Verify Play Button Are Visbile
    Wait Until Element Is Visible       ${play_pause_button}        timeout=${FAST_TIMEOUT}

Activate Play Button
    Click Element                       ${play_pause_button}

Click Play Button
    Click Element                       ${play_pause_button}

#pause
Verify Pause Button Are Visbile
    Wait Until Element Is Visible       ${play_pause_button}        timeout=${FAST_TIMEOUT}

Activate Pause Button
    Click Element                       ${play_pause_button}

Click Pause Button
    Click Element                       ${play_pause_button}

Get Button Play And Pause State 
    ${state}                            Get Element Attribute   
    ...                                 ${play_pause_button}        title
    Log To Console                      ${state}
    ${state}                            Remove String               ${state}        ${SPACE}
    Set Test Variable                   ${PlayAndPauseState}        ${state}
    

#controller
Verify Bottom Left Player Controller Are Visible
    Wait Until Element Is Visible       ${player_background}         timeout=${FAST_TIMEOUT}
    Wait Until Element Is Visible       id=left-controls             timeout=${FAST_TIMEOUT}

Verify Timer On Left Player Controller Are Visible
    Wait Until Element Is Visible       ${left_controller_Player}    timeout=${MEDIUM_TIMEOUT}

Get Timer Information
    [Documentation]                     example timer, 0:02 / 4:32
    ${timervalue}                       Get text                     ${left_controller_player_timer_line}
    Set Suite Variable                  ${timervalue}                ${timervalue}

#ads
Verify Ads Are Visible
   Wait Until Element Is Visible        ${inner_player_ads}          timeout=${MEDIUM_TIMEOUT}

Verify Lewati Iklan Are Visible
   Wait Until Element Is Visible        ${lewatiIklan_text_selector}  timeout=${MEDIUM_TIMEOUT}

Click Lewati Iklan Text
   Click Element                        ${lewatiIklan_text_selector}

Verify Skip Ads Lewati Iklan Are Visible
   Wait Until Element Is Visible        ${skipAds_text_selector}      timeout=${MEDIUM_TIMEOUT}

Click Skip Ads Text
   Click Element                        ${skipAds_text_selector}

#song
Verify Hit Next Song Button
    Wait Until Element Is Visible       ${next_button_btm_controller}  timeout=${FAST_TIMEOUT}

Click Next Song Button
    Click Element                       ${next_button_btm_controller}

Verify Previous Song Button
    Wait Until Element Is Visible       ${prev_button_btm_controller}  timeout=${FAST_TIMEOUT}

Click Previous Song Button
    Click Element                       ${prev_button_btm_controller}

Get Song Title
    ${SONG_TITLE}       Get Text        ${song_title_btm_controller}
    Set Suite Variable  ${SONG_TITLE}

Get Song Artist 
    ${SONG_SINGER}      Get Text           ${song_subtitle_btm_controller}
    ${SONG_SINGER}      Fetch From Left    ${SONG_SINGER}       •
    ${SONG_SINGER}=     Remove String      ${SONG_SINGER}       ${SPACE}
    Set Suite Variable  ${SONG_SINGER}

