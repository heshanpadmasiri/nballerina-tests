define dso_local i32 @main() {
  call void @foo()
  ret i32 0
}

define internal void @foo() {
  ret void
}
