-- Threat: !InfrastructureShared
-- Name: 120b3ca039277
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].p2 ~= nil then
  l_0_0 = normalize_unicode(this_sigattrlog[1].p2)
end
if l_0_0 == nil or #l_0_0 <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "node", 1, true) ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
