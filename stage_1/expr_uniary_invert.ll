define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %5 = load i64, i64* %1, align 8
  %6 = xor i64 %5, -1
  store i64 %6, i64* %2, align 8
  store i64 -42, i64* %3, align 8
  %7 = load i64, i64* %3, align 8
  %8 = xor i64 %7, -1
  store i64 %8, i64* %4, align 8
  ret i32 0
}
