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
  %7 = alloca i64, align 8
  store i64 -45, i64* %1, align 8
  store i64 -50, i64* %2, align 8
  store i64 -3, i64* %3, align 8
  %8 = load i64, i64* %1, align 8
  %9 = load i64, i64* %2, align 8
  %10 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 %9)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  %13 = xor i1 %12, true
  br i1 %13, label %15, label %14

14:                                               ; preds = %0
  call void @abort()
  unreachable

15:                                               ; preds = %0
  store i64 %11, i64* %4, align 8
  %16 = call i64 @bar()
  %17 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 47, i64 %16)
  %18 = extractvalue { i64, i1 } %17, 0
  %19 = extractvalue { i64, i1 } %17, 1
  %20 = xor i1 %19, true
  br i1 %20, label %22, label %21

21:                                               ; preds = %15
  call void @abort()
  unreachable

22:                                               ; preds = %15
  store i64 %18, i64* %5, align 8
  %23 = load i64, i64* %1, align 8
  %24 = xor i64 %23, -1
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %24, i64 35)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  %28 = xor i1 %27, true
  br i1 %28, label %30, label %29

29:                                               ; preds = %22
  call void @abort()
  unreachable

30:                                               ; preds = %22
  store i64 %26, i64* %6, align 8
  %31 = load i64, i64* %1, align 8
  %32 = load i64, i64* %2, align 8
  %33 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 60, i64 %32)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  %36 = xor i1 %35, true
  br i1 %36, label %38, label %37

37:                                               ; preds = %30
  call void @abort()
  unreachable

38:                                               ; preds = %30
  %39 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 %34)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  %42 = xor i1 %41, true
  br i1 %42, label %44, label %43

43:                                               ; preds = %38
  call void @abort()
  unreachable

44:                                               ; preds = %38
  store i64 %40, i64* %7, align 8
  ret void
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
