** Settings **
Library     Selenium2Library
Variables   ../Config/LoginConfig.py

** Variables **
${URL}      ${config["URL"]}
${browser}  ${config["browser"]}
${speed}    ${config["speed"]}

*** Keywords ***
Go To Login Page
   Set Selenium Speed     ${speed}
   Open Browser       ${URL}      ${browser}
   Maximize Browser Window

Input Username
   [Arguments]      ${username}
   Input Text   id=inputUsername     ${username}

Input Password
   [Arguments]      ${password}
   Input Text   id=inputPassword     ${password}