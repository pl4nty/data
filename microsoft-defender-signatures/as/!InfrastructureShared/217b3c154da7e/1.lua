-- Threat: !InfrastructureShared
-- Name: 217b3c154da7e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p1
else
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.match(l_0_0, "\\([^\\]+)$")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  [".dotm"] = true,
  [".xlsm"] = true,
  [".xltm"] = true,
  [".pptm"] = true,
  [".potm"] = true,
  [".sldm"] = true,
  [".xlam"] = true,
  [".ppam"] = true
}
local l_0_3 = string.match(l_0_1, "%.[^%.]+$")
if l_0_3 == nil or not l_0_2[l_0_3] then
  return mp.CLEAN
end
if string.find(l_0_1, "$normal.dot", 1, true) or string.find(l_0_1, "normal.dotm", 1, true) or string.find(l_0_1, "buildingblocks.dotx", 1, true) or string.sub(l_0_1, 1, 4) == "~wrd" or string.sub(l_0_1, 1, 2) == "~$" or string.sub(l_0_1, 1, 4) == "~tmp" or l_0_1 == "thumbs.db" or l_0_1 == "desktop.ini" or string.sub(l_0_1, -4) == ".tmp" then
  return mp.CLEAN
end
local l_0_4 = bm.get_imagepath()
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
local l_0_6 = string.match(l_0_5, "\\([^\\]+)$")
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = {
  ["winword.exe"] = true,
  ["excel.exe"] = true,
  ["powerpnt.exe"] = true,
  ["outlook.exe"] = true,
  ["msaccess.exe"] = true,
  ["onenote.exe"] = true,
  ["officeclicktorun.exe"] = true,
  ["officec2rclient.exe"] = true,
  ["msiexec.exe"] = true,
  ["trustedinstaller.exe"] = true,
  ["tiworker.exe"] = true,
  ["msmpeng.exe"] = true
}
if l_0_7[l_0_6] then
  return mp.CLEAN
end
local l_0_8 = {
  ["ccmexec.exe"] = true,
  ["sccmclicmd.exe"] = true,
  ["ccmsetup.exe"] = true,
  ["intunemanagementextension.exe"] = true,
  ["airwatchagent.exe"] = true,
  ["svchost.exe"] = true,
  ["wusa.exe"] = true,
  ["dism.exe"] = true,
  ["robocopy.exe"] = true,
  ["gpscript.exe"] = true
}
if l_0_8[l_0_6] then
  return mp.CLEAN
end
if l_0_6 == "setup.exe" and string.find(l_0_5, "microsoft office", 1, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_5, true, false) then
  return mp.CLEAN
end
local l_0_9 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if not isnull(l_0_9) then
  l_0_9 = string.lower(l_0_9)
else
  l_0_9 = l_0_0
end
if mp.IsKnownFriendlyFile(l_0_9, true, false) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_9) then
  bm.add_related_file(l_0_9)
  bm.add_threat_file(l_0_9)
end
bm.add_related_string("DroppedTemplate", l_0_9, bm.RelatedStringBMReport)
bm.add_related_string("DroppingProcess", l_0_5, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1137", "office_application_startup")
return mp.INFECTED
