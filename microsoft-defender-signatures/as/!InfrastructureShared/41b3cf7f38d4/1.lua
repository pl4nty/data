-- Threat: !InfrastructureShared
-- Name: 41b3cf7f38d4
-- Type: 21

local l_0_0 = this_sigattrlog[3].utf8p1
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
