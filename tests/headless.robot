*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser 

*** Test Cases ***
Chrome
    [Tags]          headless    chrome    smoke
    Sleep           3
    Open Browser    https://www.google.fi    headlesschrome

Firefox 
    [Tags]          headless    firefox    smoke]
    Sleep           3
    Open Browser    https://www.google.fi    headlessfirefox
