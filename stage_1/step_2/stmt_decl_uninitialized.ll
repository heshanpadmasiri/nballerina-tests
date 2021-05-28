target triple = "x86_64-pc-linux-gnu"

define dso_local void @foo() #0 {
  %1 = alloca i64, align 8
  ret void
}

; attributes #0 = {}
