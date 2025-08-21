-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPotentialSideLoadDLLA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).RVA
local l_0_2 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_EXPORT]).Size
local l_0_3 = l_0_1 + l_0_2
local l_0_4, l_0_5 = (pe.get_exports)()
if l_0_4 == 0 or l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = {}
local l_0_7 = {}
for l_0_11 = 1, l_0_4 do
  local l_0_12 = (pe.mmap_string_rva)((l_0_5[l_0_11]).namerva, 64)
  if l_0_12 and l_0_1 <= (l_0_5[l_0_11]).rva and (l_0_5[l_0_11]).rva <= l_0_3 then
    (table.insert)(l_0_6, l_0_12)
  else
    if l_0_12 then
      (table.insert)(l_0_7, l_0_12)
    end
  end
end
if #l_0_6 == 0 then
  return mp.CLEAN
end
local l_0_13 = nil
if (mp.get_mpattributevalue)("MpPureForwardedExportsAll") then
  l_0_13 = "MpPureForwardedExportsAll"
else
  if (mp.get_mpattributevalue)("MpPureForwardedExportsPresent") then
    l_0_13 = "MpPureForwardedExportsPresent"
  else
    if (mp.get_mpattributevalue)("MpForwardedExportsPresent") then
      l_0_13 = "MpForwardedExportsPresent"
    else
      return mp.CLEAN
    end
  end
end
local l_0_14 = nil
if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") > 0 then
  l_0_14 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget"))[1]
else
  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    l_0_14 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget"))[1]
  else
    l_0_14 = "ForwardedExportsTarget=FailedExtraction"
  end
end
l_0_14 = (string.match)(l_0_14, "ForwardedExports(.+)")
local l_0_15 = "PotentialSideLoadExports"
local l_0_16 = (string.format)("ExpCount=%d__FwdExpCount=%d__LocalExpCount=%d__ExpType=%s.%s__FwdExpNames=%s__LocalExpNames=%s", l_0_4, #l_0_6, #l_0_7, l_0_13, l_0_14, (table.concat)(l_0_6, ","), (table.concat)(l_0_7, ","))
AppendToRollingQueue(l_0_15, l_0_0, l_0_16)
return mp.INFECTED

