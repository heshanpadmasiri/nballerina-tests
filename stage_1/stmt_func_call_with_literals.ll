target triple = "x86_64-pc-linux-gnu"

define dso_local void @foo1() #0 {
  ret void
}

define dso_local void @foo2(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  ret void
}

define dso_local i64 @foo3() #0 {
  ret i64 21
}

define dso_local i64 @foo4(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  ret i64 %5
}

define dso_local void @test() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @foo1()
  call void @foo2(i64 42, i64 43)
  %3 = call i64 @foo3()
  store i64 %3, i64* %1, align 8
  %4 = call i64 @foo4(i64 12, i64 13)
  store i64 %4, i64* %2, align 8
  ret void
}

; attributes #0 = {}
