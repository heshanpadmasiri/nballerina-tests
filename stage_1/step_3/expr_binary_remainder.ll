target triple = "x86_64-pc-linux-gnu"

define dso_local i64 @foo(i64 %0, i64 %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  call void @abort()
  unreachable

9:                                                ; preds = %2
  %10 = load i64, i64* %4, align 8
  %11 = icmp eq i64 %10, -9223372036854775808
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i64, i64* %5, align 8
  %14 = icmp eq i64 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i64 0, i64* %3, align 8
  br label %20

16:                                               ; preds = %12, %9
  %17 = load i64, i64* %4, align 8
  %18 = load i64, i64* %5, align 8
  %19 = srem i64 %17, %18
  store i64 %19, i64* %3, align 8
  br label %20

20:                                               ; preds = %16, %15
  %21 = load i64, i64* %3, align 8
  ret i64 %21
}

declare void @abort() #1

; attributes #0 = {}
attributes #1 = { noreturn nounwind  }
