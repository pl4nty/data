-- Threat: !InfrastructureShared
-- Name: 1c1d7fd4d34dc
-- Type: 21
-- Flags: 1
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_1.ppid, MpCommon.SMS_SCAN_MED)
  TrackPidAndTechnique(l_0_1.ppid, "T1562.001", "mptamper_av")
end
return mp.LOWFI
