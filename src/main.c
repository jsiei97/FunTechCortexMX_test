void test_failed(int number) {
    while(1);
}

void test_success(int number) {
    while(1);
}

int main(void) {
    int status = start_test();

    if( status > 0 ) {
        test_failed(status);
    }
    test_success(0);

    while(1);
}
