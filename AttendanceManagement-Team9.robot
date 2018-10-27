** Settings **
Library     Selenium2Library
Variables   Config/LoginConfig.py
Resource    Resources/LoginResource.robot
Suite Teardown    Close Browser

** Variables **
${name}     ${config["name"]}
${userName}     ${config["userName"]}
${pass}     ${config["pass"]}
${name}     ${config["name"]}
${timeout}  ${config["timeout"]} 
${timeout2}  ${config["timeout2"]} 
${allManagers}  ${config["allManagers"]}
${manager}  ${config["manager"]}
${empl}     ${config["empl"]}

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

Verify The User Can View Attendance For The Current Month
    [Documentation]     As a user I want to be able to view attendance for the current month
    Click Element       id=viewAttendance
    Wait Until Element Is Visible  css=div.col-md-12:nth-child(5) > div:nth-child(3)   ${timeout2}

Verify Attendance Is For Current User
    [Documentation]     As a user the attendance under View Attendance should be my own
    Element Should Contain    css=div.col-md-12:nth-child(5) > div:nth-child(3)     ${name}

Verify The User Can View Attendance Monthly Sheet
    [Documentation]     As a user I want to be able to view attendance monthly sheet
    Click Element       id=attendanceMonthlySheet
    Wait Until Element Is Visible  class=pdfColor   ${timeout}

Verify The Current User Can View All Managers' Attendance Sheet
    [Documentation]     As a user I want to be able to view managers' attendance
    Click Element       css=.minWDrop > div:nth-child(1) > span:nth-child(1)
    Input Text      xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[1]/div/input[1]    ${allManagers}
    Press Key    xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[1]/div/input[1]    \\13

Verify The Current User Can View A Specific Manager's Attendance Sheet
    [Documentation]     As a user I want to be able to view a specific managers' attendance
    Click Element       css=.minWDrop > div:nth-child(1) > span:nth-child(1)
    Input Text      xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[1]/div/input[1]    ${manager}
    Press Key    xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[1]/div/input[1]    \\13
    Click Element       css=div.printHide:nth-child(2) > div:nth-child(1) > div:nth-child(1) > span:nth-child(1)
    Input Text      xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[2]/div/input[1]   ${empl}
    Press Key    xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[2]/div/input[1]    \\13
    Element Should Contain    css=.empTimesheetDetailWrap > a:nth-child(2)     ${empl}

Verify The User can Add Overtime For Selected Employee And Approve It
    [Documentation]     As a user I want to be able to add overtime for the selected user
    Click Element       css=div.row:nth-child(4) > div:nth-child(1) > button:nth-child(1)
    Wait Until Element Is Visible  id=overTime   ${timeout}
    Input Text      id=overTime     3
    Input Text      id=overTimeReason     Test
    Select From List      id=overTimeType     Work from home
    Click Element   css=div.col-sm-12:nth-child(2) > button:nth-child(1)
    Click Element   css=button.ng-scope
    Wait Until Element Is Visible       css=div.col-sm-12:nth-child(3) > button:nth-child(1)    ${timeout}
    Click Element   css=div.col-sm-12:nth-child(3) > button:nth-child(1)

Verify That Overtime Approval Is By Current Logged In User
    [Documentation]     The approval should be by the current logged in user
    Element Should Contain    xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[3]/div/div[3]/span[2]/a    ${name}

Verify The Current User Can Edit Overtime
    [Documentation]     As a user I want to be able to edit overtime for the selected user
    Click Element   css=div.row:nth-child(4) > div:nth-child(1) > table:nth-child(2) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(5) > button:nth-child(1)
    Wait Until Element Is Visible   id=overTime     ${timeout}
    Input Text      id=overTimeReason     Testing
    Click Element   css=div.col-sm-12:nth-child(2) > button:nth-child(1)
    Element Should Contain    xpath=/html/body/div[3]/ui-view/div/ui-view/ui-view/div/div/div/div[2]/div[4]/div[2]/form/div[4]/div/table/tbody/tr[1]/td[2]    Testing

Verify The Current User Can Delete Overtime
    [Documentation]     As a user I want to be able to delete overtime for the selected user
    Click Element   css=div.row:nth-child(4) > div:nth-child(1) > table:nth-child(2) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(6) > button:nth-child(1)

Verify The User Can View Attendance Summary Sheet
    [Documentation]     As a user I want to be able to view attendance monthly sheet
    Click Element       id=attendanceSummarySheet
    Wait Until Element Is Visible  class=input-group   ${timeout}

Verify The User Can View The Adjust Attendance Page
    [Documentation]     As a user I want to be able to view the adjust attendance page
    Click Element       id=adjustAttendance
    Wait Until Element Is Visible  class=btn-primary   ${timeout}

