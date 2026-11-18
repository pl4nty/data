-- Threat: !InfrastructureShared
-- Name: 43b3858b75bb
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
  if MpCommon.QueryPersistContextNoPath("MpNewRemoteUsers", l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
