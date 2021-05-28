// RUN: runner %s | filecheck %s

public function main() {
}

// CHECK: define dso_local i32 @main() 
// CHECK: ret i32
