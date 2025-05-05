#ifndef COMMENTGENERATOR_H
#define COMMENTGENERATOR_H

#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <iomanip>
#include <algorithm>
#include <iterator>
#include <cctype>
#include <cmath>
#include <chrono>
#include <format>


class CommentGenerator {

  private:
    std::string comment;
    std::string separator;
    std::string commentPrefix;
    int innerSpaceLength;
    int totalLength;
    bool upperFlag;
    bool lowerFlag;
    bool wrapFlag;
    bool titleFlag;


  public:
    // Constructor
    CommentGenerator();
    CommentGenerator(std::string message, std::string separator,
                     std::string commentPrefix, int innerSpaceLength,
                     int totalLength, bool upperFlag, bool lowerFlag,
                     bool wrapFlag, bool titleFlag);

    // Utility methods
    void toUpperInplace(std::string &str);
    void toLowerInplace(std::string &str);
    std::string repeatString(const std::string &str, std::size_t count);
    std::string getCurrentDate();

    std::string display();
    void validateInput();
    std::string generateComment();
    std::string generateHeader();
    std::string generate();
};

#endif // COMMENTGENERATOR_H
