-- Threat: !InfrastructureShared
-- Name: 2db34ef29902
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 and isTainted(l_0_0, "remote_file_created_taint") then
  bm.add_related_file(l_0_0)
  taint(l_0_0, "remote_file_chmodexec", 3600)
  return mp.INFECTED
end
return mp.CLEAN
