#include <iostream>

#define DEFINED_VAR

void foo() {
#ifdef DEFINED_VAR
    std::cout << "defined" << std::endl;
#else
    std::cout << "undefined" << std::endl;
#endif
}

int main() {
    foo();
#undef DEFINED_VAR
    foo();
}
