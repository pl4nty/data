-- Threat: !InfrastructureShared
-- Name: adb3b8e320b2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSClientAddress)
  bm.add_related_string("bmurl", l_0_2.Address, bm.RelatedStringBMReport)
  TrackAttackerServer(l_0_2.Address)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
