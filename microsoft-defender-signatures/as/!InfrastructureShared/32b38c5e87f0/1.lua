-- Threat: !InfrastructureShared
-- Name: 32b38c5e87f0
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
