-- Threat: !InfrastructureShared
-- Name: 66d7ed71deff
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or string.find(l_0_1, "stop", 1, true) == nil and string.find(l_0_1, "disabled", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") == "su64.exe" or l_0_3:match("([^\\]+)$") == "su32.exe" then
  return mp.INFECTED
end
return mp.CLEAN
