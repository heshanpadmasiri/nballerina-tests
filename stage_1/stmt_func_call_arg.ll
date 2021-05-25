
define dso_local i32 @main() {
  call void @foo(i64 42)
  ret i32 0
}

define internal void @foo(i64 %0) {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  ret void
}
