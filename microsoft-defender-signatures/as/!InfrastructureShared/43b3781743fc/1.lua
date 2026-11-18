-- Threat: !InfrastructureShared
-- Name: 43b3781743fc
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
if StringEndsWith(l_0_1, "\\program files (x86)\\windowsinstallationassistant\\getcurrentdeploy.dll") or StringEndsWith(l_0_1, "\\program files\\windowsinstallationassistant\\getcurrentdeploy.dll") then
  return mp.CLEAN
end
local l_0_2 = mp.IsKnownFriendlyFile(l_0_0, false, false)
if l_0_2 == true then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = MpCommon.PathToWin32Path(l_0_3)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = sysio.GetPEVersionInfo(l_0_3)
if l_0_4 == nil or l_0_4.OriginalFilename == nil then
  return mp.CLEAN
end
if string.lower(l_0_4.OriginalFilename) ~= "getcurrentrollback.exe" then
  return mp.CLEAN
end
local l_0_5 = mp.IsKnownFriendlyFile(l_0_3, true, true)
if not l_0_5 then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
mp.ReportLowfi(l_0_0, 2924828722)
local l_0_6 = string.format("loadedModule=%s", l_0_0)
bm.add_related_string("ReferencePath", l_0_6, bm.RelatedStringBMReport)
return mp.INFECTED
