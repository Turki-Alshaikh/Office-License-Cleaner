# Office-License-Cleaner

[![Version](https://img.shields.io/badge/Version-1.0.0-blue.svg)]()
[![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)]()
[![Author](https://img.shields.io/badge/Author-Turki_Alshaikh-success.svg)](https://github.com/Turki-Alshaikh)
[![Website](https://img.shields.io/badge/Website-Mfatihy.com-orange.svg)](https://mfatihy.com)

A smart, automated batch script to clean old, pending, or conflicting Microsoft Office license tokens. 
If you install a new version of Office (e.g., Office 2024) but still see older versions (like 2019, 2021, or 365) in your account settings, this tool will safely remove the ghost licenses without harming your active activation.

---

##  The Problem It Solves | المشكلة التي يحلها

**English:** 
When you uninstall Microsoft Office, Windows often leaves the old license tokens behind in the registry. When you install a new version, Office gets confused and displays both the new and old licenses. This tool forces the removal of these hidden, unused tokens.

**عربي:**
عند قيامك بحذف أوفيس قديم لتثبيت إصدار أحدث (مثال: أوفيس 2024)، يتفاجأ الكثيرون بظهور النسخة القديمة (2021 أو 2019) داخل الحساب رغم حذفها. يحدث هذا لأن الويندوز يحتفظ بتراخيص التفعيل القديمة مخفية في النظام. هذه الأداة تقوم بحذف هذه التراخيص العالقة بضغطة زر.

---

##  Features | المميزات

* 🛡️ **Smart Clean:** Detects and keeps your `--LICENSED--` (Active) product keys safe, while deleting only the expired or pending ones.
* 🗑️ **Deep Clean:** Option to wipe all Office licenses from the system for a fresh start.
* ⚡ **Auto-Elevation:** Automatically asks for Administrator privileges; no need to manually right-click.
* 🖥️ **Clean GUI:** Uses native Windows pop-up dialogs (VBScript) for user prompts instead of a messy console window.
* 🔒 **Safe & Native:** Uses only Microsoft's official `ospp.vbs` engine. No third-party software, no false-positive virus alerts.

---

##  How to Download & Use | طريقة التحميل والاستخدام

1. Go to the [Releases](../../releases) page.
2. Download the `Office-Cleaner.bat` file.
3. Double-click the file to run it.
4. Click **Yes** when Windows asks for Administrator permission.
5. Choose your cleaning mode:
   * **[ Yes ] Smart Clean (التنظيف الذكي):** Keeps your active license and removes the old ones. *(Recommended)*
   * **[ No ] Deep Clean (تنظيف شامل):** Removes ALL Office licenses.
6. Wait a few seconds for the success message detailing exactly which keys were removed.

---

##  Author

* **Turki Alshaikh** - IT Specialist & Developer.
* Find more tools and premium software licenses at [Mfatihy.com](https://mfatihy.com).

##  License

This project is open-source and available to the community. Feel free to fork, modify, and distribute.
