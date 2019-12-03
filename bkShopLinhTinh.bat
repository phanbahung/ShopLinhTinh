
"C:\Program Files\Microsoft SQL Server\100\Tools\Binn\SQLCMD.exe" -S .\SQLEXPRESS -d master -U sa -P admin123 -i e:\BK\ShopLinhTinh\TASK\backup_ShopLinhTinh_DB.sql

for /f %%d in ('datex -f ddd') do set TenThu=%%d
for /f %%d in ('datex -f dd-MM-yyyy-hh-MM') do set TenThuFull=%%d

set dirpbh= e:\bk\bkShopLinhTinh



REM Copy Source ==> temp
xcopy "C:\Users\Administrator\Documents\Visual Studio 2015\Projects\ShopLinhTinh" %dirpbh%\temp /D /C /R /s /i /Y



REM  Copy DB ==> temp
xcopy %dirpbh%\db\*.* E:\bk\ShopLinhTinh\temp /D /C /R /Y


REM Nen temp thanh file va chep vao thu muc zip 
C:\"Program Files"\WinRAR\winrar a -r  %dirpbh%\zip\%TenThuFull%_ShopLinhTinh.rar *.* %dirpbh%\temp

Set dir= %dirpbh%\temp

Echo Deleting all files from %dir%
del %dir%\* /F /Q

Echo Deleting all folders from %dir%
for /d %%p in (%dir%\*) Do rd /Q /S "%%p"



