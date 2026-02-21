-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3297cd8fc\1.luac 

-- params : ...
-- function num : 0
if isnull(this_sigattrlog[1]) or isnull((this_sigattrlog[1]).utf8p2) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (string.match)((this_sigattrlog[1]).utf8p2, "Config=(.-);Assembly=(.+)")
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)((MpCommon.PathToWin32Path)(l_0_1) or "")
if isnull(l_0_1) or (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = l_0_1:lower()
local l_0_3 = (string.match)(l_0_1, "..*[\\/](.+)")
-- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P3

if (l_0_2:find("..-:\\windows\\") and not l_0_2:find("\\temp\\", 1, true)) or l_0_1:find("msbuildstructuredlogviewer.*\\StructuredLogger.dll$") then
  return mp.CLEAN
end
local l_0_4 = (bm.get_imagepath)()
if isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
if isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = (mp.ContextualExpandEnvironmentVariables)(l_0_4)
if isnull(l_0_4) or not (mp.IsKnownFriendlyFile)(l_0_4, true, false) then
  return mp.CLEAN
end
local l_0_5 = "SuspiciousAppDomainAssembly"
local l_0_6 = safeJsonSerialize
local l_0_7 = {}
l_0_7.Source = l_0_5
l_0_7.ConfigPath = l_0_0
l_0_7.AssemblyPath = l_0_1
l_0_7.AssemblyName = l_0_3
l_0_6 = l_0_6(l_0_7)
l_0_7 = bm
l_0_7 = l_0_7.add_related_string
l_0_7(l_0_5, l_0_6, bm.RelatedStringBMReport)
l_0_7 = bm
l_0_7 = l_0_7.set_detection_string
l_0_7(l_0_6)
l_0_7 = bm
l_0_7 = l_0_7.add_related_file
l_0_7(l_0_0)
l_0_7 = bm
l_0_7 = l_0_7.add_related_file
l_0_7(l_0_1)
l_0_7 = mp
l_0_7 = l_0_7.INFECTED
return l_0_7

