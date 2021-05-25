target triple = "x86_64-pc-linux-gnu"

define dso_local void @test() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @foo1()
  %3 = call i64 @foo2()
  store i64 %3, i64* %1, align 8
  %4 = load i64, i64* %1, align 8
  %5 = call i64 @foo3(i64 %4)
  store i64 %5, i64* %2, align 8
  ret void
}

declare dso_local void @foo1() #1

declare dso_local i64 @foo2() #1

declare dso_local i64 @foo3(i64) #1

; attributes #0 = {}
; attributes #1 = {}
