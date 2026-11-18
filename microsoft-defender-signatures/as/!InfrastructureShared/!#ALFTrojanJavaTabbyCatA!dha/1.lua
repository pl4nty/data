-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Java/TabbyCat.A!dha
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & LUA:FileSizeLE50KB.B

if #mp.enum_mpattributesubstring("SCPT:TabbyCat.AA") >= 2 and string.find(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)), "%.java$") then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
