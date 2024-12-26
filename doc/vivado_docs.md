# Vivado notes

## Install on Pop! OS

Download `FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001_Lin64.bin`

Run the following commands:

```bash
sudo apt-get install libtinfo5
sudo apt install libncurses5
chmod +x FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001_Lin64.bin
sudo ./FPGAs_AdaptiveSoCs_Unified_2024.2_1113_1001_Lin64.bin
```

Select the free version of Vivado and leave everything as default.
You can uncheck some options to save some space but for simplicity
leave as it is.

Add to your `~/.bashrc` the following:

```bash
# Vivado
source /tools/Xilinx/Vivado/2024.2/settings64.sh
```

be aware of the version you are installing.

Install the cable drivers

```bash
sudo chmod +x /tools/Xilinx/Vivado/2024.2/data/xicom/cable_drivers/lin64/install_script/install_drivers/install_drivers
sudo ./tools/Xilinx/Vivado/2024.2/data/xicom/cable_drivers/lin64/install_script/install_drivers/install_drivers
```

Check your OS with `cat /etc/os-release`, I'm using:

```bash
NAME="Pop!_OS"
VERSION="22.04 LTS"
ID=pop
ID_LIKE="ubuntu debian"
PRETTY_NAME="Pop!_OS 22.04 LTS"
VERSION_ID="22.04"
HOME_URL="https://pop.system76.com"
SUPPORT_URL="https://support.system76.com"
BUG_REPORT_URL="https://github.com/pop-os/pop/issues"
PRIVACY_POLICY_URL="https://system76.com/privacy"
VERSION_CODENAME=jammy
UBUNTU_CODENAME=jammy
LOGO=distributor-logo-pop-os
```
