public function foo1() returns int {
    return 42;
}

public function foo2() returns int {
    int x = 42;
    return x;
}

public function foo3() returns int {
    return foo1();
}

public function foo4() returns int {
    int x = 42;
    return ~x;
}

public function foo5() returns int {
    int x = 42;
    int Y = 52;
    return x + Y;
}

public function foo6() returns int {
    int x = 42;
    int Y = 52;
    return (x + Y);
}
