//test harness include
#include "unity_fixture.h"
//#includes for module under test

#include "test_main.h"

TEST_GROUP(GroupName);

//Define file scope data accessible to test group members prior to TEST_SETUP.
TEST_SETUP(GroupName)
{
    //initialization steps are executed before each TEST
}
TEST_TEAR_DOWN(GroupName)
{
    //clean up steps are executed after each TEST
}


/**
 * Start test with float:s
 */
TEST(GroupName, BasicFloat)
{    
    float x = 2;
    float y = 4;

    TEST_ASSERT_EQUAL_FLOAT((x*y), 8);
    TEST_ASSERT_EQUAL_FLOAT((y/x), 2);
}


//Each group has a TEST_GROUP_RUNNER
TEST_GROUP_RUNNER(GroupName)
{
    //Each TEST has a corresponding RUN_TEST_CASE
    RUN_TEST_CASE(GroupName, BasicFloat);
    //RUN_TEST_CASE(GroupName, AnotherUniqueTestName);
}


void runAllTests()
{
    RUN_TEST_GROUP(GroupName);
    //RUN_TEST_GROUP(AnotherGroupName);
}

