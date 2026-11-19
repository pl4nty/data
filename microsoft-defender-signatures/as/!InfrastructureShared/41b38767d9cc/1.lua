-- Threat: !InfrastructureShared
-- Name: 41b38767d9cc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "teamviewer", 1, true) or string.find(string.lower(l_0_0), "\\steam", 1, true) or string.find(string.lower(l_0_0), "torrent.exe", 1, true) or string.find(string.lower(l_0_0), "teams", 1, true) or string.find(string.lower(l_0_0), "atmgr.exe", 1, true) or string.find(string.lower(l_0_0), "java.exe", 1, true) or string.find(string.lower(l_0_0), "photoshop.exe", 1, true) or string.find(string.lower(l_0_0), "geforcenowstreamer.exe", 1, true) or string.find(string.lower(l_0_0), "bomgar-scc.exe", 1, true) or string.find(string.lower(l_0_0), "bomgar-rep.exe", 1, true) or string.find(string.lower(l_0_0), "l2dotnetlauncher.exe", 1, true) or string.find(string.lower(l_0_0), "g2mcomm.exe", 1, true) or string.find(string.lower(l_0_0), "explorer.exe", 1, true) or string.find(string.lower(l_0_0), "youdaodict.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1, l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_1 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1))
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1))
end
if l_0_2 ~= nil and l_0_1 ~= nil and string.find(l_0_2, l_0_1, 1, true) and IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
