-- Threat: !InfrastructureShared
-- Name: 2bd749091b4b
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if string.sub(l_0_1, -5, -1) == ",XL55" or string.sub(l_0_1, -6, -1) == ", XL55" then
  if l_0_0 ~= nil then
    MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
  end
  return mp.INFECTED
end
return mp.CLEAN
