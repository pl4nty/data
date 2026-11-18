-- Threat: !InfrastructureShared
-- Name: 73d70ae17404
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4 = string.match(l_0_2, "(\\windows\\system32\\)([%w%p%c]+)")
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "~1:", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
if string.find(l_0_4, ".", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_5, l_0_6 = string.gsub(l_0_3, "\\", "")
if l_0_6 ~= 3 then
  return mp.CLEAN
end
return mp.INFECTED
