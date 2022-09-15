int i = 10;
const int c = 100;

int main() {
    int local = i;
    i++;
    local += i + c;
}
