-- Threat: !InfrastructureShared
-- Name: 141b3295391ad
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p2)
end
if l_0_0 and this_sigattrlog[2].matched and string.find(l_0_0, "copy-as-is", 1, true) and string.find(l_0_0, "/usr/share/rear", 1, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[9].matched and this_sigattrlog[9].wp2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[9].utf8p2)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].wp2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[10].utf8p2)
end
if l_0_1 and (string.match(l_0_1, "%d+%.%d+%.%d+%.%d+") or string.find(l_0_1, "bit.ly", 1, true) or string.find(l_0_1, "goo.gl", 1, true) or string.find(l_0_1, "telegram", 1, true) or string.find(l_0_1, "dropbox", 1, true) or string.find(l_0_1, "api.", 1, true) or string.find(l_0_1, "ftp", 1, true)) then
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
  addRelatedProcess()
  reportRelatedBmHits()
  RemediateProcessTreeForLinux()
  return mp.INFECTED
end
return mp.CLEAN
