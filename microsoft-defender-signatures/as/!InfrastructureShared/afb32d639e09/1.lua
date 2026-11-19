-- Threat: !InfrastructureShared
-- Name: afb32d639e09
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
if string.find(l_0_0, "\\data.safe.bin", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
