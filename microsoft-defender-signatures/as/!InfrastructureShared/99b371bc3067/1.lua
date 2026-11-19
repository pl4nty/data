-- Threat: !InfrastructureShared
-- Name: 99b371bc3067
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
