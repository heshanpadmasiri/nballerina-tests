// RUN: runner %s | filecheck %s

public function foo(int x) {
    int val = x;
}

// CHECK: %. = alloca i64, align 8
// CHECK: %. = alloca i64, align 8
// CHECK: store i64 %., i64\* %., align 8
// CHECK: %. = load i64, i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
