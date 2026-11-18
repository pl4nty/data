-- Threat: !InfrastructureShared
-- Name: 74d73064a49e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
TrackCustomPersistContextNameByPPID("set", l_0_0, "MimikatzTrigger")
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
return mp.INFECTED
