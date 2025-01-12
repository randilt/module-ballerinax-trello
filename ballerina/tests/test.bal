import ballerina/os;
import ballerina/test;

// Configurations
configurable string apiKey = os:getEnv("TRELLO_API_KEY");
configurable string token = os:getEnv("TRELLO_TOKEN");
configurable string testActionId = os:getEnv("TEST_ACTION_ID");
configurable string testBoardId = os:getEnv("TEST_BOARD_ID");
configurable string testCardId = os:getEnv("TEST_CARD_ID");
configurable string testListId = os:getEnv("TEST_LIST_ID");
configurable string testMemberId = os:getEnv("TEST_MEMBER_ID");
configurable string testOrgId = os:getEnv("TEST_ORG_ID");

Client trello = check new Client(
    {
        'key: apiKey,
        token: token
    }
);

@test:Config {}
function testGetActionCard() returns error? {
    Card response = check trello->/actions/[testActionId]/card;
    test:assertNotEquals(response.id, "", "Card ID should not be empty");
    test:assertNotEquals(response.name, "", "Card name should not be empty");
}

@test:Config {}
function testGetActionList() returns error? {
    TrelloList response = check trello->/actions/[testActionId]/list;
    test:assertNotEquals(response.id, "", "List ID should not be empty");
    test:assertNotEquals(response.name, "", "List name should not be empty");
}

@test:Config {}
function testGetActionMember() returns error? {
    Member response = check trello->/actions/[testActionId]/member;
    test:assertNotEquals(response.id, "", "Member ID should not be empty");
    test:assertNotEquals(response.username, "", "Username should not be empty");
}

@test:Config {}
function testGetActionMemberCreator() returns error? {
    Member response = check trello->/actions/[testActionId]/memberCreator;
    test:assertNotEquals(response.id, "", "Member Creator ID should not be empty");
    test:assertNotEquals(response.username, "", "Creator username should not be empty");
}

@test:Config {}
function testGetActionOrganization() returns error? {
    Organization response = check trello->/actions/[testActionId]/organization;
    test:assertNotEquals(response.id, "", "Organization ID should not be empty");
    test:assertNotEquals(response.displayName, "", "Organization name should not be empty");
}

@test:Config {}
function testGetBoard() returns error? {
    Board response = check trello->/boards/[testBoardId];
    test:assertNotEquals(response.id, "", "Board ID should not be empty");
    test:assertNotEquals(response.name, "", "Board name should not be empty");
}

@test:Config {}
function testBatch() returns error? {
    error? response = check trello->/batch;
    test:assertNotEquals(response, (), "Batch response should not be null");
}
