define dso_local void @foo(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store i64 %0, i64* %6, align 8
  store i64 %1, i64* %7, align 8
  store i64 %2, i64* %8, align 8
  store i64 %3, i64* %9, align 8
  store i64 %4, i64* %10, align 8
  ret void
}

define dso_local i64 @bar() #0 {
  ret i64 44
}

define dso_local i32 @main() #0 {
  %1 = alloca i64, align 8
  store i64 43, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = call i64 @bar()
  %4 = load i64, i64* %1, align 8
  %5 = xor i64 %4, -1
  %6 = load i64, i64* %1, align 8
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %6, i64 42)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  %10 = xor i1 %9, true
  br i1 %10, label %12, label %11

11:
  call void @abort() #3
  unreachable

12:
  call void @foo(i64 42, i64 %2, i64 %3, i64 %5, i64 %8)
  ret i32 0
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
