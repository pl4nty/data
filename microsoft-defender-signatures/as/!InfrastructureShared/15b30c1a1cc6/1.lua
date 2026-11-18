-- Threat: !InfrastructureShared
-- Name: 15b30c1a1cc6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSClientAddress)
  bm.add_related_string("bmurl", l_0_2.Address, bm.RelatedStringBMReport)
  TrackAttackerServer(l_0_2.Address)
end
return mp.INFECTED
