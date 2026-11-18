-- Threat: !InfrastructureShared
-- Name: 195b35925b9a4
-- Type: 21

local l_0_0 = this_sigattrlog[3].utf8p2
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
