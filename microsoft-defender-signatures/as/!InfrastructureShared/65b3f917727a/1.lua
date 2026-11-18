-- Threat: !InfrastructureShared
-- Name: 65b3f917727a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = false
local l_0_2 = false
if not l_0_0 or not l_0_0.pid then
  return mp.CLEAN
end
l_0_2, l_0_1 = pcall(MpCommon.QuerySessionInformation, l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_2 and l_0_1 then
  reportSessionInformation()
  reportRelevantUntrustedEntities()
  return mp.INFECTED
end
return mp.CLEAN
