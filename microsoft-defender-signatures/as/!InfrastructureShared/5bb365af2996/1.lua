-- Threat: !InfrastructureShared
-- Name: 5bb365af2996
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p1
end
l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if not string.find(l_0_0, "\\microsoft\\onedrive\\", 1, true) then
  return mp.INFECTED
end
l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_1))
if not string.find(l_0_1, "\\onedrive\\[%d+.]+", 1, true) then
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
