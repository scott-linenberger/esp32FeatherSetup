
# text colors
PURPLE='\033[0;35m'
CYAN='\033[1;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\e[31m'
NC='\033[0m'

# vars
SRC_ESP32="https://github.com/espressif/arduino-esp32.git"  
BREAK="======================================================================="

echo -e " ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ ____ "
echo -e "||${CYAN}E${NC} |||${CYAN}S${NC} |||${CYAN}P${NC} |||${CYAN}3${NC} |||${CYAN}2${NC} |||       |||${PURPLE}F${NC} |||${PURPLE}E${NC} |||${PURPLE}A${NC} |||${PURPLE}T${NC} |||${PURPLE}H${NC} |||${PURPLE}E ${NC}|||${PURPLE}R ${NC}||"
echo -e "||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||__||"
echo -e "|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|"
echo -e "${BREAK}"
echo -e "                              ${YELLOW}SETUP${NC}"
echo -e "${BREAK}"
echo -e "This script will help you setup your ESP32 Feather by downloading the  "
echo -e "appropriate files for you. You will need a few things before we "
echo -e "begin though.."
echo -e "\n"

echo -e "${NC}-----------------------------------------------------------------------"
echo -e "${CYAN}Prerequisites${NC}:"
echo -e "${NC}-----------------------------------------------------------------------"
echo -e "${CYAN}*${NC} Shell - a shell for running scripts ( hi ) \n"
echo -e "${CYAN}*${NC} Git - installed and accessible via command line"
echo -e "    ${YELLOW}https://git-scm.com/downloads${NC}"
echo -e "\n${CYAN}*${NC} Arduino IDE - installed and up-to-date"
echo -e "    ${YELLOW}https://www.arduino.cc/en/Main/Software${NC}"

echo -e "\nIf you do not have any of the following, take a moment to "
echo -e "install them. Be sure to close any and all terminals before "
echo -e "continuing if you need to install additional software..."

echo -e "\n\n${NC}-----------------------------------------------------------------------"
echo -e "${CYAN}Checkout Files${NC}:"
echo -e "${NC}-----------------------------------------------------------------------"
echo -e "Navigating to your Sketchbook folder..."

if [ ! -d ~/Documents/Arduino ]; then
  echo -e "\n${YELLOW}WOOPS! -- Looks like that isn't a valid Sketchbook path!"
  exit;
fi

cd ~/Documents/Arduino

# check for and navigate to hardware folder
if [ ! -d hardware ]; then
  echo -e "Creating hardware directory..."
  mkdir hardware
fi

echo -e "Navigating to 'hardware' directory..."
cd hardware

# check for and navigate to espressif folder
if [ ! -d espressif ]; then
  # folder doesn't exist, create it
  echo -e "creating 'espressif' directory..."
  mkdir espressif

  #navigate into espressif directory
  echo -e "Navigating to 'espressif' directory..."
  cd espressif

  # clone the git repository
  echo -e "Cloning ESP32 source files..."
  git clone --recurse-submodules "${SRC_ESP32}" esp32

  # update the cloned module and submodules
  echo -e "Updating ESP32 source files..."
  git submodule update --init --recursive

  exit;
fi

#directory exists, navigate to it
cd espressif

if [ -d esp32 ]; then
  # the esp32 folder exists, navigate into it
  echo -e "Navigating to 'esp32' directory..."
  cd esp32

  #update the repository
  echo -e "Updating ESP32 source files..."
  git submodule update --init --recursive

  exit;
fi

if [ ! -d esp32 ]; then
  #esp32 directory doesn't exits, clone and update
  echo -e "Cloning ESP32 source files..."
  git clone --recurse-submodules "${SRC_ESP32}" esp32

  # update the cloned module and submodules
  echo -e "Updating ESP32 source files..."
  git submodule update --init --recursive

  exit;
fi

#begin cloning




