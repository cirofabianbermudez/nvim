#include "CommentGenerator.h"

CommentGenerator::CommentGenerator() :
  comment("COMMENT"),
  separator("="),
  commentPrefix("//"),
  innerSpaceLength(1),
  totalLength(80),
  upperFlag(false),
  lowerFlag(false),
  wrapFlag(false),
  titleFlag(false)
  {};

CommentGenerator::CommentGenerator(std::string comment, 
                                   std::string separator,
                                   std::string commentPrefix,
                                   int innerSpaceLength,
                                   int totalLength,
                                   bool upperFlag,
                                   bool lowerFlag,
                                   bool wrapFlag,
                                   bool titleFlag
                                   ) :
                                   comment(comment), 
                                   separator(separator),
                                   commentPrefix(commentPrefix), 
                                   innerSpaceLength(innerSpaceLength),
                                   totalLength(totalLength),
                                   upperFlag(upperFlag),
                                   lowerFlag(lowerFlag),
                                   wrapFlag(wrapFlag),
                                   titleFlag(titleFlag)
                                   {};


void CommentGenerator::toUpperInplace(std::string &str) {
    std::transform(
        str.begin(), str.end(),
        str.begin(),
        [](unsigned char c) {  // note: unsigned char to avoid UB on negative chars
            return static_cast<char>(std::toupper(c));
        }
    );
}


void CommentGenerator::toLowerInplace(std::string &str) {
    std::transform(
        str.begin(), str.end(),
        str.begin(),
        [](unsigned char c) {  // note: unsigned char to avoid UB on negative chars
            return static_cast<char>(std::tolower(c));
        }
    );
}

std::string CommentGenerator::repeatString(const std::string &str, std::size_t count) {
  std::string out;
  out.reserve(str.size() * count);
  for (std::size_t i = 0; i < count; ++i) {
    out += str;
  }
  return out;
}


std::string CommentGenerator::getCurrentDate() {
  auto now = std::chrono::system_clock::now();
  return std::format("{:%Y-%m-%d}", now);
}


std::string CommentGenerator::display(){

  std::stringstream ss;

   ss << "\n";
   ss << "comment:          " <<  comment          << "\n";
   ss << "separator:        " <<  separator        << "\n";
   ss << "commentPrefix:    " <<  commentPrefix    << "\n";
   ss << "innerSpaceLength: " <<  innerSpaceLength << "\n";
   ss << "totalLength:      " <<  totalLength      << "\n";
   ss << "upperFlag:        " <<  upperFlag        << "\n";
   ss << "lowerFlag:        " <<  lowerFlag        << "\n";
   ss << "wrapFlag:         " <<  wrapFlag         << "\n";
   ss << "\n";

  return ss.str();
}

void CommentGenerator::validateInput(){

  std::string help = "\nRun with --help for more information.";

// ====================== Hola me llamo ciro y tu como ====================== //
  int minWidth = 2 * static_cast<int>(commentPrefix.size())
               + 2
               + 2 * innerSpaceLength
               + static_cast<int>(comment.size());

  //std::cout << display();

  if (totalLength < minWidth) {
    throw std::invalid_argument("-c,--comment TEXT is too big or -l,--length INT is too small." + help);
  }

  if (separator.length() != 1) {
    throw std::invalid_argument("-s,--separator TEXT must be just one character." + help);
  }

  if (commentPrefix.length() > 5 ) {
    throw std::invalid_argument("-p,--prefix TEXT is too big, 5 characters maximum." + help);
  }

  if ( !(0 <= innerSpaceLength && innerSpaceLength <= 5) ) {
    throw std::invalid_argument("-i,--inner INT must be between [0-5]." + help);
  }

  if ( !(20 <= totalLength && totalLength <= 400) ) {
    throw std::invalid_argument("-l,--lenght INT must be between [20-400]." + help);
  }
  
}


std::string CommentGenerator::generateHeader() {

  //std::string out;
  std::stringstream ss;
  std::string temp;

  // Add headers
  int padding = totalLength - commentPrefix.size();
  std::string header = commentPrefix  + repeatString(separator, padding) + "\n";


  std::string field[10] = {
    "Filename",
    "Project",
    "Author",
    "Language",
    "Created",
    "Modified",
    "Description",
    "Notes",
    "Status",
    "Revisions"
  };

  ss << header;
  for (std::size_t i = 0; i < std::size(field); ++i) {
    temp = commentPrefix + " [" + field[i] + "]";
    if (field[i] == "Created"){
      ss << std::left << std::setw(18) << temp << getCurrentDate() << "\n";
    } else {
      ss << std::left << std::setw(18) << temp << "-" << "\n";
    }
  }
  ss << header;


  return ss.str();

}

std::string CommentGenerator::generateComment() {

  std::string text = comment;

  // Check for case convertion
  if (upperFlag) {
    toUpperInplace(text);
  }

  if (lowerFlag) {
    toLowerInplace(text);
  }

  validateInput();

  // Calculate padding
  int padding = totalLength - text.size() - commentPrefix.size() * 2 - 2 - innerSpaceLength * 2;
  int leftPadding = padding / 2;
  int rightPadding = padding - leftPadding;

  // Main comment
  std::string str = "";
  str = commentPrefix + " " + repeatString(separator, leftPadding) 
    + repeatString(" ", innerSpaceLength) 
    + text + repeatString(" ", innerSpaceLength) 
    + repeatString(separator, rightPadding) + " " + commentPrefix;

  // Add headers
  if (wrapFlag) {
    int padding = totalLength - commentPrefix.size() * 2 - 2;
    std::string header = commentPrefix + " " + repeatString(separator, padding) + " " + commentPrefix + "\n";
    str = header + str + "\n" + header;
  }


  return str;

}


std::string CommentGenerator::generate() {
  if (titleFlag) {
    return generateHeader();
  }
  return generateComment();
}

