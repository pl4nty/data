-- Threat: !InfrastructureShared
-- Name: 120b32ad1c016
-- Type: 21

if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  bm.add_related_file(this_sigattrlog[10].utf8p2)
end
return mp.INFECTED
