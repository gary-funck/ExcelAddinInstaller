SHELL:=/bin/bash
ifneq ($(shell uname -o),Cygwin)
  $(error This Makefile requires Cygwin)
endif
ISCC=/c/Program Files (x86)/Inno Setup 5/iscc.exe
ifneq ($(shell test -f "$(ISCC)" && echo OK),OK)
  $(error iscc not found: "$(ISCC)")
endif
ADD_IN=source/SMF/SMF Add In/RCH_Stock_Market_Functions.xla
ZIP_FILE=$(wildcard source/SMF/RCH_Stock_Market_Functions-*.zip)
CFG_VERSION=\#define VERSION \"$$smf_major_v\"   ; The version number
CFG_LONGV=\#define LONGVERSION \"$$smf_version\" ; The long version number
CFG_YEARS=\#define YEARSPAN \"2007-$$smf_year\"  ; The year(s) of publication

.PHONY: default clean

default: $(ADD_IN)
	'$(ISCC)' addin-installer.iss

$(ADD_IN): source

source: FORCE
	mkdir -p source
	cd source && $(PWD)/bin/get-smf-web-pages
	# Update version number information in the config file.
	$(MAKE) -B local-config.iss

FORCE:

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
