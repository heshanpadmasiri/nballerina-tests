// RUN: env JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 bal build --dump-bir-file=%t %s
// RUN: ../nballerinacc %t -o %t.ll
// RUN: cat %t.ll | filecheck %s

public function foo() {
}

public function bar() returns int {
    return 42;
}

public function run(int val) returns int {
    return val;
}

public function main() {
    foo();
    int val = bar();
    int val2 = run(val);
}
