-- Threat: !InfrastructureShared
-- Name: 235b3e21c8a6e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
  if MpCommon.QueryPersistContextNoPath("MpNewRemoteUsers", l_0_2) then
    local l_0_3 = isTamperProtectionOn(false)
    bm.add_related_string("TpState", tostring(l_0_3), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
