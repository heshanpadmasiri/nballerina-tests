define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 -42, i64* %2, align 8
  %4 = load i64, i64* %1, align 8
  %5 = xor i64 %4, -1
  %6 = load i64, i64* %2, align 8
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %5, i64 %6)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  %10 = xor i1 %9, true
  br i1 %10, label %12, label %11

11:
  call void @abort()
  unreachable

12:
  store i64 %8, i64* %3, align 8
  ret i32 0
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
