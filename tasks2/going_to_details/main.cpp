#include <iostream>

#include <msg.pb.h>

int main() {
    MyMessage msg;

    msg.set_message("Hello World!");

    if(msg.has_message()) {
        std::cout << msg.message() << std::endl;
    }
}