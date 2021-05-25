define dso_local i64 @bar() {
  ret i64 42
}

define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = call i64 @bar()
  %3 = xor i64 %2, -1
  store i64 %3, i64* %1, align 8
  ret i32 0
}
