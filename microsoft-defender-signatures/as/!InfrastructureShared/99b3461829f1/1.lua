-- Threat: !InfrastructureShared
-- Name: 99b3461829f1
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
