-- Threat: !InfrastructureShared
-- Name: 6fd79ee0213d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
l_0_2 = l_0_2:gsub("%s", "")
if l_0_2:match("%-usebasicparsing%)#pressenter$") then
  return mp.INFECTED
end
return mp.CLEAN
