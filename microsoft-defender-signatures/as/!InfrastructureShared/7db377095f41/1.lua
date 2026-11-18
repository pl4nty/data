-- Threat: !InfrastructureShared
-- Name: 7db377095f41
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
end
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
end
if string.find(l_0_0, ":\\users\\", 1, true) then
  bm.add_threat_file(l_0_0)
  bm.add_threat_file(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
