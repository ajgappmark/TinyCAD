; Script generated by the HM NIS Edit Script Wizard.
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "TinyCAD"
!define PRODUCT_VERSION "3.00.00"
!define PRODUCT_PUBLISHER "TinyCAD"
!define PRODUCT_WEB_SITE "https://www.tinycad.net"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\TinyCad.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_INSTALLER_NAME "TinyCAD_${PRODUCT_VERSION}_Production_Release.exe"

; MUI 1.67 compatible ------
!include Sections.nsh
!include "MUI2.nsh"

; For request admin rights
!include LogicLib.nsh

; Our custom dialogue
!include "AllUsersDlg.nsdinc"

; For the DLL installer
!include "UpgradeDll.nsh"

; MUI (Modern User Interface) Settings
!define MUI_ABORTWARNING

; Welcome page
!insertmacro MUI_PAGE_WELCOME

; License page
!insertmacro MUI_PAGE_LICENSE "licence.rtf"

; Custom page
Page custom fnc_AllUsersDlg_Show

; Directory page
!insertmacro MUI_PAGE_DIRECTORY

; Instfiles page
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\TinyCad.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${PRODUCT_INSTALLER_NAME}"

; Require admin rights on NT6+ (When UAC is turned on)
RequestExecutionLevel admin 

InstallDir "$PROGRAMFILES32\TinyCAD"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""


ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01

  ; If silent install then install for "all users"
  IFSilent 0 +2
    SetShellVarContext all

  
  CreateDirectory "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "..\Release\TinyCad.exe"
  CreateDirectory "$SMPROGRAMS\TinyCAD"
  CreateShortCut "$SMPROGRAMS\TinyCAD\TinyCAD.lnk" "$INSTDIR\TinyCad.exe"
  CreateShortCut "$DESKTOP\TinyCAD.lnk" "$INSTDIR\TinyCad.exe"
  ; 
  ;	Note:  These relative paths only work correctly if you are compiling the install script from the installer sub-directory!
  ; 
  File "..\Release\libpng16.dll"
  File "..\Release\zlib.dll"
  File "..\manual\TinyCAD.html"
  File "..\installer\LGPL Version 2.1.txt"
  File "..\installer\LGPL Version 3.0.txt"

  CreateShortCut "$SMPROGRAMS\TinyCAD\User Manual.lnk" "$INSTDIR\TinyCAD.html"

  ;
  ; Register '.dsn' files as 'TinyCAD Design'
  ; 
  WriteRegStr HKCR ".dsn" "" "TinyCAD Design"  ; set our file association
  WriteRegStr HKCR "TinyCAD Design" "" "TinyCAD Design"
  WriteRegStr HKCR "TinyCAD Design\shell" "" "open"
  WriteRegStr HKCR "TinyCAD Design\DefaultIcon" "" "$INSTDIR\TinyCad.exe,0"
  WriteRegStr HKCR "TinyCAD Design\shell\open\command" "" '"$INSTDIR\TinyCad.exe" "%1"'
  
  WriteRegStr HKCR "TinyCAD Design\shell\edit" "" "Edit TinyCAD Design"
  WriteRegStr HKCR "TinyCAD Design\shell\edit" "Icon" '"$INSTDIR\TinyCad.exe",0'
  WriteRegStr HKCR "TinyCAD Design\shell\edit\command" "" '"$INSTDIR\TinyCad.exe" "%1"'
  
  SetOutPath "$INSTDIR\library"
  File "..\examples\libraries\74TTL.TCLib"
  File "..\examples\libraries\AC connectors.TCLib"
  File "..\examples\libraries\Analog.TCLib"
  File "..\examples\libraries\Connectors.TCLib"
  File "..\examples\libraries\DISCRETE.TCLib"
  File "..\examples\libraries\IC-CMOS4000.TCLib"
  File "..\examples\libraries\IC-OPAMP.TCLib"
  File "..\examples\libraries\IC-VREG.TCLib"
  File "..\examples\libraries\Microcontroller.TCLib"
  File "..\examples\libraries\passive2.TCLib"
  File "..\examples\libraries\passive.TCLib"
  File "..\examples\libraries\semi.TCLib"
  File "..\examples\libraries\switches.TCLib"
  File "..\examples\libraries\valve.TCLib"
  File "..\examples\libraries\gen_semiconductor.TCLib"
  File "..\examples\libraries\gen_passive.TCLib"
  File "..\examples\libraries\gen_Mechanical.TCLib"
  File "..\examples\libraries\gen_Logic.TCLib"
  File "..\examples\libraries\Mechanical.TCLib"
  File "..\examples\libraries\gen_Electromechanical_switches.TCLib"
  File "..\examples\libraries\gen_Electromechanical_Relays.TCLib"
  File "..\examples\libraries\gen_Electromechanical.TCLib"
  File "..\examples\libraries\pm_Connectors.TCLib"
  File "..\examples\libraries\pm_Electromechanical.TCLib"
  File "..\examples\libraries\pm_Indicators.TCLib"
  File "..\examples\libraries\Power.TCLib"
  File "..\examples\libraries\cm_Connectors.TCLib"
  File "..\examples\libraries\sm_IC_Transceivers.TCLib"
  File "..\examples\libraries\Assemblies.TCLib"
  File "..\examples\libraries\symbols.TCLib"
  File "..\examples\libraries\th_Comparators.TCLib"
  File "..\examples\libraries\th_Connectors.TCLib"
  File "..\examples\libraries\th_Electromechanical.TCLib"
  File "..\examples\libraries\th_Headers.TCLib"
  File "..\examples\libraries\th_OpAmps.TCLib"
  File "..\examples\libraries\th_Passive.TCLib"
  File "..\examples\libraries\th_Semiconductors.TCLib"
  File "..\examples\libraries\th_Transceivers.TCLib"
  File "..\examples\libraries\th_uC.TCLib"
  File "..\examples\libraries\th_Vreg.TCLib"
  File "..\examples\libraries\gen_Power.TCLib"
  File "..\examples\libraries\Relay_v1.TCLib"

  SetOutPath "$INSTDIR\examples"
  File "..\examples\circuits\AMP.DSN"
  File "..\examples\circuits\AtTiny LED Flasher.dsn"
  File "..\examples\circuits\CurrSens.dsn"
  File "..\examples\circuits\nanocomp6802.dsn"
  File "..\examples\circuits\WaterSensor.dsn"
  
  ; A file purely for the purpose of setting a timestamp of when TinyCAD was installed
  FileOpen $0 "$INSTDIR\installed.txt" w
  FileClose $0

  ; Install the C++ redistributable  
  SetOutPath "$INSTDIR"
  File ".\VC_redist.x86.exe"
  ExecWait '"$INSTDIR\VC_redist.x86.exe /passive /norestart"'
  Delete "$INSTDIR\VC_redist.x86.exe"

SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\TinyCAD\TinyCAD Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\TinyCAD\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$SMPROGRAMS\TinyCAD\Users Group.lnk" "https://forum.tinycad.net"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\TinyCad.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\TinyCad.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function .onInit
  UserInfo::GetAccountType
  pop $0
  ${If} $0 != "admin" ;Require admin rights on NT4+
    MessageBox mb_iconstop "Administrator rights required!"
    SetErrorLevel 740 ;ERROR_ELEVATION_REQUIRED
    Quit
  ${EndIf}
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  IFSilent +2
    MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  IFSilent +3
    MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
    Abort
FunctionEnd

Section Uninstall

  ; Determine if we installed for all users or a specific user
  IfFileExists "$SMPROGRAMS\TinyCAD\TinyCAD.lnk" +2 0
    SetShellVarContext all

  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"

  Delete "$INSTDIR\examples\VREG.DSN"
  Delete "$INSTDIR\examples\VCA.DSN"
  Delete "$INSTDIR\examples\nanocomp6802.dsn"
  Delete "$INSTDIR\examples\CurrSens.dsn"
  Delete "$INSTDIR\examples\KEYSW.DSN"
  Delete "$INSTDIR\examples\INVERTER.DSN"
  Delete "$INSTDIR\examples\face.dsn"
  Delete "$INSTDIR\examples\AtTiny LED Flasher.dsn"
  Delete "$INSTDIR\examples\AMP.DSN"
  Delete "$INSTDIR\examples\CurSens.dsn"
  Delete "$INSTDIR\examples\WaterSensor.dsn"

  Delete "$INSTDIR\library\valve.mdb"
  Delete "$INSTDIR\library\switches.mdb"
  Delete "$INSTDIR\library\semi.mdb"
  Delete "$INSTDIR\library\passive.mdb"
  Delete "$INSTDIR\library\passive2.mdb"
  Delete "$INSTDIR\library\Microcontroller.mdb"
  Delete "$INSTDIR\library\IC-VREG.mdb"
  Delete "$INSTDIR\library\IC-OPAMP.mdb"
  Delete "$INSTDIR\library\IC-CMOS4000.mdb"
  Delete "$INSTDIR\library\DISCRETE.mdb"
  Delete "$INSTDIR\library\Connectors.mdb"
  Delete "$INSTDIR\library\Analog.mdb"
  Delete "$INSTDIR\library\AC connectors.mdb"
  Delete "$INSTDIR\library\74TTL.mdb"
  Delete "$INSTDIR\library\74TTL.TCLib"
  Delete "$INSTDIR\library\AC connectors.TCLib"
  Delete "$INSTDIR\library\Analog.TCLib"
  Delete "$INSTDIR\library\Assemblies.TCLib"
  Delete "$INSTDIR\library\cm_Connectors.TCLib"
  Delete "$INSTDIR\library\Connectors.TCLib"
  Delete "$INSTDIR\library\DISCRETE.TCLib"
  Delete "$INSTDIR\library\gen_Electromechanical.TCLib"
  Delete "$INSTDIR\library\gen_Electromechanical_Relays.TCLib"
  Delete "$INSTDIR\library\gen_Electromechanical_switches.TCLib"
  Delete "$INSTDIR\library\gen_Logic.TCLib"
  Delete "$INSTDIR\library\gen_Mechanical.TCLib"
  Delete "$INSTDIR\library\gen_passive.TCLib"
  Delete "$INSTDIR\library\gen_Power.TCLib"
  Delete "$INSTDIR\library\gen_semiconductor.TCLib"
  Delete "$INSTDIR\library\IC-CMOS4000.TCLib"
  Delete "$INSTDIR\library\IC-OPAMP.TCLib"
  Delete "$INSTDIR\library\IC-VREG.TCLib"
  Delete "$INSTDIR\library\Mechanical.TCLib"
  Delete "$INSTDIR\library\Microcontroller.TCLib"
  Delete "$INSTDIR\library\passive.TCLib"
  Delete "$INSTDIR\library\passive2.TCLib"
  Delete "$INSTDIR\library\pm_Connectors.TCLib"
  Delete "$INSTDIR\library\pm_Electromechanical.TCLib"
  Delete "$INSTDIR\library\pm_Indicators.TCLib"
  Delete "$INSTDIR\library\Power.TCLib"
  Delete "$INSTDIR\library\semi.TCLib"
  Delete "$INSTDIR\library\sm_IC_Transceivers.TCLib"
  Delete "$INSTDIR\library\switches.TCLib"
  Delete "$INSTDIR\library\symbols.TCLib"
  Delete "$INSTDIR\library\th_Comparators.TCLib"
  Delete "$INSTDIR\library\th_Connectors.TCLib"
  Delete "$INSTDIR\library\th_Electromechanical.TCLib"
  Delete "$INSTDIR\library\th_Headers.TCLib"
  Delete "$INSTDIR\library\th_OpAmps.TCLib"
  Delete "$INSTDIR\library\th_Passive.TCLib"
  Delete "$INSTDIR\library\th_Semiconductors.TCLib"
  Delete "$INSTDIR\library\th_Transceivers.TCLib"
  Delete "$INSTDIR\library\th_uC.TCLib"
  Delete "$INSTDIR\library\th_Vreg.TCLib"
  Delete "$INSTDIR\library\valve.TCLib"
  Delete "$INSTDIR\library\Relay_v1.TCLib"

  Delete "$INSTDIR\TinyCAD.html"

  Delete "$INSTDIR\zlib.dll"
  Delete "$INSTDIR\libpng16.dll"
  Delete "$INSTDIR\TinyCad.exe"
  Delete "$INSTDIR\installed.txt"

  Delete "$SMPROGRAMS\TinyCAD\Uninstall.lnk"
  Delete "$SMPROGRAMS\TinyCAD\TinyCAD Website.lnk"
  Delete "$SMPROGRAMS\TinyCAD\Help.lnk"
  Delete "$DESKTOP\TinyCAD.lnk"
  Delete "$SMPROGRAMS\TinyCAD\Users Group.lnk"
  Delete "$SMPROGRAMS\TinyCAD\TinyCAD.lnk"
  Delete "$SMPROGRAMS\TinyCAD\User Manual.lnk"
  Delete "$INSTDIR\LGPL Version 2.1.txt"
  Delete "$INSTDIR\LGPL Version 3.0.txt"

  RMDir "$SMPROGRAMS\TinyCAD"
  RMDir "$INSTDIR\library"
  RMDir "$INSTDIR\examples"
  RMDir "$INSTDIR"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
