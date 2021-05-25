define dso_local void @foo(i64 %0, i64 %1, i64 %2) {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  ret void
}

define dso_local i32 @main() {
  call void @foo(i64 42, i64 43, i64 44)
  ret i32 0
}
