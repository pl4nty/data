-- Threat: !InfrastructureShared
-- Name: 107b3e5aba9c6
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(MpCommon.QuerySessionInformation, l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
