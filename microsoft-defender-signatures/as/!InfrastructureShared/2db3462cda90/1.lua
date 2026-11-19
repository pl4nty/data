-- Threat: !InfrastructureShared
-- Name: 2db3462cda90
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables("%temp%"))
if string.find(l_0_0, ",", 1, true) and (string.find(l_0_0, "%tmp%", 1, true) or string.find(l_0_0, "%temp%", 1, true) or string.find(l_0_0, "\\temp\\", 1, true) or string.find(l_0_0, l_0_1, 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
