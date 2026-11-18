-- Threat: !InfrastructureShared
-- Name: d9d77bd1df50
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.INFECTED
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.INFECTED
end
local l_0_2 = l_0_1:match("[%-][oO]%s+\"(.-)\"")
if l_0_2 == nil then
  return mp.INFECTED
end
mp.ReportLowfi(l_0_2, 1206539489)
return mp.INFECTED
