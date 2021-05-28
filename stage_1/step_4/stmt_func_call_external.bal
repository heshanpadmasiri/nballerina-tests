// RUN: runner %s | filecheck %s

public function foo1() = external;

public function foo2() returns int = external;

public function foo3(int val) returns int = external;

public function test() {
    foo1();
    int val = foo2();
    int val2 = foo3(val);
}

// CHECK: declare dso_local void @foo1()
// CHECK: declare dso_local i64 @foo2()
// CHECK: declare dso_local i64 @foo3(i64)
