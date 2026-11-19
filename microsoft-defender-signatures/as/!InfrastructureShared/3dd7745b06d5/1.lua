-- Threat: !InfrastructureShared
-- Name: 3dd7745b06d5
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
if 255 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = string.find(l_0_1, "(", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_1, l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.gsub(l_0_3, "\"", "")
l_0_4 = string.gsub(l_0_4, ",", "")
if string.find(l_0_4, "finger", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
