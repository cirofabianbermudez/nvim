#include <iostream>
#include "CLI/CLI.hpp"
#include "CommentGenerator.h"

int main(int argc, char *argv[]) {

  CLI::App app{"cgen"};

  auto fmt = app.get_formatter();
  fmt->column_width(60);

  app.set_version_flag("-v,--version", "cgen v1.0.0");

  // Define options
  std::string separator = "=";
  app.add_option("-s, --separator", separator, "Separator string")
    ->default_val(separator);
    // ->check(
    //   [](const std::string &str) -> std::string {
    //     if (str.length() != 1) {
    //       return "String must be exactly 1 character long";
    //     }
    //     return {};
    //   }
    // );

  std::string commentPrefix = "//";
  app.add_option("-p, --prefix", commentPrefix, "Comment prefix.")
    ->default_val(commentPrefix);

  int innerSpaceLength = 1;
  app.add_option("-i, --inner", innerSpaceLength, "Space between separator and comment.")
    ->default_val(innerSpaceLength);
    //->check(CLI::Range(0, 10));

  int totalLength = 80;
  app.add_option("-l, --length", totalLength, "Total length of the comment line.")
    ->default_val(totalLength);
    //->check(CLI::Range(40, 200));

  std::string comment = "COMMENT";
  app.add_option("-c, --comment", comment, "Comment text string.")
    ->default_val(comment);

  // Flags
  bool upper = false;
  app.add_flag("-u, --upper", upper, "Enable uppercase conversion.")
    ->default_val(upper);

  bool lower = false;
  app.add_flag("-d, --down", lower, "Enable lowercase conversion.")
    ->default_val(lower);

  bool wrap = false;
  app.add_flag("-w, --wrap", wrap, "Enable wrap comment.")
    ->default_val(wrap);

  bool title = false;
  app.add_flag("-t, --title", title, "Print title template instead.")
    ->default_val(title);

  CLI11_PARSE(app, argc, argv);

  CommentGenerator cg(comment, separator, commentPrefix, innerSpaceLength, totalLength, upper, lower, wrap, title);

  std::string outputComment;

  try {
    outputComment = cg.generate();
  } catch (const std::exception &e) {
    std::cerr << "[ERROR]: " << e.what() << std::endl;
  }

  std::cout << outputComment << "\n";

  return 0;
}
