target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = xor i64 %3, -1
  ret i64 %4
}

; attributes #0 = {}
