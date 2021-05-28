// RUN: runner %s | filecheck %s

public function foo(int x) returns int {
    return  ~x;
}

// CHECK: %. = xor i64 %., -1
