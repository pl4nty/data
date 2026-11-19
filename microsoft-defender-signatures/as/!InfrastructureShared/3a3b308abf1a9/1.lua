-- Threat: !InfrastructureShared
-- Name: 3a3b308abf1a9
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0
if this_sigattrlog[15].matched and this_sigattrlog[15].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[15].utf8p1
end
local l_0_1 = bm.get_imagepath()
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
l_0_0 = string.lower(l_0_0)
if l_0_0 == l_0_1 then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_1, 3600) ~= false then
  return mp.CLEAN
end
if checkFileLastWriteTime(l_0_0, 3600) ~= false then
  return mp.CLEAN
end
if not mp.IsKnownFriendlyFile(l_0_1, true, true) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_0, true, true) then
  return mp.CLEAN
end
local l_0_2, l_0_3
local l_0_4, l_0_5 = mp.GetMotwHostUrlForFile(l_0_0)
local l_0_6, l_0_7 = mp.GetMotwHostUrlForFile(l_0_1)
local l_0_8, l_0_9 = mp.GetMotwReferrerUrlForFile(l_0_0)
local l_0_10, l_0_11 = mp.GetMotwReferrerUrlForFile(l_0_1)
local l_0_12, l_0_13 = mp.GetMotwZoneForFile(l_0_0)
local l_0_14, l_0_15 = mp.GetMotwZoneForFile(l_0_1)
local l_0_16 = mp.IsKnownFriendlyFile(l_0_0, true, false) or ""
local l_0_17 = mp.IsKnownFriendlyFile(l_0_1, true, false) or ""
if l_0_9 then
  l_0_2 = mp.GetMotwHostUrlForFile(l_0_9)
end
if l_0_11 then
  l_0_3 = mp.GetMotwHostUrlForFile(l_0_11)
end
local l_0_18 = {}
l_0_18.dll_motw = l_0_5 or ""
l_0_18.proc_motw = l_0_7 or ""
l_0_18.dll_zone = l_0_13 or ""
l_0_18.proc_zone = l_0_15 or ""
l_0_18.procPath = l_0_1 or ""
l_0_18.dllPath = l_0_0 or ""
l_0_18.proc_refUrl = l_0_11 or ""
l_0_18.dll_refUrl = l_0_9 or ""
l_0_18.dll_friendly = l_0_16 or ""
l_0_18.exe_friendly = l_0_17 or ""
l_0_18.dll_motw_refer = l_0_2 or ""
l_0_18.proc_motw_refer = l_0_3 or ""
l_0_18 = safeJsonSerialize(l_0_18)
bm.add_related_string("PotentialSideLoad_info", l_0_18, bm.RelatedStringBMReport)
bm.trigger_sig("PotentialSideLoad", tostring(l_0_18))
if sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 263154785)
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
