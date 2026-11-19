-- Threat: !InfrastructureShared
-- Name: 15eb33c8cf6ce
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p1
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if contains(l_0_1, {
  "\\node_modules\\",
  "/node_modules/",
  "\\.openclaw\\skills\\",
  "\\openclaw-restart-",
  "\\node-compile-cache\\"
}) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\temp\\",
  "\\tmp\\",
  "\\appdata\\local\\temp\\",
  "\\appdata\\roaming\\",
  "\\downloads\\",
  "\\startup\\",
  "\\start menu\\programs\\startup\\",
  "\\system32\\",
  "\\syswow64\\",
  "\\public\\",
  "\\programdata\\"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl")
add_parents()
return mp.INFECTED
