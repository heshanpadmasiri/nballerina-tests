// RUN: runner %s | filecheck %s

public function foo() {
    int val1;
    val1 = 42;
    val1 = 0X2B;
    val1 = 0x2c;
    val1 = 9223372036854775807;
    val1 = -9223372036854775808;
}

// CHECK: store i64 42, i64* %., align 8
// CHECK: store i64 43, i64* %., align 8
// CHECK: store i64 44, i64* %., align 8
// CHECK: store i64 9223372036854775807, i64* %., align 8
// CHECK: store i64 -9223372036854775808, i64* %., align 8
