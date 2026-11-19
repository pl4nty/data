-- Threat: !InfrastructureShared
-- Name: 554b33d6c086f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if not isnull(this_sigattrlog[14].utf8p1) then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif not isnull(this_sigattrlog[15].utf8p1) then
  l_0_0 = this_sigattrlog[15].utf8p1
else
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if isnull(l_0_1) or not string.find(string.lower(l_0_1), "c:", 1, true) then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue("PotentialSideLoadExports", string.lower(l_0_1))
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11 = l_0_2:match("ExpCount=(%d+)__FwdExpCount=(%d+)__LocalExpCount=(%d+)__ExpType=(.-)%.(.-)=(.-)__FwdExpNames=(.-)__LocalExpNames=(.-)__Size=(%d+)")
if isnull(l_0_8) or l_0_8 == "FailedExtraction" then
  return mp.CLEAN
end
local l_0_12 = {
  ["msvcp140.dll"] = true,
  ["msvcrt.dll"] = true,
  ["ucrtbase.dll"] = true,
  ["vcruntime140.dll"] = true,
  ["vcruntime140_1.dll"] = true
}
if l_0_12[string.lower(l_0_8)] then
  return mp.CLEAN
end
if string.lower(l_0_8) == "libomp.dll" and string.find(string.lower(l_0_1), "libiomp5md.dll$") then
  return mp.CLEAN
end
local l_0_13 = bm.get_imagepath()
if isnull(l_0_13) then
  return mp.CLEAN
end
l_0_13 = MpCommon.PathToWin32Path(l_0_13)
if isnull(l_0_13) then
  return mp.CLEAN
end
l_0_13 = mp.ContextualExpandEnvironmentVariables(l_0_13)
if isnull(l_0_13) or not mp.IsKnownFriendlyFile(l_0_13, true, false) then
  return mp.CLEAN
end
local l_0_14, l_0_15 = l_0_1:match("^(.+)\\([^\\]+)$")
local l_0_16, l_0_17 = l_0_13:match("^(.+)\\([^\\]+)$")
if not (l_0_14 and l_0_16) or not string.find(string.lower(l_0_14), string.lower(l_0_16), 1, true) then
  return mp.CLEAN
end
l_0_15 = l_0_15 or l_0_1
l_0_17 = l_0_17 or l_0_13
local l_0_18
if string.find(l_0_8, ":", 1, true) then
  l_0_18 = MpCommon.PathToWin32Path(l_0_8)
else
  l_0_18 = l_0_14 .. "\\" .. l_0_8
end
if isnull(l_0_18) or not sysio.IsFileExists(l_0_18) then
  return mp.CLEAN
end
local l_0_19 = {
  ["SketchUp.exe"] = true,
  ["sketchup_webhelper.exe"] = true
}
if l_0_15 == "version.dll" and l_0_18 == "C:\\Windows\\System32\\version.dll" and (l_0_17 == "Balatro.exe" or l_0_19[l_0_17] and string.lower(versioning.GetOrgID()) == "306d1007-b764-44a3-b8af-95f822d87ac0") then
  return mp.CLEAN
end
local l_0_20 = 900
local l_0_21 = MpCommon.GetCurrentTimeT()
if isnull(l_0_21) or l_0_21 == 0 then
  return mp.CLEAN
end
local l_0_22 = sysio.GetFileLastWriteTime(l_0_13)
if isnull(l_0_22) or l_0_22 == 0 then
  return mp.CLEAN
end
local l_0_23 = sysio.GetFileLastWriteTime(l_0_1)
if isnull(l_0_23) or l_0_23 == 0 then
  return mp.CLEAN
end
if l_0_20 < l_0_21 - l_0_23 / 10000000 - 11644473600 then
  return mp.CLEAN
end
local l_0_24 = sysio.GetFileAttributes(l_0_1)
local l_0_26 = l_0_24 ~= 4294967295 and mp.bitand(l_0_24, 2) == 2
bm.add_threat_file(l_0_1)
bm.add_related_file(l_0_18)
local l_0_27 = safeJsonSerialize({
  Process = l_0_13,
  DLL = l_0_1,
  DLLHidden = l_0_26,
  ProcessCreateTime = l_0_22,
  DLLCreateTime = l_0_23,
  CurrentTime = l_0_21,
  DLLSize = l_0_11,
  FwdDLL = l_0_18,
  ExpCount = l_0_3,
  FwdExpCount = l_0_4,
  LocalExpCount = l_0_5,
  FwdType = l_0_6,
  FwdStatus = l_0_7,
  FwdExp = l_0_9,
  LocalExp = l_0_10
})
bm.add_related_string("DLLProxy_Metadata", l_0_27, bm.RelatedStringBMReport)
return mp.INFECTED
