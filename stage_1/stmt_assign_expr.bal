public function bar() returns int {
    return 43;
}

public function foo() {
    int val1; 
    val1 = 42;
    val1 = bar();
    val1 = ~val1;
    val1 = val1 + val1;
    val1 = (val1 + val1);
    val1 = val1;
}
