-- Threat: !InfrastructureShared
-- Name: 131b30fd3428a
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p1
end
if this_sigattrlog[12].matched then
  l_0_1 = this_sigattrlog[12].utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil and l_0_0 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
