-- Threat: !InfrastructureShared
-- Name: 29d7ddcddfa5
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 < 10 then
  return mp.CLEAN
end
if string.find(l_0_1, "nanodump", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
