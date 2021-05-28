target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %3)
  %5 = extractvalue { i64, i1 } %4, 0
  %6 = extractvalue { i64, i1 } %4, 1
  %7 = xor i1 %6, true
  br i1 %7, label %9, label %8

8:                                                ; preds = %1
  call void @abort()
  unreachable

9:                                                ; preds = %1
  ret i64 %5
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

declare void @abort() #2

; attributes #0 = {}
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noreturn nounwind  }
