@echo off
rem Build mktables.exe
rem This step is only required if one of the following files were modified:
rem 1) instr.set
rem 2) instr.key
rem 3) instr.ord
rem 4) mktables.c
rem To build with the Microsoft C compiler use the following line:
cl /Ox /W3 mktables.c
rem To build with the Open Watcom C compiler use the following line:
rem wcl -ox -3 mktables.c
