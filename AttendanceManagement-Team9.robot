** Settings **
Library     Selenium2Library
Variables   Config/LoginConfig.py
Resource    Resources/LoginResource.robot
# Suite Teardown    Close Browser

** Variables **
${userName}     ${config["userName"]}
${pass}     ${config["pass"]}
${name}     ${config["name"]}
${timeout}  ${config["timeout"]} 

** Test cases **
Verify The User Can Login With Valid Credentials
    [Documentation]     As a user I want to be able to login to the webpage
    Go To Login Page
    Input Username  ${userName}
    Input Password  ${pass}
    Click Button       id=login-button
    Wait Until Element Is Visible   class=authorTitle   ${timeout}
    
Verify The User Can Go To The Dashboard
    [Documentation]     As a user I want to be able to open my Dashboard
    Mouse Over  class=dropLink
    Wait Until Element Is Visible   id=viewPro-icon   ${timeout}
    Click Element      id=viewPro-icon
    Wait Until Element Is Visible   class=ng-scope   ${timeout}

Verify The User Can View All The Options Under Attendance Management
    [Documentation]     As a user I want to be able to view Attendance Management options
    Click Element       id=attendance
    Wait Until Element Is Visible   id=viewAttendance   ${timeout}
    Wait Until Element Is Visible   id=attendanceMonthlySheet   ${timeout}
    Wait Until Element Is Visible   id=attendanceSummarySheet   ${timeout}
    Wait Until Element Is Visible   id=adjustAttendance   ${timeout}

Verify The User Can View Their Own Attendance For The Current Month
    [Documentation]     As a user I want to be able to view my own attendance
    Click Element       id=viewAttendance
    Element Should Contain  class=link    ${name}

