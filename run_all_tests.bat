@echo off
echo ================================
echo  Running All Test Cases
echo ================================

REM Loop through all .txt files inside test_cases folder
for %%f in (test_cases\*.txt) do (
    echo ----------------------------------------
    echo Running: %%~nxf
    echo ----------------------------------------
    
    REM Copy current test file into program.txt
    copy /Y "%%f" program.txt > nul
    
    REM Run the compiler executable
    .\output.exe

    echo.
)

echo ================================
echo  ✅All tests completed.
echo ================================
pause

