*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${url}  http://localhost:8080
${username}  victor

*** Test Cases ***
Should Login user with variable username
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    ...  the response body contains the 'title' key with value as 'London',
    ...  and the response body contains the key 'location_type'.
    [tags]  API Smoke auth
    Create Session  mysession  http://localhost:8080  verify=true
    &{data}=    Create dictionary  username=victor
    ${response}=    POST On Session    mysession  /auth/login  json=${data}  expected_status=anything
    Status Should Be  200  ${response}  #Check Status as 200
    Dictionary Should Contain Key    ${response.json()}  username