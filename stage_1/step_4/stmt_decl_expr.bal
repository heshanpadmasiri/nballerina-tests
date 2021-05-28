// RUN: runner %s | filecheck %s

public function bar() returns int {
    return 43;
}

public function foo() {
    int val1 = 42;
    int val2 = bar();
    int val3 = ~val1;
    int val4 = val1 + val2;
    int val5 = (val1 + val2);
    int val6 = val1;
}

// CHECK: store i64 42, i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
// CHECK: store i64 %., i64\* %., align 8
