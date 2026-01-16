#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
STYLUA_FILE=$SCRIPT_DIR/stylua.zip
VERIBLE_FILE=$SCRIPT_DIR/verible.zip
VERIBLE_V=v0.0-3638-ge3ef2a37

# Shell Colors
Green="\033[0;32m"
Yellow="\033[0;33m" 
Red="\033[0;31m"
NoColor="\033[0m"

echo "> Cheking dependencies..."
DEPENDENCIES=("tar" "unzip" "wget")
for item in "${DEPENDENCIES[@]}"; do
  if command -v $item &> /dev/null; then
    echo -e "> $item is ${Green}INSTALLED.${NoColor}"
  else 
    echo -e "> $item is ${Red}NOT INSTALLED.${NoColor}"
    exit 1
  fi
done
echo "> All dependencies found."

rm -rf $SCRIPT_DIR/README.md
echo "Add this lines to the PATH" >> $SCRIPT_DIR/README.md

echo "> Installing Verible..."
rm -rf $SCRIPT_DIR/formaters/verible
mkdir -p $SCRIPT_DIR/formaters/verible
cd $SCRIPT_DIR/formaters/verible
wget -q https://github.com/chipsalliance/verible/releases/download/${VERIBLE_V}/verible-${VERIBLE_V}-win64.zip -O $VERIBLE_FILE
unzip -q $VERIBLE_FILE
rm -rf $VERIBLE_FILE
cd $SCRIPT_DIR
echo "$SCRIPT_DIR/formaters/verible/verible-${VERIBLE_V}/bin" >> $SCRIPT_DIR/README.md

echo "> Installing Stylua..."
rm -rf $SCRIPT_DIR/formaters/stylua
mkdir -p $SCRIPT_DIR/formaters/stylua
cd $SCRIPT_DIR/formaters/stylua
wget -q https://github.com/JohnnyMorganz/StyLua/releases/download/v0.20.0/stylua-windows-x86_64.zip -O $STYLUA_FILE
unzip -q $STYLUA_FILE
rm -rf $STYLUA_FILE
cd $SCRIPT_DIR
echo "$SCRIPT_DIR/formaters/stylua" >> $SCRIPT_DIR/README.md

echo ""
echo "============================================================"
echo ""
echo "   Edit the system variable environment variables"
echo "   Environment Variables"
echo "   Uset variables for <Username>"
echo "   Path"
echo ""
echo "============================================================"

