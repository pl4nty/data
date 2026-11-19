-- Threat: !InfrastructureShared
-- Name: !#Lua:PotentialSideLoad.DLL.A
-- Type: 11
-- Includes: LuaFuncHelper
-- MpAttributes: BM_MZ_DLL & RPF:TopLevelFile & (BM_UnsignedDll | MpTrustCheck_NotDigitallySigned | !MpTrustCheck_ValidlySigned) & (MpPureForwardedExportsAll | MpPureForwardedExportsPresent | MpForwardedExportsPresent)

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename())
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  ["program files"] = true,
  ["program files (x86)"] = true,
  ["windows\\system32"] = true,
  ["windows\\syswow64"] = true,
  ["windows\\winsxs"] = true
}
local l_0_3, l_0_4 = l_0_1:match(":[/\\]((.-)[/\\].-)[/\\]")
if l_0_2[l_0_4 or ""] or l_0_2[l_0_3 or ""] or l_0_1:find(":\\programdata\\microsoft\\windows defender\\platform\\", 1, true) then
  return mp.CLEAN
end
local l_0_5 = mp.getfilesize()
if not l_0_5 or l_0_5 < 256 then
  return mp.CLEAN
end
local l_0_6 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].RVA
local l_0_7 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_EXPORT].Size
local l_0_8 = l_0_6 + l_0_7
local l_0_9, l_0_10 = pe.get_exports()
if l_0_9 == 0 or l_0_10 == nil then
  return mp.CLEAN
end
local l_0_11 = {}
local l_0_12 = {}
for l_0_13 = 1, l_0_9 do
  local l_0_14 = pe.mmap_string_rva(l_0_10[l_0_13].namerva, 64)
  if l_0_14 and l_0_6 <= l_0_10[l_0_13].rva and l_0_8 >= l_0_10[l_0_13].rva then
    table.insert(l_0_11, l_0_14)
  elseif l_0_14 then
    table.insert(l_0_12, l_0_14)
  end
end
if #l_0_11 == 0 then
  return mp.CLEAN
end
local l_0_15
if mp.get_mpattributevalue("MpPureForwardedExportsAll") then
  l_0_15 = "MpPureForwardedExportsAll"
elseif mp.get_mpattributevalue("MpPureForwardedExportsPresent") then
  l_0_15 = "MpPureForwardedExportsPresent"
elseif mp.get_mpattributevalue("MpForwardedExportsPresent") then
  l_0_15 = "MpForwardedExportsPresent"
else
  return mp.CLEAN
end
local l_0_16
if 0 < #mp.enum_mpattributesubstring("MpPureForwardedExportsTarget") then
  l_0_16 = mp.enum_mpattributesubstring("MpPureForwardedExportsTarget")[1]
elseif 0 < #mp.enum_mpattributesubstring("MpPureForwardedExportsMissingTarget") then
  l_0_16 = mp.enum_mpattributesubstring("MpPureForwardedExportsMissingTarget")[1]
else
  l_0_16 = "ForwardedExportsTarget=FailedExtraction"
end
l_0_16 = string.match(l_0_16, "ForwardedExports(.+)")
local l_0_17 = "PotentialSideLoadExports"
local l_0_18 = string.format("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s__Size=%d", l_0_9, #l_0_11, #l_0_12, l_0_15, l_0_16, table.concat(l_0_11, ","), table.concat(l_0_12, ","), l_0_5)
AppendToRollingQueue(l_0_17, l_0_1, l_0_18)
mp.set_mpattribute(string.format("%s=%s", l_0_17, l_0_18))
MpCommon.SetOriginalFileName(l_0_0, string.format("BM_%s", l_0_17))
local l_0_19 = MpCommon.PathToWin32Path(string.match(l_0_16, "=(.+)") or "")
if l_0_19 then
  MpCommon.SetOriginalFileName(l_0_19, string.format("BM_%s_Target", l_0_17))
end
return mp.INFECTED
