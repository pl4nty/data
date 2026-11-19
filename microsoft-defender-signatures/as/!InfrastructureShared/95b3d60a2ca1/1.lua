-- Threat: !InfrastructureShared
-- Name: 95b3d60a2ca1
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
local l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if l_0_1 ~= nil and string.len(l_0_1) > 7 and ((string.find(l_0_1, "\\microsoft\\onedrive\\", 1, true) or string.find(l_0_1, "\\microsoft onedrive\\", 1, true)) and string.find(l_0_1, "filesyncshell64.dll", 1, true) or string.find(l_0_1, "\\microsoft\\teams\\", 1, true) and string.find(l_0_1, "userenv.dll", 1, true)) then
  bm.add_related_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
