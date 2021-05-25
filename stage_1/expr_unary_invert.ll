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
  store i64 -43, i64* %1, align 8
  %7 = call i64 @bar()
  %8 = xor i64 %7, -1
  store i64 %8, i64* %2, align 8
  %9 = load i64, i64* %1, align 8
  %10 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %9)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  %13 = xor i1 %12, true
  br i1 %13, label %15, label %14

14:                                               ; preds = %0
  call void @abort()
  unreachable

15:                                               ; preds = %0
  %16 = xor i64 %11, -1
  store i64 %16, i64* %3, align 8
  %17 = load i64, i64* %1, align 8
  %18 = xor i64 %17, -1
  %19 = load i64, i64* %2, align 8
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %18, i64 %19)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  %23 = xor i1 %22, true
  br i1 %23, label %25, label %24

24:                                               ; preds = %15
  call void @abort()
  unreachable

25:                                               ; preds = %15
  store i64 %21, i64* %4, align 8
  %26 = load i64, i64* %1, align 8
  %27 = load i64, i64* %2, align 8
  %28 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %26, i64 %27)
  %29 = extractvalue { i64, i1 } %28, 0
  %30 = extractvalue { i64, i1 } %28, 1
  %31 = xor i1 %30, true
  br i1 %31, label %33, label %32

32:                                               ; preds = %25
  call void @abort()
  unreachable

33:                                               ; preds = %25
  %34 = xor i64 %29, -1
  store i64 %34, i64* %5, align 8
  %35 = load i64, i64* %1, align 8
  %36 = xor i64 %35, -1
  store i64 %36, i64* %6, align 8
  ret void
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
