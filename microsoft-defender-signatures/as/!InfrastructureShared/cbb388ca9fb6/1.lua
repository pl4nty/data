-- Threat: !InfrastructureShared
-- Name: cbb388ca9fb6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux(l_0_0, "remote_file_created_taint") then
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
