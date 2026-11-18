-- Threat: !InfrastructureShared
-- Name: 77b381080eb8
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 ~= nil then
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
