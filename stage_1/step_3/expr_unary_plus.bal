// RUN: runner %s | filecheck %s

public function foo(int x) returns int {
    return  +x;
}

// CHECK: %. = load i64, i64\* %., align 8
