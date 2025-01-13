import ballerina/io;
import ballerina/os;
import ballerina/test;

// Configurations
configurable string TRELLO_API_KEY = os:getEnv("TRELLO_API_KEY");
configurable string TRELLO_TOKEN = os:getEnv("TRELLO_TOKEN");
configurable string TEST_ACTION_ID = os:getEnv("TEST_ACTION_ID");
configurable string TEST_BOARD_ID = os:getEnv("TEST_BOARD_ID");
configurable string TEST_CARD_ID = os:getEnv("TEST_CARD_ID");
configurable string testListId = os:getEnv("TEST_LIST_ID");
configurable string testMemberId = os:getEnv("TEST_MEMBER_ID");
configurable string testOrgId = os:getEnv("TEST_ORG_ID");

Client trello = check new Client(
    {
        'key: TRELLO_API_KEY,
        token: ""
    }
);

@test:Config {}
function testGetCard() returns error? {
    Card response = check trello->/cards/[TEST_CARD_ID];
    test:assertNotEquals(response.id, "", "Card ID should not be empty");
    test:assertNotEquals(response.name, "", "Card name should not be empty");
}

@test:Config {}
function testGetBoard() returns error? {
    Board response = check trello->/boards/[TEST_BOARD_ID];
    io:println("response from testgetboard", response);
    test:assertNotEquals(response.id, "", "Board ID should not be empty");
    test:assertNotEquals(response.name, "", "Board name should not be empty");
}
