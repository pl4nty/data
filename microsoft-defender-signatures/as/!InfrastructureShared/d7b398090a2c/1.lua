-- Threat: !InfrastructureShared
-- Name: d7b398090a2c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if isnull(this_sigattrlog[4]) or isnull(this_sigattrlog[4].utf8p2) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = string.match(this_sigattrlog[4].utf8p2, "Config=(.-);Assembly=(.+)")
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_1 = mp.ContextualExpandEnvironmentVariables(MpCommon.PathToWin32Path(l_0_1) or "")
if isnull(l_0_1) or mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = l_0_1:lower()
local l_0_3 = string.match(l_0_1, "..*[\\/](.+)")
if not (not l_0_2:find("..-:\\windows\\") or l_0_2:find("\\temp\\", 1, true)) or l_0_2:find("jetbrains.*\\jetbrains%.platform%.(componentmodel|core|interop|shell|uiinteractive%.shell|util)%.dll$") or l_0_2:find("jetbrains.*\\(jetbrains-toolbox%.exe|jetbrains%.platform%.installer%.exe|structuredlogger%.dll|taskrunner%.exe%.config)$") or l_0_2:find("\\nextgen%.shared%.subprocess%.manager%.dll$") or l_0_1:find("msbuildstructuredlogviewer.*\\StructuredLogger.dll$") or l_0_2:find("\\swd\\ncflite\\nedbank.ncf.sdk.startup.dll") or l_0_2:find("\\program files\\", 1, true) or l_0_2:find("\\program files (x86)\\", 1, true) or l_0_2:find("\\solarwinds\\", 1, true) then
  return mp.CLEAN
end
local l_0_4 = bm.get_imagepath()
if isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = MpCommon.PathToWin32Path(l_0_4)
if isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
if isnull(l_0_4) or not mp.IsKnownFriendlyFile(l_0_4, true, false) then
  return mp.CLEAN
end
local l_0_5 = "SuspiciousAppDomainAssembly"
local l_0_6 = safeJsonSerialize({
  Source = l_0_5,
  ConfigPath = l_0_0,
  AssemblyPath = l_0_1,
  AssemblyName = l_0_3
})
bm.add_related_string(l_0_5, l_0_6, bm.RelatedStringBMReport)
bm.set_detection_string(l_0_6)
bm.add_threat_file(l_0_0)
bm.add_threat_file(l_0_1)
return mp.INFECTED
