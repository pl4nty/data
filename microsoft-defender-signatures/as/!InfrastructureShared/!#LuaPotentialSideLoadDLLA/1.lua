-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPotentialSideLoadDLLA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if (string.find)(l_0_1, "\\windows\\system32", 1, true) or (string.find)(l_0_1, "\\windows\\syswow64", 1, true) or (string.find)(l_0_1, "program files", 1, true) or (string.find)(l_0_1, "\\windows\\winsxs", 1, true) or (string.find)(l_0_1, "\\windows defender\\platform", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilesize)()
if not l_0_2 or l_0_2 < 256 then
  return mp.CLEAN
end
local l_0_3 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA
local l_0_4 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).Size
local l_0_5 = l_0_3 + l_0_4
local l_0_6, l_0_7 = (pe.get_exports)()
if l_0_6 == 0 or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8 = {}
local l_0_9 = {}
for l_0_13 = 1, l_0_6 do
  local l_0_14 = (pe.mmap_string_rva)((l_0_7[l_0_13]).namerva, 64)
  if l_0_14 and l_0_3 <= (l_0_7[l_0_13]).rva and (l_0_7[l_0_13]).rva <= l_0_5 then
    (table.insert)(l_0_8, l_0_14)
  else
    if l_0_14 then
      (table.insert)(l_0_9, l_0_14)
    end
  end
end
if #l_0_8 == 0 then
  return mp.CLEAN
end
local l_0_15 = nil
if (mp.get_mpattributevalue)("MpPureForwardedExportsAll") then
  l_0_15 = "MpPureForwardedExportsAll"
else
  if (mp.get_mpattributevalue)("MpPureForwardedExportsPresent") then
    l_0_15 = "MpPureForwardedExportsPresent"
  else
    if (mp.get_mpattributevalue)("MpForwardedExportsPresent") then
      l_0_15 = "MpForwardedExportsPresent"
    else
      return mp.CLEAN
    end
  end
end
local l_0_16 = nil
if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") > 0 then
  l_0_16 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget"))[1]
else
  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    l_0_16 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget"))[1]
  else
    l_0_16 = "ForwardedExportsTarget=FailedExtraction"
  end
end
l_0_16 = (string.match)(l_0_16, "ForwardedExports(.+)")
local l_0_17 = "PotentialSideLoadExports"
local l_0_18 = (string.format)("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s__Size=%d", l_0_6, #l_0_8, #l_0_9, l_0_15, l_0_16, (table.concat)(l_0_8, ","), (table.concat)(l_0_9, ","), l_0_2)
AppendToRollingQueue(l_0_17, l_0_1, l_0_18)
;
(mp.set_mpattribute)((string.format)("%s=%s", l_0_17, l_0_18))
;
(MpCommon.SetOriginalFileName)(l_0_0, (string.format)("BM_%s", l_0_17))
local l_0_19 = (MpCommon.PathToWin32Path)((string.match)(l_0_16, "=(.+)") or "")
if l_0_19 then
  (MpCommon.SetOriginalFileName)(l_0_19, (string.format)("BM_%s_Target", l_0_17))
end
return mp.INFECTED

