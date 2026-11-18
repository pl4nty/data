-- Threat: !InfrastructureShared
-- Name: 5bb366325a85
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
