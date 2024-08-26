
set BASE=%CD%
set HOME=%BASE%\home

set EXTERNAL_PATH=%BASE%\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\coreutils-5.2.0\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\gnuwin32\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\diffutils-2.8.7-1\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\x86_64-13.2.0-release-win32-seh-ucrt-rt_v11-rev1\mingw64\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\llvm-mingw-20240308-ucrt-x86_64\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\binutils-opt-win;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\MinGit-2.43.0-busybox-64\cmd;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\ninja;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\nu-0.96.0-x86_64-pc-windows-msvc;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\busybox-win32\bin;
set EXTERNAL_PATH=%EXTERNAL_PATH%;%BASE%\nvim-win32;

path %PATH%;%EXTERNAL_PATH%

if not "%1" == "/SETENV" setlocal

set PATH=%~dp0strawberry-perl-5.38.2.2-64bit-portable\perl\site\bin;%~dp0strawberry-perl-5.38.2.2-64bit-portable\perl\bin;%~dp0strawberry-perl-5.38.2.2-64bit-portable\c\bin;%PATH%

set TERM=
set PERL_JSON_BACKEND=
set PERL_YAML_BACKEND=
set PERL5LIB=
set PERL5OPT=
set PERL_MM_OPT=
set PERL_MB_OPT=

if "%1" == "/SETENV" goto END

if "%1" == "" goto INTERACTIVE

set ERRORLEVEL=
"%~dp0strawberry-perl-5.38.2.2-64bit-portable\perl\bin\perl.exe" %*
exit /b %ERRORLEVEL%

:INTERACTIVE
perl -MConfig -e "printf("""Perl executable: %%s\nPerl version   : %%vd / $Config{archname}\n\n""", $^X, $^V)" 2>nul
if ERRORLEVEL==1 echo FATAL ERROR: 'perl' does not work; check if your strawberry pack is complete!

echo %PATH%