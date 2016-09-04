ifneq ($(shell uname -o),Cygwin)
  $(error This Makefile requires Cygwin)
endif
# Add the local bin directory to PATH.
PATH:=$(PWD)/bin:$(PATH)
# Add the Inno Setup installation directory to PATH.
INNO_SETUP_PATH=/c/Program Files (x86)/Inno Setup 5
PATH+=:$(INNO_SETUP_PATH)
export PATH
ifneq ($(shell which iscc >/dev/null 2>&1 && echo OK),OK)
  $(error iscc not found)
endif
ADD_IN=source/SMF/SMF Add In/RCH_Stock_Market_Functions.xla
ZIP_FILE=$(wildcard source/SMF/RCH_Stock_Market_Functions-*.zip)
CFG_VERSION=\#define VERSION \"$$smf_major_v\"   ; The version number
CFG_LONGV=\#define LONGVERSION \"$$smf_version\" ; The long version number
CFG_YEARS=\#define YEARSPAN \"2007-$$smf_year\"  ; The year(s) of publication

.PHONY: default clean

default: source local-config.iss
	iscc addin-installer.iss

source:
	mkdir source
	cd source && get-smf-web-pages
	# Update version number information in the config file.
	$(MAKE) local-config.iss


# example: RCH_Stock_Market_Functions-2.1.2016.09.02.zip
local-config.iss:
	@smf_version=`sed -e 's/^.*RCH_Stock_Market_Functions-//;s/\.zip$$//' \
		    <<<"$(ZIP_FILE)"`; \
	smf_major_v=`sed -e 's/^\([0-9]*\.[0-9]*\).*/\1/' \
	            <<<"$${smf_version}"`; \
	smf_year=`sed -e 's/^[0-9]*\.[0-9]*\.//;s/\..*//' \
	            <<<"$${smf_version}"`; \
	echo "$(CFG_VERSION)" >  $@; \
	echo "$(CFG_LONGV)"   >> $@; \
	echo "$(CFG_YEARS)"   >> $@

clean:
	@-rm -rf source local-config.iss
