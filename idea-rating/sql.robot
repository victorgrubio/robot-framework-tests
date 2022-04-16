*** Settings ***
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***
${DBHost}         127.0.0.1
${DBName}         idearatingdb
${DBPass}         idearating
${DBPort}         3307
${DBUser}         idearating

*** Test Cases ***
Check If Exists In DB - Victor
    [Tags]    db    smoke
    Check If Exists In Database    SELECT username FROM users WHERE username = 'Victor';

Check If there is Ideas In DB
    [Tags]    db    smoke
    Check If Exists In Database    SELECT id FROM ideas;

Verify Query - Get results as a list of dictionaries
    [Tags]    db    smoke
    ${output} =    Query    SELECT * FROM ideas;    \    True
    Log    ${output}
    Should Be Equal As Strings    ${output[0]}[title]  SAMPLE TITLE
