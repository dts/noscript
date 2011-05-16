TARGET = noscript.xpi
MKDIR = mkdir
UNZIP = unzip
ZIP = zip
CP = cp
RM = rm -f
JAR = jar

CONTENTS = \
	 .autoreg chrome.manifest components/noscriptService.js \
        defaults/preferences/noscript.js GPL.txt install.rdf mozilla.cfg NoScript_License.txt 

$(TARGET): chrome/noscript.jar FORCE
	$(JAR) cvf $@ $(CONTENTS) chrome/noscript.jar

chrome/noscript.jar: FORCE
	( cd chrome ; $(JAR) cvf noscript.jar content locale skin ; cd .. )

test: $(TARGET)
	open $(TARGET) -a Firefox

FORCE: 