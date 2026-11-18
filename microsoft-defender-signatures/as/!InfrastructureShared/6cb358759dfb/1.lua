-- Threat: !InfrastructureShared
-- Name: 6cb358759dfb
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
local l_0_5 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_5.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED
