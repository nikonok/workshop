#include <iostream>
#include <headers/header.hpp>
#include <version.hpp>

int main() {
    std::cout << foo() << std::endl;
    std::cout << "Version is " << Workshop_VERSION_MAJOR << "." << Workshop_VERSION_MINOR << std::endl;
}
