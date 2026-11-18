-- Threat: !InfrastructureShared
-- Name: 246b3f023f27b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not string.find(l_0_0, "\\resources\\app", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2 = {
  "\\update.exe",
  "\\squirrel.exe",
  "\\setup.exe",
  "\\installer.exe",
  "\\msiexec.exe",
  "\\windows\\system32\\msiexec.exe",
  "\\microsoft\\edge\\",
  "\\windowsapps\\",
  "\\node.exe",
  "\\npm.cmd",
  "\\npx.cmd",
  "\\yarn.cmd",
  "\\pnpm.cmd",
  "\\electron-builder",
  "\\windows\\installer\\",
  "\\loom setup ",
  "\\riotclientservices.exe",
  "\\blitz-delta-updater\\",
  "\\crashplanservice.exe",
  "\\crowdstrike\\",
  "\\csfalconservice.exe",
  "\\powerengage\\",
  "\\bitrix24\\",
  "\\myredvesthub"
}
if contains(l_0_1, l_0_2, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "\\system32\\svchost.exe", 1, true) and (string.find(l_0_0, "\\windowsapps\\", 1, true) or string.find(l_0_0, "\\program files\\", 1, true) or string.find(l_0_0, "\\program files (x86)\\", 1, true)) then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_0, "\\resources\\app", 1, true)
if l_0_3 and 1 < l_0_3 then
  local l_0_4 = string.sub(l_0_0, 1, l_0_3 - 1)
  if string.sub(l_0_1, 1, #l_0_4) == l_0_4 then
    return mp.CLEAN
  end
end
if mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
bm.add_related_string("electron_scriptjack_path", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("electron_scriptjack_proc", l_0_1, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1218.015", "ElectronScriptJack")
return mp.INFECTED
