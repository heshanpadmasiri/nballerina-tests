// RUN: runner %s | filecheck %s

function foo(int v, int w, int x, int y, int z) {
    return;
}

function bar() returns int{
    return 44;
}

public function test() {
    int val = 43;
    foo(42, val, bar(), ~val, (val + 42));
}

// CHECK: call void @foo(i64 42, i64 %., i64 %., i64 %., i64 %.)

