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
 * Start test to see that sprintf is working.
 */
TEST(GroupName, Basic_sprintf)
{
    int arr_size=10;
    char str[arr_size];
    memset(str, 0x0, arr_size);

    //First add something and check it.
    sprintf(str, "1234");

    TEST_ASSERT_EQUAL_INT( (char)str[0], (char)'1');
    TEST_ASSERT_EQUAL_INT( (char)str[1], (char)'2');
    TEST_ASSERT_EQUAL_INT( (char)str[2], (char)'3');
    TEST_ASSERT_EQUAL_INT( (char)str[3], (char)'4');
    TEST_ASSERT_EQUAL_INT( (char)str[4], (char)'\0');
    TEST_ASSERT_EQUAL_INT( (char)str[5], 0x0);


    //First add something else and check it.
    //sprintf(str, "4321");
    sprintf(str, "%d", 4321);
    TEST_ASSERT_EQUAL_INT( (char)str[0], (char)'4');
    TEST_ASSERT_EQUAL_INT( (char)str[1], (char)'3');
    TEST_ASSERT_EQUAL_INT( (char)str[2], (char)'2');
    TEST_ASSERT_EQUAL_INT( (char)str[3], (char)'1');
    TEST_ASSERT_EQUAL_INT( (char)str[4], (char)'\0');

    //Check strlen so "4321" is 4 chars!
    TEST_ASSERT_EQUAL_INT( strlen(str), 4);

    //And check that snprintf is working as well
    TEST_ASSERT_EQUAL_INT( snprintf(str, arr_size, "5678"), 4 );
    TEST_ASSERT_EQUAL_INT( (char)str[0], (char)'5');
    TEST_ASSERT_EQUAL_INT( (char)str[1], (char)'6');
    TEST_ASSERT_EQUAL_INT( (char)str[2], (char)'7');
    TEST_ASSERT_EQUAL_INT( (char)str[3], (char)'8');
    TEST_ASSERT_EQUAL_INT( (char)str[4], (char)'\0');

}


//Each group has a TEST_GROUP_RUNNER
TEST_GROUP_RUNNER(GroupName)
{
    //Each TEST has a corresponding RUN_TEST_CASE
    RUN_TEST_CASE(GroupName, Basic_sprintf);
    //RUN_TEST_CASE(GroupName, AnotherUniqueTestName);
}


void runAllTests()
{
    RUN_TEST_GROUP(GroupName);
    //RUN_TEST_GROUP(AnotherGroupName);
}

