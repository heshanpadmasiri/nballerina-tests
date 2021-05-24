define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 -9223372036854775808, i64* %1, align 8
  %3 = load i64, i64* %1, align 8
  %4 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %3)
  %5 = extractvalue { i64, i1 } %4, 0
  %6 = extractvalue { i64, i1 } %4, 1
  %7 = xor i1 %6, true
  br i1 %7, label %9, label %8

8:
  call void @abort()
  unreachable

9:
  store i64 %5, i64* %2, align 8
  ret i32 0
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)
declare dso_local void @abort() local_unnamed_addr cold noreturn nounwind
