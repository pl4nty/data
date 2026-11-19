-- Threat: !InfrastructureShared
-- Name: 1aeb30d0440cd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
else
  return mp.CLEAN
end
if isTainted(l_0_0, "remote_file_created_taint") or isTainted(l_0_0, "masqueraded_file_extension_taint") then
  bm.add_related_file(l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
