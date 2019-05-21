*** Settings ***
Library               SeleniumLibrary
Suite Setup           Log                                            I'm inside TestSuit setup
Suite Teardown        Log                                            I'm inside TestSuit teardown
Test Setup            Log                                            I'm inside TestCase setup
Test Teardown         Log                                            I'm inside TestCase teardown
Default Tags          sanity

*** Test Cases ***
MyFirstTest
                      [Tags]                                         smoke
                      Log                                            Hello world ...
MySecondTest
                      Set Tags                                       regression
                      Log                                            Second Marina's test.
MyThirdTest
                      Log                                            Third Marina's test.
MyThirdTest
                      Log                                            Fourth Marina's test.
FirstSeleniumTest
                      Open Browser                                   https://google.com                                chrome
                      Set Browser Implicit Wait                      5
                      Input Text                                     name=q                                            Automation step by step
                      Press Keys                                     name=q                                            ESCAPE
                      Click Button                                   name=btnK
                      Sleep                                          4
                      Close Browser
                      Log                                            Test completed

SampleLoginTest
                      [Documentation]                                This is a sample login test
                      Open Browser                                   ${URL}                                            chrome
                      Set Browser Implicit Wait                      5
                      LoginKW
                      Click Element                                  id=welcome
                      Click Element                                  link=Logout
                      Close Browser
                      Log                                            Test completed
                      Log                                            This test was executed by %{username} on %{os}

*** Variables ***
${URL}                https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}        Admin                                          admin123
&{LOGINDATA}          username=Admin                                 password=admin123

*** Keywords ***
LoginKW
                      Input Text                                     id=txtUsername                                    @{CREDENTIALS}[0]
                      Input Password                                 id=txtPassword                                    &{LOGINDATA}[password]
                      Click Button                                   id=btnLogin


