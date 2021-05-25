public function bar() returns int {
    return 43;
}

public function foo() {
    int x = -45;
    int y = -50;
    int val1 = 42 + 45;
    int val2 = x + y;
    int val3 = 47 + bar();
    int val4 = ~x + 35;
    int val5 = 49 + val1 + val2;
    int val6 = x + (60 + y);
}
