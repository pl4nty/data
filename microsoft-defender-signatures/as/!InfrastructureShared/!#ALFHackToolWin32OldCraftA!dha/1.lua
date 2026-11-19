-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/OldCraft.A!dha
-- Type: 24
-- MpAttributes: HEUR:WinApiExec

local l_0_0 = mp.getfilesize()
if 30000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 ~= nil and l_0_1:find("winapiexec", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
