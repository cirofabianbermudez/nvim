// myprog.cpp
#include <iostream>
#define size 80
void print(char *);
int main(void) {
  char text[size];
  std::cout << "Enter text" << std::endl;
  std::cin >> text;

  print(text);

  return 1;
}

