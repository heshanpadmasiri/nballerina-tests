define dso_local void @foo() #0 {
  ret void
}

define dso_local i64 @bar() #0 {
  ret i64 42
}

define dso_local i64 @run(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  ret i64 %3
}

attributes #0 = { noinline nounwind optnone uwtable}
