-- Threat: !InfrastructureShared
-- Name: 65b3213d7239
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
  if string.find(l_0_0, "/format:", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
