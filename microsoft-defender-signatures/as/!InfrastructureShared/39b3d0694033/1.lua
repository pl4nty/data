-- Threat: !InfrastructureShared
-- Name: 39b3d0694033
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_2 = string.find(l_0_1[2], ",", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_1[2], 1, l_0_2 - 1)
mp.ReportLowfi(l_0_3, 503412062)
return mp.INFECTED
