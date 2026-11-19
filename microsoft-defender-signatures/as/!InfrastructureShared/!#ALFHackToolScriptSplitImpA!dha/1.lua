-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Script/SplitImp.A!dha
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & Lua:PYExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\cyagent\\", 1, true) and (l_0_0:find("\\build\\lib\\cyagent\\", 1, true) or l_0_0:find("\\lib\\site-packages\\cyagent\\", 1, true) or l_0_0:find("\\cyagent\\agent_services\\", 1, true) or l_0_0:find("\\cyagent\\installers\\", 1, true) or l_0_0:find("\\cyagent\\consts\\", 1, true) or l_0_0:find("\\cyagent\\config\\", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
