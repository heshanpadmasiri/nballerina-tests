target triple = "x86_64-pc-linux-gnu"

define dso_local void @foo() #0 {
  %1 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 43, i64* %1, align 8
  store i64 44, i64* %1, align 8
  store i64 9223372036854775807, i64* %1, align 8
  store i64 -9223372036854775808, i64* %1, align 8
  ret void
}

; attributes #0 = {}
