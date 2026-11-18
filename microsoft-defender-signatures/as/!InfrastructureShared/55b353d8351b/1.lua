-- Threat: !InfrastructureShared
-- Name: 55b353d8351b
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].timestamp
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].timestamp
end
if this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].timestamp
  l_0_2 = this_sigattrlog[4].utf8p1
end
l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_2))
if l_0_2 == nil or string.find(l_0_2, "cachev..dat$", 1, false) or string.find(l_0_2, ".cache$", 1, false) then
  return mp.CLEAN
end
if l_0_0 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
