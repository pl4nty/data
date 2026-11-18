-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Script/Tedloka.A!dha
-- Type: 13
-- MpAttributes: LUA:FileSizeLE1M.B & BM_SCRIPT_OR_TEXT_FILE

local l_0_0 = mp.enum_mpattributesubstring("SCPT:TedlokaA")
if 5 < #l_0_0 then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
