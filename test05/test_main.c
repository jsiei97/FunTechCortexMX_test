//test harness include
#include "unity_fixture.h"
//#includes for module under test

//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>

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


#define SIZE 10

/**
 * Test to see if malloc and free is working.
 */
TEST(GroupName, BasicMalloc)
{
    //First use malloc 3 times
    char* str1 = malloc(SIZE);
    TEST_ASSERT_NOT_NULL(str1);

    char* str2 = malloc(SIZE);
    TEST_ASSERT_NOT_NULL(str2);

    char* str3 = malloc(SIZE);
    TEST_ASSERT_NOT_NULL(str3);

    //Check so the pointer adress is not the same
    if( &str1 == &str2 || &str2 == &str3)
    {
        TEST_FAIL();
    }

    //Fill the areas with some data that is easy to spot in a hexeditor.
    //And check so we can write there.
    memset(str1, 0x55, SIZE);
    memset(str2, 0x66, SIZE);
    memset(str3, 0x77, SIZE);
    
    TEST_ASSERT_EQUAL_INT( str1[0],      0x55);
    TEST_ASSERT_EQUAL_INT( str1[SIZE-1], 0x55);

    TEST_ASSERT_EQUAL_INT( str2[0],      0x66);
    TEST_ASSERT_EQUAL_INT( str2[SIZE-1], 0x66);

    TEST_ASSERT_EQUAL_INT( str3[0],      0x77);
    TEST_ASSERT_EQUAL_INT( str3[SIZE-1], 0x77);


    //abort();

    //Cleanup
    free(str1);
    free(str2);
    free(str3);

    /// @todo How do check that the free function is working?
}


//Each group has a TEST_GROUP_RUNNER
TEST_GROUP_RUNNER(GroupName)
{
    //Each TEST has a corresponding RUN_TEST_CASE
    RUN_TEST_CASE(GroupName, BasicMalloc);
    //RUN_TEST_CASE(GroupName, AnotherUniqueTestName);
}


void runAllTests()
{
    RUN_TEST_GROUP(GroupName);
    //RUN_TEST_GROUP(AnotherGroupName);
}

