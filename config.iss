
#define VERSION "1.0"                ; The version number
#define LONGVERSION "1.0.0.0"        ; The version in four-number format
#define YEARSPAN "2007-2016"              ; The year(s) of publication

; Extract the version number from
; the downloaded Zip file name.
#include "local-config.iss"
                                     ; (e.g., 2014-2015)
#define PRODUCT "SMF Add-In"
#define COMPANY "Randy Harmelink"

#define SOURCEDIR "source/SMF"       ; The folder with the addin files
                                     ; (relative path)

#define LOGFILE "INST-LOG.TXT"       ; The name of the log file. 

AppPublisherURL=http://ogres-crypt.com/SMF
AppSupportURL=https://groups.google.com/forum/#!forum/smf-addin
AppUpdatesURL=http://ogres-crypt.com/SMF
OutputBaseFilename=smf_installer_{#version}
OutputDir=deploy

; If you want to display a license file, uncomment the following
; line and put in the correct file name.
LicenseFile=SMF/License.rtf

; Icons and banners
; The install icon and banner do not need to be included
; in the setup package; they are only required during compilation
; of the InnoSetup script.
SetupIconFile=SMF/SMF.ico

; WizardImageFile=\images\installbanner.bmp
; WizardSmallImageFile=..\images\icon.bmp
; WizardImageStretch=false
; WizardImageBackColor=clWhite

; The uninstall icon must be included in the setup package
; and placed in the output folder.
; UninstallDisplayIcon={app}\icon.png

; Specific AppID
; Use InnoSetup's Generate UID command from the Tools menu
; to generate a unique ID. Make sure to have this ID start
; with TWO curly brackets.
; Never change this UID after the addin has been deployed.
AppId={{B7B9BEF2-EA5F-41DE-A821-7C2BEB53EA69}

; vim: set nospell ts=2 sts=2 sw=2 noet tw=60 fo+=lj cms=;%s :
