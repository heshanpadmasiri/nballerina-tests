// RUN: runner %s | filecheck %s

public function foo1() {
}

function foo2(int x, int y) {
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

// CHECK: call void @foo1()
// CHECK: call void @foo2(i64 42, i64 43)
// CHECK: %. = call i64 @foo3()
// CHECK: %. = call i64 @foo4(i64 12, i64 13)
