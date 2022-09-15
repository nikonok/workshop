# Preprocessor issues task

Compile to assembly and find a function with signature:

```c++
double app::obj::db::findme(float, int, double) { return 1.0;}
```

> Yes! That's simple!

A little bit of help here:
```bash
> g++ task.cpp -S -o task
```
