-- Threat: !InfrastructureShared
-- Name: 3bd7c906a189
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.sub(l_0_1, -5, -1) == ",time" or string.sub(l_0_1, -6, -1) == ", time" then
  if l_0_0 ~= nil then
    MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
  end
  return mp.INFECTED
end
return mp.CLEAN
