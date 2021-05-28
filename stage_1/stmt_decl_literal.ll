target triple = "x86_64-pc-linux-gnu"

define dso_local void @test() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 43, i64* %2, align 8
  store i64 44, i64* %3, align 8
  store i64 9223372036854775807, i64* %4, align 8
  store i64 -9223372036854775808, i64* %5, align 8
  ret void
}

; attributes #0 = {}
