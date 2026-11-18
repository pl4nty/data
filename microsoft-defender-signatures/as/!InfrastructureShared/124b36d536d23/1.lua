-- Threat: !InfrastructureShared
-- Name: 124b36d536d23
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1:lower()
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[6].utf8p2:lower()
end
if l_0_1 == nil or l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("Office_SusCreate_D", l_0_0, bm.RelatedStringBMReport)
local l_0_2 = GetFileName(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  bm.add_threat_file(l_0_0)
end
return mp.INFECTED
