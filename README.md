#  Cursor AI IDE Installer for Ubuntu 24.04  

This script automates the installation of **Cursor AI IDE** on Ubuntu 24.04. It downloads the latest AppImage, installs necessary dependencies, fixes sandbox issues, and creates a `.desktop` entry so you can launch Cursor from your application menu.

## 🛠 Features
1. **Automatically downloads the latest Cursor AI AppImage**  
2. **Installs missing dependencies (`libfuse2`, `curl`)**  
3. **Moves the AppImage to `/opt/` for system-wide access**  
4. **Fixes permissions to avoid sandbox errors**  
5. **Creates a `.desktop` shortcut for easy launching**  
6. **Runs Cursor AI IDE after installation**  

---

## 📌 Installation & Usage

### **1️ Clone the Repository**
```bash
git clone https://github.com/ServicesGround/install-cursor-ubuntu.git
cd cursor-installer
```

### **2️ Make the Script Executable**
```bash
chmod +x install_cursor.sh
```

### **3️ Run the Installation Script**
```bash
./install_cursor.sh
```

🚀 **Once installed, you can find Cursor AI IDE in your application menu!**  

---

## 🛠 Troubleshooting

### **💡 Cursor Doesn't Open After Installation?**
Try running it manually:
```bash
/opt/cursor.appimage --no-sandbox
```

### **💡 "dlopen(): error loading libfuse.so.2" Error?**
Ensure **FUSE 2** is installed:
```bash
sudo apt install -y libfuse2
```

### **💡 Cursor Opens but Freezes at Login?**
Try running:
```bash
rm -rf ~/.config/Cursor ~/.cache/Cursor
/opt/cursor.appimage --no-sandbox
```

---

## 📜 License  
This project is licensed under the **MIT License**. Feel free to modify and distribute it.  

---

## ⭐ Contribute  
Want to improve this script? Fork the repo and submit a pull request!  

**GitHub Repository:** [Cursor AI Installer](https://github.com/ServicesGround/install-cursor-ubuntu.git)  

---

**Now you can push this repo and help others easily install Cursor AI IDE on Ubuntu 24.04!** 🔥  
Let me know if you need modifications! 😊  
