-- Threat: !InfrastructureShared
-- Name: 4db356f25542
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil and string.find(l_0_0, "--lm", 1, true) and string.find(l_0_0, "--nt", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
