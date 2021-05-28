// RUN: runner %s | filecheck %s

public function foo(int x, int y) returns int {
    return  x + y;
}

// CHECK: %. = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %., i64 %.)
