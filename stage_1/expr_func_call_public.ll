define dso_local i32 @main() {
  call void @foo()
  ret i32 0
}

define dso_local void @foo() {
  ret void
}
