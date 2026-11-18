-- Threat: !InfrastructureShared
-- Name: 181b37320844e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if l_0_0 == nil or #l_0_0 < 3 then
  return mp.CLEAN
end
if string.match(l_0_0, "/%.[^/]+$") then
  bm.add_related_file(l_0_0)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
