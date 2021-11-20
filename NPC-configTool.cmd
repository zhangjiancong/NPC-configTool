<<<<<<< HEAD
@echo off
mode con:cols=80 lines=30
echo.
echo [��ʾ]�����ڹ���Աģʽ������
echo.
echo ���뵱ǰĿ¼��ֱ���ڵ�ַ�����Ƽ��ɡ�
echo ��ǰĿ¼��Ҫ����npc.exe
echo.
set /p dirs=��ǰĿ¼:
cd %dirs%
cls
title [Working]���ڼ��NAT����
echo ===============================================================================
echo                                    NAT���ͼ��
echo.
npc.exe nat -stun_addr=stun.stunprotocol.org:3478
echo.
echo                           Symmetric NAT�޷�ʹ��P2Pģʽ
echo ===============================================================================
echo.
echo �����ʾnpc.exe�����ڲ����ⲿ���Ҳ���ǿ����еĳ�����������ļ���
echo ������һ����Ŀ¼�����Ƿ���ȷ��Ŀ¼���Ƿ����npc.exe
echo.
echo.
echo ===============================================================================
echo                                 ��������ַ����
echo.
set /p targetServer=��������ַ:
echo.
echo ===============================================================================

:main
title NPC-configTool
cls
echo ��ǰ��������ַ%targetServer%
echo.
echo.
echo    ��  ʹ��Vkey�����·����ò�ע����ϵͳ����
echo.
echo    ��  ж��ϵͳ����/��������ϵͳ����
echo.
echo    ��  ��ʱʹ��NPC_client��ʹ��Vkey���ã�
echo.
echo    ��  ����ϵͳ����NPC_client
echo.
echo    ��  P2P���ʶ�ģʽ
echo.
echo    ��  ֹͣϵͳ����NPC_client
echo.
echo    ��  �����ļ�ģʽ[�¸��汾��]
echo.
echo    ��  ����NPC
echo.
echo    ��  �ֶ�����
echo.
echo.
set /p ch=����������:
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
echo ʹ��Vkey�����·����ò�ע����ϵͳ����
echo.
set /p vkey=����Vkey:
echo.
@echo on
npc.exe install -server=%targetServer% -vkey=%vkey%
@echo off
echo.
echo ��鿴��ʾ��Ϣ��ʹ��������[4]����ϵͳ����NPC_client��������
pause
goto main


:2
cls
echo ===============================================================================
echo.
echo ж��ϵͳ����
echo.
@echo on
npc.exe uninstall
@echo off
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main


:3
cls
echo ===============================================================================
echo.
echo �������ļ�ģʽ����NPC_client
echo.
set /p vkey=����Vkey:
@echo on
npc.exe -server=%targetServer% -vkey=%vkey%
npc.exe start -server=%targetServer% -vkey=%vkey%
@echo off
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main


:4
cls
echo ===============================================================================
echo.
echo ����ģʽ����NPC_client
echo.
@echo on
npc.exe start
@echo off
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main


:5
cls
echo ===============================================================================
echo.
echo P2P���ʶ�
echo.
set /p vkey=������Ҫ���ӿͻ���Vkey:
set /p p2ppsw=����P2P���룺
set /p p2pport=ӳ��P2P�˿�:
npc.exe -server=%targetServer% -vkey=%vkey% -password=%p2ppsw% -target=%p2pport%
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main


:6
cls
echo ===============================================================================
echo.
echo ***ֹͣ***
echo.
@echo on
npc.exe stop
@echo off
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main

:8
cls
echo ===============================================================================
echo.
echo ��ȷ��npc-update.exe�ڵ�ǰĿ¼
echo.
echo ���س���ȷ��
pause>nul
echo.
@echo on
npc-update.exe update
@echo off
echo.
echo ��鿴�Ϸ���Ϣ
echo.
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main

:9
cls
echo ===============================================================================
echo �﷨: npc.exe "code"
set /p code=����code:
echo.
@echo on
npc.exe %code%
@echo off
echo.
echo ===============================================================================
echo ���س����������˵�&&pause>nul
goto main
=======

>>>>>>> 4bc3230bd1cd98286a08018bddff7a197d7caf63
