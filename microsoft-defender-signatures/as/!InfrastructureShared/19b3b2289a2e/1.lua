-- Threat: !InfrastructureShared
-- Name: 19b3b2289a2e
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  bm.add_related_file(this_sigattrlog[1].utf8p1)
  bm.add_related_file(this_sigattrlog[1].utf8p2)
end
return mp.INFECTED
