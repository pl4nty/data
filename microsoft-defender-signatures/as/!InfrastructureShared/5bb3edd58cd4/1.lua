-- Threat: !InfrastructureShared
-- Name: 5bb3edd58cd4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_0, 3672992343)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
