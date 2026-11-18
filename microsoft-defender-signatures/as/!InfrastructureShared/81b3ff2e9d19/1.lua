-- Threat: !InfrastructureShared
-- Name: 81b3ff2e9d19
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
