# AABS — Android App Backup System

AABS is a simple tool for backing up installed Android applications using ADB.

It allows you to extract APK files from a connected Android device and save them locally for personal use.

---

## Requirements

Before using AABS, make sure you have:

- ADB (Android Debug Bridge) installed on your PC
- Windows operating system (for `.bat` script version)
- USB cable to connect your Android device

---

## Android Setup

On your phone:

1. Open Settings
2. Go to About phone
3. Tap Build number 7 times to enable Developer Options (if not already enabled)
4. Open Developer Options
5. Enable USB Debugging

---

## Connecting Your Device

1. Connect your Android device to your PC via USB
2. When prompted on your phone, allow USB debugging access
3. Open Command Prompt (CMD) or Terminal on your PC

---

## Check ADB Connection

Run the following command:

```bash
adb devices
