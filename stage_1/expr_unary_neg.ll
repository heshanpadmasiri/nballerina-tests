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
  store i64 -42, i64* %1, align 8
  %7 = call i64 @bar()
  %8 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %7)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  %11 = xor i1 %10, true
  br i1 %11, label %13, label %12

12:                                               ; preds = %0
  call void @abort()
  unreachable

13:                                               ; preds = %0
  store i64 %9, i64* %2, align 8
  %14 = load i64, i64* %1, align 8
  %15 = xor i64 %14, -1
  %16 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %15)
  %17 = extractvalue { i64, i1 } %16, 0
  %18 = extractvalue { i64, i1 } %16, 1
  %19 = xor i1 %18, true
  br i1 %19, label %21, label %20

20:                                               ; preds = %13
  call void @abort()
  unreachable

21:                                               ; preds = %13
  store i64 %17, i64* %3, align 8
  %22 = load i64, i64* %1, align 8
  %23 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %22)
  %24 = extractvalue { i64, i1 } %23, 0
  %25 = extractvalue { i64, i1 } %23, 1
  %26 = xor i1 %25, true
  br i1 %26, label %28, label %27

27:                                               ; preds = %21
  call void @abort()
  unreachable

28:                                               ; preds = %21
  %29 = load i64, i64* %2, align 8
  %30 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %24, i64 %29)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  %33 = xor i1 %32, true
  br i1 %33, label %35, label %34

34:                                               ; preds = %28
  call void @abort()
  unreachable

35:                                               ; preds = %28
  store i64 %31, i64* %4, align 8
  %36 = load i64, i64* %1, align 8
  %37 = load i64, i64* %2, align 8
  %38 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %36, i64 %37)
  %39 = extractvalue { i64, i1 } %38, 0
  %40 = extractvalue { i64, i1 } %38, 1
  %41 = xor i1 %40, true
  br i1 %41, label %43, label %42

42:                                               ; preds = %35
  call void @abort()
  unreachable

43:                                               ; preds = %35
  %44 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %39)
  %45 = extractvalue { i64, i1 } %44, 0
  %46 = extractvalue { i64, i1 } %44, 1
  %47 = xor i1 %46, true
  br i1 %47, label %49, label %48

48:                                               ; preds = %43
  call void @abort()
  unreachable

49:                                               ; preds = %43
  store i64 %45, i64* %5, align 8
  %50 = load i64, i64* %1, align 8
  %51 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %50)
  %52 = extractvalue { i64, i1 } %51, 0
  %53 = extractvalue { i64, i1 } %51, 1
  %54 = xor i1 %53, true
  br i1 %54, label %56, label %55

55:                                               ; preds = %49
  call void @abort()
  unreachable

56:                                               ; preds = %49
  store i64 %52, i64* %6, align 8
  ret void
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
