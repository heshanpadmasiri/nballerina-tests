// RUN: runner %s | filecheck %s

function foo() {
}

function bar() returns int {
    return 42;
}

// CHECK: define internal void @foo() 
// CHECK: define internal i64 @bar()
