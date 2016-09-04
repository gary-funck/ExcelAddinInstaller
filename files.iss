; Files are expected in the {#sourcedir} (see config.dist.iss).
; The destination folder is automatically determined; it resides in the
; user profile. See inc/code.iss for details.
Source: "{#sourcedir}/*"; DestDir: "{sd}/{#product}"; \
  Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; Office 2000 is version 9.
; Office 2010 is version 14.
; Office 2016 is version 16.
Source:  "{#sourcedir}/SMF Add-In/RCH_Stock_Market_Functions.xla"; \
DestDir: "{code:GetDestDir}/"; \
	Check: ShouldInstallFile(9,16); \
	AfterInstall: ActivateAddin(9,16); Excludes: *.xlam
