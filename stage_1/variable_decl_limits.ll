define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 9223372036854775807, i64* %1, align 8
  store i64 -9223372036854775808, i64* %2, align 8
  ret i32 0
}
