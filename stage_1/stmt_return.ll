target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo1() #0 {
  ret i64 42
}

define dso_local i64 @foo2() #0 {
  %1 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  ret i64 %2
}

define dso_local i64 @foo3() #0 {
  %1 = call i64 @foo1()
  ret i64 %1
}

define dso_local i64 @foo4() #0 {
  %1 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = xor i64 %2, -1
  ret i64 %3
}

define dso_local i64 @foo5() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 52, i64* %2, align 8
  %3 = load i64, i64* %1, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %6 = extractvalue { i64, i1 } %5, 0
  %7 = extractvalue { i64, i1 } %5, 1
  %8 = xor i1 %7, true
  br i1 %8, label %10, label %9

9:                                                ; preds = %0
  call void @abort()
  unreachable

10:                                               ; preds = %0
  ret i64 %6
}

define dso_local i64 @foo6() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 52, i64* %2, align 8
  %3 = load i64, i64* %1, align 8
  %4 = load i64, i64* %2, align 8
  %5 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %6 = extractvalue { i64, i1 } %5, 0
  %7 = extractvalue { i64, i1 } %5, 1
  %8 = xor i1 %7, true
  br i1 %8, label %10, label %9

9:                                                ; preds = %0
  call void @abort()
  unreachable

10:                                               ; preds = %0
  ret i64 %6
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
