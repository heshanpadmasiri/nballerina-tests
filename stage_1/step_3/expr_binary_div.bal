// RUN: runner %s | filecheck %s

public function foo(int x, int y) returns int {
    return x / y;
}

// CHECK: %. = icmp eq i64 %., 0
// CHECK: %. = icmp eq i64 %., -9223372036854775808
// CHECK: %. = icmp eq i64 %., -1
// CHECK: %. = sdiv i64 %., %.
