public function foo1() = external;

public function foo2() returns int = external;

public function foo3(int val) returns int = external;

public function test() {
    foo1();
    int val = foo2();
    int val2 = foo3(val);
}
