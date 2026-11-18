-- Threat: !InfrastructureShared
-- Name: 24fb3f4797c26
-- Type: 21

local l_0_0
if this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].np2
  if l_0_0 ~= nil and mp.bitand(l_0_0, 42) == 42 then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.INFECTED
