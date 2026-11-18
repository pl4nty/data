-- Threat: !InfrastructureShared
-- Name: 102b3e484d4bf
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
  if l_0_0 ~= nil and l_0_0 ~= "" and sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
