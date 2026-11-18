-- Threat: !InfrastructureShared
-- Name: 2ebb34d500a31
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
  l_0_1 = this_sigattrlog[11].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
  l_0_1 = this_sigattrlog[12].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil and this_sigattrlog[13].matched and this_sigattrlog[13].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
  l_0_1 = this_sigattrlog[13].utf8p1
end
if l_0_0 and l_0_1 and l_0_0:lower() ~= l_0_1:lower() then
  return mp.CLEAN
end
l_0_0 = mp.ContextualExpandEnvironmentVariables(l_0_0)
local l_0_2 = {"cnmss"}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
bm.add_related_string("Office_SusCreate_A", l_0_0, bm.RelatedStringBMReport)
local l_0_3 = {
  "winword.exe",
  "excel.exe",
  "powerpnt.exe",
  "mspub.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
