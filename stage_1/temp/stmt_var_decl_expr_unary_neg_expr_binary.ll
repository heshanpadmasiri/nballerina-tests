define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 -52, i64* %2, align 8
  %4 = load i64, i64* %1, align 8
  %5 = load i64, i64* %2, align 8
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %4, i64 %5)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  %9 = xor i1 %8, true
  br i1 %9, label %11, label %10

10:
  call void @abort()
  unreachable

11:
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %7)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  %15 = xor i1 %14, true
  br i1 %15, label %17, label %16

16:
  call void @abort()
  unreachable

17:
  store i64 %13, i64* %3, align 8
  ret i32 0
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
