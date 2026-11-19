-- Threat: !InfrastructureShared
-- Name: f0b303f7ddd2
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_1 = this_sigattrlog[2].utf8p1
end
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
if string.lower(l_0_0) == string.lower(l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
