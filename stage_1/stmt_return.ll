target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo1() #0 {
  ret i64 42
}

define dso_local i64 @foo2() #0 {
  %1 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  ret i64 %2
}

; attributes #0 = {}
