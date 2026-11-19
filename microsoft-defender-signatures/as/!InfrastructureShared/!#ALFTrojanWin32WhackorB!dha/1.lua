-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Whackor.B!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:DBExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\windows\\system32\\hkcmd.db", 1, true) or l_0_0:find("\\windows\\system32\\fcache", 1, true) and l_0_1:match("fcache%d%d.db") or l_0_0:find("\\windows\\system32\\speech\\speech", 1, true) and l_0_1:match("speech%d%d.db") then
  mp.set_mpattribute("MpNonPIIFileType")
  return mp.INFECTED
end
return mp.CLEAN
