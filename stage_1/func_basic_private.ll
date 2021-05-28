target triple = "x86_64-pc-linux-gnu"

define internal void @foo() #0 {
  ret void
}

define internal i64 @bar() #0 {
  ret i64 42
}

; attributes #0 = {}
