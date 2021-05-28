target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @bar() #0 {
  ret i64 43
}

define dso_local void @foo() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %7 = call i64 @bar()
  store i64 %7, i64* %2, align 8
  %8 = load i64, i64* %1, align 8
  %9 = xor i64 %8, -1
  store i64 %9, i64* %3, align 8
  %10 = load i64, i64* %1, align 8
  %11 = load i64, i64* %2, align 8
  %12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 %11)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  %15 = xor i1 %14, true
  br i1 %15, label %17, label %16

16:                                               ; preds = %0
  call void @abort()
  unreachable

17:                                               ; preds = %0
  store i64 %13, i64* %4, align 8
  %18 = load i64, i64* %1, align 8
  %19 = load i64, i64* %2, align 8
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %18, i64 %19)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  %23 = xor i1 %22, true
  br i1 %23, label %25, label %24

24:                                               ; preds = %17
  call void @abort()
  unreachable

25:                                               ; preds = %17
  store i64 %21, i64* %5, align 8
  %26 = load i64, i64* %1, align 8
  store i64 %26, i64* %6, align 8
  ret void
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
