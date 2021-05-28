// RUN: runner %s | filecheck %s

public function foo() {
    int val;
}

// CHECK: %. = alloca i64, align 8
