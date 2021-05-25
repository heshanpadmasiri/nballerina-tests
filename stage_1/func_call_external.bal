public function foo() = external;

public function bar() returns int = external;

public function run(int val) returns int = external;

public function main() {
    foo();
    int val = bar();
    int val2 = run(val);
}
