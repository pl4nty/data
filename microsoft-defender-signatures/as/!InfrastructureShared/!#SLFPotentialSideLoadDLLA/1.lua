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
for l_0_9 = 1, l_0_3 do
  if l_0_0 <= (l_0_4[l_0_9]).rva and (l_0_4[l_0_9]).rva <= l_0_2 then
    local l_0_10 = (pe.mmap_string_rva)((l_0_4[l_0_9]).namerva, 64)
    if l_0_10 ~= nil then
      (table.insert)(l_0_5, l_0_10)
    end
  end
end
if #l_0_5 == 0 then
  return mp.CLEAN
end
local l_0_11 = nil
if (mp.get_mpattributevalue)("MpPureForwardedExportsAll") ~= nil then
  l_0_11 = "MpPureForwardedExportsAll"
else
  if (mp.get_mpattributevalue)("MpPureForwardedExportsPresent") ~= nil then
    l_0_11 = "MpPureForwardedExportsPresent"
  else
    if (mp.get_mpattributevalue)("MpForwardedExportsPresent") ~= nil then
      l_0_11 = "MpForwardedExportsPresent"
    else
      return mp.CLEAN
    end
  end
end
local l_0_12 = nil
if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") > 0 then
  l_0_12 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget"))[1]
else
  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    l_0_12 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget"))[1]
  else
    l_0_12 = "ForwardedExportsTarget=FailedExtraction"
  end
end
l_0_12 = (string.match)(l_0_12, "ForwardedExports(.+)")
local l_0_13 = "PotentialSideLoadExports"
;
(mp.set_mpattribute)((string.format)("%s_%d_%d_%s_%s", l_0_13, l_0_3, #l_0_5, l_0_11, l_0_12))
set_research_data(l_0_13, (MpCommon.Base64Encode)((string.format)("%d_%s_%s", #l_0_5, l_0_11, l_0_12)), false)
local l_0_14 = (MpCommon.PathToWin32Path)((mp.getfilename)())
if l_0_14 ~= nil then
  AppendToRollingQueue(l_0_13, l_0_14, (string.format)("ExpCount=%d_FwdExpCount=%d_Type=%s_%s_Names=%s", l_0_3, #l_0_5, l_0_11, l_0_12, (table.concat)(l_0_5, ",")))
end
return mp.INFECTED

