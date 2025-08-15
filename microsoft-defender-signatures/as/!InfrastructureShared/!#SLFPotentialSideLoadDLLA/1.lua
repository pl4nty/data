-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPotentialSideLoadDLLA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA
local l_0_1 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).Size
local l_0_2 = l_0_0 + l_0_1
local l_0_3, l_0_4 = (pe.get_exports)()
if l_0_3 == 0 or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = {}
local l_0_6 = {}
for l_0_10 = 1, l_0_3 do
  local l_0_11 = (pe.mmap_string_rva)((l_0_4[l_0_10]).namerva, 64)
  if l_0_11 and l_0_0 <= (l_0_4[l_0_10]).rva and (l_0_4[l_0_10]).rva <= l_0_2 then
    (table.insert)(l_0_5, l_0_11)
  else
    if l_0_11 then
      (table.insert)(l_0_6, l_0_11)
    end
  end
end
if #l_0_5 == 0 then
  return mp.CLEAN
end
local l_0_12 = nil
if (mp.get_mpattributevalue)("MpPureForwardedExportsAll") then
  l_0_12 = "MpPureForwardedExportsAll"
else
  if (mp.get_mpattributevalue)("MpPureForwardedExportsPresent") then
    l_0_12 = "MpPureForwardedExportsPresent"
  else
    if (mp.get_mpattributevalue)("MpForwardedExportsPresent") then
      l_0_12 = "MpForwardedExportsPresent"
    else
      return mp.CLEAN
    end
  end
end
local l_0_13 = nil
if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") > 0 then
  l_0_13 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget"))[1]
else
  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    l_0_13 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget"))[1]
  else
    l_0_13 = "ForwardedExportsTarget=FailedExtraction"
  end
end
l_0_13 = (string.match)(l_0_13, "ForwardedExports(.+)")
local l_0_14 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_14 then
  return mp.CLEAN
end
local l_0_15 = "PotentialSideLoadExports"
local l_0_16 = (string.format)("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s", l_0_3, #l_0_5, #l_0_6, l_0_12, l_0_13, (table.concat)(l_0_5, ","), (table.concat)(l_0_6, ","))
;
(mp.set_mpattribute)(l_0_15 .. "!" .. l_0_16)
AppendToRollingQueue(l_0_15, l_0_14, l_0_16)
return mp.INFECTED

