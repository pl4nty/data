-- Threat: !InfrastructureShared
-- Name: 41bd7f9b242db
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  TrackCustomPersistContextNameByPPID("set", l_0_0, "MimikatzTrigger")
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
