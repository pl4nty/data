-- Threat: !InfrastructureShared
-- Name: 96b32f83b219
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
