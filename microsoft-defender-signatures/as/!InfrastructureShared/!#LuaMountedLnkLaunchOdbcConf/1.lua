-- Threat: !InfrastructureShared
-- Name: !#Lua:MountedLnkLaunchOdbcConf
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpOnOpenRtpScan & BM_LNK_FILE & (SCPT:Trojan:Win64/Odbcconf.A | SCPT:Trojan:Win64/Odbcconf.B)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or 2 < #l_0_0 or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetMountedFileBackingFilePath(l_0_0 .. "\\" .. l_0_1)
if l_0_2 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
