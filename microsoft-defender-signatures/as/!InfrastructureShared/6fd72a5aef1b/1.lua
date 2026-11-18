-- Threat: !InfrastructureShared
-- Name: 6fd72a5aef1b
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.match(l_0_1, "\\([^\\]+)$")
if l_0_2 == nil or l_0_2 == "" or l_0_2 ~= "rundll32.exe" then
  return mp.CLEAN
end
local l_0_3 = versioning.GetOrgID()
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
return mp.INFECTED
