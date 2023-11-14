@echo off 
mode 150


set /A a=0
set /A b=19

:start

set /A a+=1

if %a%==1 color 8
if %a%==2 color 9
if %a%==3 color 1
if %a%==4 color 9
if %a%==5 color a
if %a%==6 color 2
if %a%==7 color a
if %a%==8 color b
if %a%==9 color 3
if %a%==10 color b
if %a%==11 color c
if %a%==12 color 4
if %a%==13 color c
if %a%==14 color d
if %a%==15 color 5
if %a%==16 color d
if %a%==17 color e
if %a%==18 color 6
if %a%==19 color e

if %a%==%b% (
	set /A a=0
	cls
	type shrek.txt
)

goto start