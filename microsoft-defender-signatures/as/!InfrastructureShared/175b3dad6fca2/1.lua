-- Threat: !InfrastructureShared
-- Name: 175b3dad6fca2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ".tmp",
  ".txt",
  ".doc",
  ".cfg"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
bm.add_related_string("Office_SusCreate_C", l_0_0, bm.RelatedStringBMReport)
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
