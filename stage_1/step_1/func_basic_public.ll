target triple = "x86_64-pc-linux-gnu"

define dso_local void @foo() #0 {
  ret void
}

define dso_local i64 @bar() #0 {
  ret i64 42
}

; attributes #0 = {}
