define dso_local i32 @main() {
  %1 = alloca i64, align 8
  call void @foo()
  %2 = call i64 @bar()
  store i64 %2, i64* %1, align 8
  ret i32 0
}

declare void @foo()
declare i64 @bar()
