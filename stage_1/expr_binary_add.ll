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
  %8 = alloca i64, align 8
  store i64 -45, i64* %1, align 8
  store i64 -50, i64* %2, align 8
  store i64 87, i64* %3, align 8
  %9 = load i64, i64* %1, align 8
  %10 = load i64, i64* %2, align 8
  %11 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 %10)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  %14 = xor i1 %13, true
  br i1 %14, label %16, label %15

15:                                               ; preds = %0
  call void @abort()
  unreachable

16:                                               ; preds = %0
  store i64 %12, i64* %4, align 8
  %17 = call i64 @bar()
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 47, i64 %17)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  %21 = xor i1 %20, true
  br i1 %21, label %23, label %22

22:                                               ; preds = %16
  call void @abort()
  unreachable

23:                                               ; preds = %16
  store i64 %19, i64* %5, align 8
  %24 = load i64, i64* %1, align 8
  %25 = xor i64 %24, -1
  %26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %25, i64 35)
  %27 = extractvalue { i64, i1 } %26, 0
  %28 = extractvalue { i64, i1 } %26, 1
  %29 = xor i1 %28, true
  br i1 %29, label %31, label %30

30:                                               ; preds = %23
  call void @abort()
  unreachable

31:                                               ; preds = %23
  store i64 %27, i64* %6, align 8
  %32 = load i64, i64* %3, align 8
  %33 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 49, i64 %32)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  %36 = xor i1 %35, true
  br i1 %36, label %38, label %37

37:                                               ; preds = %31
  call void @abort()
  unreachable

38:                                               ; preds = %31
  %39 = load i64, i64* %4, align 8
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %34, i64 %39)
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = extractvalue { i64, i1 } %40, 1
  %43 = xor i1 %42, true
  br i1 %43, label %45, label %44

44:                                               ; preds = %38
  call void @abort()
  unreachable

45:                                               ; preds = %38
  store i64 %41, i64* %7, align 8
  %46 = load i64, i64* %1, align 8
  %47 = load i64, i64* %2, align 8
  %48 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 60, i64 %47)
  %49 = extractvalue { i64, i1 } %48, 0
  %50 = extractvalue { i64, i1 } %48, 1
  %51 = xor i1 %50, true
  br i1 %51, label %53, label %52

52:                                               ; preds = %45
  call void @abort()
  unreachable

53:                                               ; preds = %45
  %54 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %46, i64 %49)
  %55 = extractvalue { i64, i1 } %54, 0
  %56 = extractvalue { i64, i1 } %54, 1
  %57 = xor i1 %56, true
  br i1 %57, label %59, label %58

58:                                               ; preds = %53
  call void @abort()
  unreachable

59:                                               ; preds = %53
  store i64 %55, i64* %8, align 8
  ret void
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
