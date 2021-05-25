target triple = "x86_64-pc-linux-gnu"

define internal void @foo() #0 {
  ret void
}

define internal i64 @bar() #0 {
  ret i64 42
}

define internal i64 @run(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  ret i64 %3
}

; attributes #0 = {}
