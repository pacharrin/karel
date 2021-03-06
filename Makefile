DESTDIR?=/

all: kcl karel

CFLAGS := -B  -Mobjfpc -Scghi -O1 -Tlinux -g -gl -vewnhi

karel: CodecUtilsWin32.pas EncodingUtils.pas FastStringFuncs.pas FastStrings.pas karel.lpi karel.lpr karel.manifest karel.rc karel.res NativeXmlObjectStorage.pas NativeXmlOld.pas NativeXml.pas NativeXmlWin32Compat.pas sdDebug.pas sdSortedLists.pas sdStreams.pas sdStringTable.pas simdesign.inc UKEntorno.pas UKMundo.pas UKProgramaCompilado.pas
	/usr/bin/fpc ${CFLAGS} -l karel.lpr

kcl: CodecUtilsWin32.pas EncodingUtils.pas kcl.lpi kcl.lpr kcl.manifest kcl.rc kcl.res NativeXmlObjectStorage.pas NativeXmlOld.pas NativeXml.pas NativeXmlWin32Compat.pas sdDebug.pas sdSortedLists.pas sdStreams.pas sdStringTable.pas simdesign.inc UCompilador_V3.pas UKProgramaCompilado.pas
	/usr/bin/fpc ${CFLAGS} -l kcl.lpr

install: kcl karel libkarel.py
	install -d ${DESTDIR}/usr/bin && install -t ${DESTDIR}/usr/bin/ kcl karel
	install -d ${DESTDIR}/usr/lib/python2.7/ && install -t ${DESTDIR}/usr/lib/python2.7/ libkarel.py

clean:
	rm -rf lib
	rm -f kcl
	rm -f karel
	rm -f *.o *.ppu *.rst
