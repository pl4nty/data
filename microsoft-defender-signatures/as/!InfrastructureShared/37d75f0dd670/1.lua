-- Threat: !InfrastructureShared
-- Name: 37d75f0dd670
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "^", 1, true) ~= nil then
  l_0_1 = string.gsub(l_0_1, "%^", "")
end
if string.find(l_0_1, "pushd \\", 1, true) ~= nil and string.find(l_0_1, " & rundll32", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
