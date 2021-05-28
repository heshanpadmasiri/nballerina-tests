// RUN: runner %s | filecheck %s

public function foo1() returns int {
    return 42;
}

public function foo2() returns int {
    int x = 42;
    return x;
}

// CHECK: ret i64 42
// CHECK: ret i64 %.
