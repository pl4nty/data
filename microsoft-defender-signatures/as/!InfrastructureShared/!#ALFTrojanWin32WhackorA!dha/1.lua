-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Whackor.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:INIExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\windows\\system32\\cdb.ini", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
