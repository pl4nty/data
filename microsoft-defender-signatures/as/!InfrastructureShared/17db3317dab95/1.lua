-- Threat: !InfrastructureShared
-- Name: 17db3317dab95
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if isTainted(l_0_0, "remote_file_created_taint") then
  reportRelatedBmHits()
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
