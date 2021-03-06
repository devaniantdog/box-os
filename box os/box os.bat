@echo off
color 0A
SET version=ALPHA v0052324
title BOX OS %version% (login)
echo Welcome to BOX OS %version%!
echo Would you like to create an account (create), or log into an account (login)?
echo Other options, such as deleting accounts (deleteacc), or editing an account (editacc), can also be done.
@echo off
set /p tasko="input: "
if %tasko%==create goto:createacc
if %tasko%==login goto:LOGIN
if %tasko%==deleteacc goto:deleteacc
pause


:createacc
echo If you accidentally put no input, please close and reopen the batch file.
set /p username="username: "
set /p password="pass: "
echo Don't share the password to your account, or else someone else might mess it up!
echo Creating account...
md "c:\box os\accounts\%username%"
md "c:\box os\accounts\%username%\files"
echo.>"c:\box os\accounts\%username%\username.txt"
echo.>"c:\box os\accounts\%username%\password.txt"
echo %password%  > "password.txt"
echo %username%  > "username.txt"
move "C:\box os\username.txt" "C:\box os\accounts\%username%"
move "C:\box os\password.txt" "C:\box os\accounts\%username%"
echo Please restart the program to launch the program.
pause


:LOGIN
echo Which account would you like to log into?
set /p username="input: "
set/p username1= < C:\box os\accounts\%username%\username.txt
set/p password1=< C:\box os\accounts\%username%\password.txt
title Login
cls
echo -------------------------------------------------
echo                       Login
echo -------------------------------------------------
echo.
echo.
set/p "username2=_               Username : "
set/p "password2=_               Password : "
echo.
IF "%username2%"=="" goto LOGINERROR
IF "%password2"=="" goto LOGINERROR
IF NOT %username2%==%username1% goto LOGINERROR
IF NOT %password2%==%password1% goto LOGINERROR
goto LOADING

:LOGINERROR
echo -------------------------------------------------
echo                     Error
echo -------------------------------------------------
echo
pause
goto LOGIN


:LOADING
title Loading...
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                       Login
echo -------------------------------------------------
echo.
echo.
echo                 Username : %username%
echo                 Password : %password%
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto DONE
goto LOADING

:DONE
title Done
cls
echo -------------------------------------------------
echo                       Done
echo -------------------------------------------------
echo.
echo               #
echo             #
echo     #     #            Login Successfull
echo      #  #
echo       #
echo.
echo.
echo -------------------------------------------------
pause
goto DESKTOP


:deleteacc
echo Are you sure you want to delete an account? (y/n)
set /p areyousureaboutthis="input: "
if %areyousureaboutthis%==y goto:ohno
if %areyousureaboutthis%==n goto:LOGIN


:login
echo I am also test! How dare you pass into my territory!
pause
:ohno
echo Deleting accounts is not currently supported, sorry!
pause
:DESKTOP
title BOX OS %version% (desktop)
cls
echo currently, there isn't really a desktop right now so an input thing will do all the program work.
echo Avaliable programs are: calculator (calc), notepad (write)
set /p run="input: "
if %run%==calc goto:calcmain
if %run%==write goto:writemain
pause
title calculator
color 0A
:calcmain
cls
title BOX OS %version% (calculator)
echo.
echo ---------------------------
echo.
echo
echo.
echo BOX OS calculator v1
echo credits to https://www.instructables.com/id/how-to-create-calculator-in-batch/.
echo calculator was from there
echo.
echo ---------------------------
pause
cls
echo.
echo Enter an input (use one of the letters listed)
echo.
echo a)Addition
echo.
echo b)Subtraction
echo.
echo c)Divison
echo.
echo d)Multipication
echo/
set /p docalc="input: "
if %docalc%== a goto:ADD
if %docalc%== A goto:ADD
if %docalc%== b goto:SUB
if %docalc%== B goto:SUB
if %docalc%== c goto:DIV
if %docalc%== C goto:DIV
if %docalc%== d goto:MUL
if %docalc%== D goto:MUL
echo.
cls
echo Invalid value = %docalc%
echo.
pause
cls
goto:DESKTOP

:ADD
cls
echo ADDITON
echo.
set /p no1="num1. "
echo       +
set /p no2="num2. "
set /a sum=no1+no2
echo ------------
echo %sum%
echo.
pause
cls
goto:DESKTOP


:SUB
cls
echo SUBTACTION
echo.
set /p no1="num1. "
echo       -
set /p no2="num2. "
set /a sum=no1-no2
echo ------------
echo %sum%
echo.
pause
cls
goto:DESKTOP


:DIV
cls
echo DIVISON
echo.
set /p no1="num1. "
echo       /
set /p no2="num2. "
set /a sum=no1/no2
echo ------------
echo %sum%
echo.
pause
cls
goto:DESKTOP


:MUL
cls
echo MULTIPLICATION
echo.
set /p no1="num1. "
echo       *
set /p no2="num2. "
set /a sum=no1*no2
echo ------------
echo %sum%
echo.
pause
cls
goto:DESKTOP
:writemain
cls
echo This is a basic version of the notepad. This will hopefully be more advanced in the future.
echo Do you want to edit a file (editfile) or create a new file (newfile)?
set /p dowrite="input: "
if %dowrite%==newfile goto:writenewfile
if %dowrite%==editfile goto:writeeditfile
:writenewfile
set /p writea="Write!: "
echo What do you want your file to be called?
set /p writefilename="File name: "
echo %writea%  > "%writefilename%.txt"
move "C:\box os\%writea%.txt" "C:\box os\accounts\%username%\files\"
echo Done!
pause
goto:DESKTOP

