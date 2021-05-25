define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = call i64 @foo()
  store i64 %2, i64* %1, align 8
  ret i32 0
}

define internal i64 @foo() {
  ret i64 42
}
