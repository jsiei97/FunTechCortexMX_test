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
 * Test to see that sscanf is working.
 */
TEST(GroupName, Basic_sscanf)
{
    char sentence []="Value 0x12";
    char str [20];
    int value;

    //Try to find a word and then a number in the "sentence"
    sscanf (sentence,"%s %x",str ,&value);
    //printf ("%s -> 0x%x %d\n",str,i,i);

    TEST_ASSERT_EQUAL_INT( value, 0x12 );
}


//Each group has a TEST_GROUP_RUNNER
TEST_GROUP_RUNNER(GroupName)
{
    //Each TEST has a corresponding RUN_TEST_CASE
    RUN_TEST_CASE(GroupName, Basic_sscanf);
    //RUN_TEST_CASE(GroupName, AnotherUniqueTestName);
}


void runAllTests()
{
    RUN_TEST_GROUP(GroupName);
    //RUN_TEST_GROUP(AnotherGroupName);
}

