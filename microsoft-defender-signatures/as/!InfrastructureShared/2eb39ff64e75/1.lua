-- Threat: !InfrastructureShared
-- Name: 2eb39ff64e75
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
  bm.add_threat_file(l_0_3)
end
return mp.INFECTED
