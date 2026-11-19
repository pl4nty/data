-- Threat: !InfrastructureShared
-- Name: 1bd7d00d4251
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.match(string.lower(l_0_1), "makecab.*%s+[\"]?([^%s\"]+)[\"]?%s+[\"]?([^%s\"]+)[\"]?")
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "^%a:\\") == nil then
  return mp.INFECTED
end
if string.find(l_0_3, "\\[^\\:]+:[^\\:]+$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
