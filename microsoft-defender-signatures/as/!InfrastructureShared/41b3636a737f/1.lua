-- Threat: !InfrastructureShared
-- Name: 41b3636a737f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
