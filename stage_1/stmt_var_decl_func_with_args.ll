
define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = call i64 @foo(i64 42)
  store i64 %2, i64* %1, align 8
  ret i32 0
}

define internal i64 @foo(i64 %0) {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  ret i64 %3
}
