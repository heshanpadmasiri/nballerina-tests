define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 42, i64* %1, align 8
  %3 = load i64, i64* %1, align 8
  %4 = xor i64 %3, -1
  %5 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %4), !dbg !27, !nosanitize !2
  %6 = extractvalue { i64, i1 } %5, 0
  %7 = extractvalue { i64, i1 } %5, 1
  %8 = xor i1 %7, true
  br i1 %8, label %10, label %9

9:
  call void @abort()
  unreachable

10:
  store i64 %6, i64* %2, align 8
  ret i32 0
}


declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
