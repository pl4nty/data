-- Threat: !InfrastructureShared
-- Name: 29d7aa4cfaa1
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1:match("([^\\]+)$"))
if l_0_2 ~= nil and l_0_2 ~= "wscript.exe" and l_0_2 ~= "cscript.exe" and versioning.GetCloudBlockLevel() >= 4 then
  return mp.INFECTED
end
return mp.LOWFI
