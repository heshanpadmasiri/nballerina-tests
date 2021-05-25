target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @bar() #0 {
  ret i64 43
}

define dso_local void @foo() #0 {
  %1 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %2 = call i64 @bar()
  store i64 %2, i64* %1, align 8
  %3 = load i64, i64* %1, align 8
  %4 = xor i64 %3, -1
  store i64 %4, i64* %1, align 8
  %5 = load i64, i64* %1, align 8
  %6 = load i64, i64* %1, align 8
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %5, i64 %6)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  %10 = xor i1 %9, true
  br i1 %10, label %12, label %11

11:                                               ; preds = %0
  call void @abort()
  unreachable

12:                                               ; preds = %0
  store i64 %8, i64* %1, align 8
  %13 = load i64, i64* %1, align 8
  %14 = load i64, i64* %1, align 8
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %14)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  %18 = xor i1 %17, true
  br i1 %18, label %20, label %19

19:                                               ; preds = %12
  call void @abort()
  unreachable

20:                                               ; preds = %12
  store i64 %16, i64* %1, align 8
  %21 = load i64, i64* %1, align 8
  store i64 %21, i64* %1, align 8
  ret void
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
