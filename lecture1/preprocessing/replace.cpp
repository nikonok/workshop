#include <iostream>

#define DEFINED_VAR 123

#define FUNCTION(name, value) int fun_##name() { return value;}

#define FUNCTION_VARIADIC(name, value, ...) \
    void fun_##name() { std::cout << value __VA_OPT__(<<) __VA_ARGS__ << std::endl;}

FUNCTION(foo, 1)

FUNCTION_VARIADIC(foo_variadic, 1, 2 << 3)

#define TO_STRING(number) #number

int main() {
    std::cout << fun_foo() << std::endl;

    std::cout << "Your number is " << TO_STRING(10) << std::endl;

    fun_foo_variadic();
}
