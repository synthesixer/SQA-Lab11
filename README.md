# 📘  Lab11 SQA UAT

**ผู้จัดทำ**: พุฒิเมธ ชมศรีสวัสดิ์  
**รหัสนักศึกษา**: 673380417‑1  
**Section**: 2  
**รายวิชา**: CP353201 – SQA (Software Quality Assurance)  
**เทอม**: 1/2569  
**คณะ**: วิทยาการคอมพิวเตอร์, มหาวิทยาลัยขอนแก่น

---

## 1. Project Title & Description
**Title**: *Vehicle Insurance Application – Lab 11*

**Description**:  
A web‑based prototype that allows users to request insurance quotations for various vehicle types (cars, pickups, motorcycles, camper‑vans).  The application demonstrates the end‑to‑end flow of:
- Selecting a vehicle type
- Entering vehicle and policy holder information
- Choosing an insurance plan
- Submitting the request which triggers an automated email with the quotation.

The project includes a comprehensive **UAT (User Acceptance Test) suite** written in Robot Framework and Tricentis Tosca, together with test reports and a Word‑format UAT document.

---

## 2. Prerequisites / Requirements
| Requirement | Version |
|------------|---------|
| Operating System | Windows 10/11 (64‑bit) |
| Python | 3.10 or later |
| `pip` | latest |
| Browser for UI testing | Google Chrome (latest) |
| Test tools | Robot Framework, SeleniumLibrary, Tricentis Tosca |
| Additional Python packages | `python-docx`, `robotframework`, `selenium` |

---

## 3. Installation
```bash
# 1. Clone the repository
git clone https://github.com/Synthesixer/SQA-Lab11.git
cd SQA-Lab11

# 2. Create a virtual environment (recommended)
python -m venv venv
venv\Scripts\activate   # on Windows

# 3. Install required Python packages
pip install -r requirements.txt

# 4. Install browser driver (ChromeDriver) that matches your Chrome version
#    Place `chromedriver.exe` in the project root or add it to PATH.
```
> **NOTE**: `requirements.txt` already contains `python-docx`, `robotframework`, `selenium`, etc.

---

## 4. How to Run Tests
```bash
# Run the Robot Framework test suite (covers the insurance quotation flow)
robot -d results ./Senario1
robot -d results ./Senario2
```
- Test results (log.html, report.html) will be generated in the `results/` folder.
- The **UAT Test Script** and **UAT Test Report** (both in `.docx` format) are located under `Docs/`.

---

## 5. Project Structure
```
SQA-Lab11/
│   README.md                # <‑‑ this file
│   requirements.txt          # Python dependencies
│   create_uat_docx.py        # script that generates the UAT .docx file
│
├── Docs/                     # Documentation
│   ├── Lab11_TestScript_Insurance.docx   #  test script 
│
├── Senario1/                 # Robot Framework test suite – scenario 1
│   └── *.robot
├── Senario2/                 # Robot Framework test suite – scenario 2
│   └── *.robot
├── Results/                  # Test execution output (log.html, report.html)
└── ... (other source files)
```

---

## 6. Test Reports
- **Automated Test Reports**: After running the Robot tests, open `results/report.html` to view detailed step‑by‑step logs and screenshots.
- **UAT Document**: `Docs/Lab11_UAT_Document.docx` – formal UAT specification containing test scenarios, actual results, pass/fail status, and remarks.

---

*Prepared for submission to the instructor of CP353201 – Software Quality Assurance.*
