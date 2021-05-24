// RUN: env JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 bal build --dump-bir-file=%t %s
// RUN: ../nballerinacc %t -o %t.ll
// RUN: cat %t.ll | filecheck %s

function foo(){}

public function main() {
    foo();
}

// CHECK: define dso_local i32 @main() local_unnamed_addr
// CHECK: ret i32
