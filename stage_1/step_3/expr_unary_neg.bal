// RUN: runner %s | filecheck %s

public function foo(int x) returns int {
    return  -x;
}

// CHECK: %. = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %.)
