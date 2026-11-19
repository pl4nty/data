-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/Brusshot.B!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:CHMExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("exploit.chm", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
