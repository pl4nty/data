-- Threat: !InfrastructureShared
-- Name: 8ab3d268e983
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = string.lower(string.sub(l_0_0, -4))
  if l_0_1 == ".cmd" then
    return mp.INFECTED
  end
end
return mp.CLEAN
