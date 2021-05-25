define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  store i64 -42, i64* %2, align 8
  store i64 50, i64* %3, align 8
  %5 = load i64, i64* %1, align 8
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
  %13 = load i64, i64* %3, align 8
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %8, i64 %13)
  %15 = extractvalue { i64, i1 } %14, 0
  %16 = extractvalue { i64, i1 } %14, 1
  %17 = xor i1 %16, true
  br i1 %17, label %19, label %18

18:
  call void @abort()
  unreachable

19:
  store i64 %15, i64* %4, align 8
  ret i32 0
}

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
