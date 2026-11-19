-- Threat: !InfrastructureShared
-- Name: 31dd7360df9bc
-- Type: 21
-- Includes: HstrLuaLib, TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
  TrackPidAndTechnique(l_0_0.ppid, "T1562.001", "mptamper_av")
end
if not isTamperProtectionOn() then
  return mp.LOWFI
end
return mp.INFECTED
