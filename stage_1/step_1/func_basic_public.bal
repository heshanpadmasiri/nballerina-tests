// RUN: runner %s | filecheck %s

public function foo() {
}

public function bar() returns int {
    return 42;
}

// CHECK: define dso_local void @foo()
// CHECK: define dso_local i64 @bar()
