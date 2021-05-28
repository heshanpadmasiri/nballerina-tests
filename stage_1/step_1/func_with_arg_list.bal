// RUN: runner %s | filecheck %s

public function foo1(int x) returns int {
    return x;
}

public function foo2(int x, int y) returns int {
    return y;
}

public function foo3(int x, int y, int z) returns int {
    return z;
}

// CHECK: define dso_local i64 @foo1(i64 %.)
// CHECK: define dso_local i64 @foo2(i64 %., i64 %.)
// CHECK: define dso_local i64 @foo3(i64 %., i64 %., i64 %.)
