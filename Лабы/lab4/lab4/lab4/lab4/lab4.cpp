#include <iostream>
#include <locale.h>
#include "c_file.c"
extern "C" void     file_asm_f1(int N, double* massiv);

int main()
{
    // 17 вариант
    setlocale(LC_ALL, "Russian");
    double massiv[100];
    int N = 11;
    std::cout << "Массив изначальных значений:";
    for (int i = 0; i < N; i++) {
        massiv[i] = i * 0.1;
        std::cout << "\nmassiv[" << i << "] = " << massiv[i];
    }
    std::cout << "\n\n\n\n";
    file_asm_f1(N, massiv);
    std::cout << "Полученный массив:";
    for (int i = 0; i < N; i++) {
        if (massiv[i] == INFINITY)
            std::cout << std::endl << "mass[" << i << "] бесконечен, т.к. деление на 0";
        else
            std::cout << std::endl << "mass[" << i << "]: " << massiv[i];
    }


    std::cout << "\n\n\n\t";
    system("pause");
}
