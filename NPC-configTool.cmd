@echo off
mode con:cols=80 lines=30
echo.
echo [提示]建议在管理员模式下运行
echo.
echo 输入当前目录，直接在地址栏复制即可。
echo 当前目录需要存在npc.exe
echo.
set /p dirs=当前目录:
cd %dirs%
cls
title [Working]正在检测NAT类型
echo ===============================================================================
echo                                    NAT类型检测
echo.
npc.exe nat -stun_addr=stun.stunprotocol.org:3478
echo.
echo                           Symmetric NAT无法使用P2P模式
echo ===============================================================================
echo.
echo 如果提示npc.exe不是内部或外部命令，也不是可运行的程序或批处理文件。
echo 请检查上一步骤目录输入是否正确，目录内是否存在npc.exe
echo.
echo.
echo ===============================================================================
echo                                 服务器地址设置
echo.
set /p targetServer=服务器地址:
echo.
echo ===============================================================================

:main
title NPC-configTool
cls
echo 当前服务器地址%targetServer%
echo.
echo.
echo    ①  使用Vkey在线下发配置并注册至系统服务
echo.
echo    ②  卸载系统服务/重新设置系统服务
echo.
echo    ③  临时使用NPC_client（使用Vkey配置）
echo.
echo    ④  启动系统服务NPC_client
echo.
echo    ⑤  P2P访问端模式
echo.
echo    ⑥  停止系统服务NPC_client
echo.
echo    ⑦  配置文件模式[下个版本搞]
echo.
echo    ⑧  升级NPC
echo.
echo    ⑨  手动命令
echo.
echo.
set /p ch=输入命令编号:
if %ch%==1 goto 1
if %ch%==2 goto 2
if %ch%==3 goto 3
if %ch%==4 goto 4
if %ch%==5 goto 5
if %ch%==6 goto 6
if %ch%==7 goto main
if %ch%==8 goto 8
if %ch%==9 goto 9
if %ch%==10 goto main
goto main


:1
cls
echo ===============================================================================
echo.
echo 使用Vkey在线下发配置并注册至系统服务
echo.
set /p vkey=输入Vkey:
echo.
@echo on
npc.exe install -server=%targetServer% -vkey=%vkey%
@echo off
echo.
echo 请查看提示信息，使用主界面[4]启动系统服务NPC_client启动服务
pause
goto main


:2
cls
echo ===============================================================================
echo.
echo 卸载系统服务
echo.
@echo on
npc.exe uninstall
@echo off
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main


:3
cls
echo ===============================================================================
echo.
echo 无配置文件模式启动NPC_client
echo.
set /p vkey=输入Vkey:
@echo on
npc.exe -server=%targetServer% -vkey=%vkey%
npc.exe start -server=%targetServer% -vkey=%vkey%
@echo off
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main


:4
cls
echo ===============================================================================
echo.
echo 服务模式启动NPC_client
echo.
@echo on
npc.exe start
@echo off
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main


:5
cls
echo ===============================================================================
echo.
echo P2P访问端
echo.
set /p vkey=输入需要连接客户端Vkey:
set /p p2ppsw=输入P2P密码：
set /p p2pport=映射P2P端口:
npc.exe -server=%targetServer% -vkey=%vkey% -password=%p2ppsw% -target=%p2pport%
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main


:6
cls
echo ===============================================================================
echo.
echo ***停止***
echo.
@echo on
npc.exe stop
@echo off
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main

:8
cls
echo ===============================================================================
echo.
echo 请确保npc-update.exe在当前目录
echo.
echo 按回车键确认
pause>nul
echo.
@echo on
npc-update.exe update
@echo off
echo.
echo 请查看上方信息
echo.
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main

:9
cls
echo ===============================================================================
echo 语法: npc.exe "code"
set /p code=输入code:
echo.
@echo on
npc.exe %code%
@echo off
echo.
echo ===============================================================================
echo 按回车键返回主菜单&&pause>nul
goto main