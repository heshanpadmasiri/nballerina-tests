define dso_local void @foo() {
  ret void
}

define dso_local i64 @bar() {
  ret i64 42
}

define dso_local i64 @run(i64 %0) {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  ret i64 %3
}

define dso_local i32 @main() #0 !dbg !28 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  call void @foo()
  %3 = call i64 @bar()
  store i64 %3, i64* %1, align 8
  %4 = load i64, i64* %1, align 8
  %5 = call i64 @run(i64 %4)
  store i64 %5, i64* %2, align 8
  ret i32 0
}