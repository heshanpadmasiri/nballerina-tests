function foo(int v, int w, int x, int y, int z) {
    return;
}

function bar() returns int{
    return 44;
}

public function main() {
    int val = 43;
    foo(42, val, bar(), ~val, (val + 42));
}
