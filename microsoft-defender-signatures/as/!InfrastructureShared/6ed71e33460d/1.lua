-- Threat: !InfrastructureShared
-- Name: 6ed71e33460d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_ONCE)
return mp.INFECTED
