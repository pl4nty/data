-- Threat: !InfrastructureShared
-- Name: 1d5b3451fdecf
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSClientAddress)
  bm.add_related_string("bmurl", l_0_2.Address, bm.RelatedStringBMReport)
end
return mp.INFECTED
