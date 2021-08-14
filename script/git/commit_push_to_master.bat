@echo off
cd ../..
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
set mydate=%mydate: =0%
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
set mytime=%mytime: =0%
SET timestamp=%mydate%%mytime%
SET commit_message="KwordZ Client Angular CoreUI publishing %timestamp%"
SET tag_name="kwordz_client_angular_coreui_v%timestamp%"
SET tag_version=%tag_name%

@echo on
echo KwordZ Client Angular CoreUI publishing
@echo off
git add .
git commit --all -m %commit_message%
git tag -a v%timestamp% -m "version of %timestamp%"
git push origin
git push origin develop:main
git push origin v%timestamp% develop:main