Local lcVersionFile, lcVersionText

lcVersionFile = 'InstalledFiles\Version.h'
Erase (m.lcVersionFile)

lcVersionText = Textmerge('#DEFINE VERSION_NUMBER "Ver <<pcVersion>> : <<pcVersionDate>>"')
Strtofile(m.lcVersionText, m.lcVersionFile)

