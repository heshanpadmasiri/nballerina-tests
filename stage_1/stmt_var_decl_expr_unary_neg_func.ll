define dso_local i64 @bar() {
  ret i64 42
}

define dso_local i32 @main() {
  %1 = alloca i64, align 8
  %2 = call i64 @bar()
  %3 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 0, i64 %2)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  %6 = xor i1 %5, true
  br i1 %6, label %8, label %7

7:
  call void @abort()
  unreachable

8:
  store i64 %4, i64* %1, align 8
  ret i32 0
}

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare dso_local void @abort() noreturn nounwind
