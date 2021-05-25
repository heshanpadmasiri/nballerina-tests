
public function foo1() {
}

function foo2(int x, int y) {
    return;
}

public function foo3() returns int {
    return 21;
}

function foo4(int x, int y) returns int {
    return y;
}

public function test() {
    foo1();
    foo2(42, 43);
    int val1 = foo3();
    int val2 = foo4(12, 13);
}
