-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPotentialSideLoadDLLA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_0 == 0 or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {}
for l_0_6 = 1, l_0_0 do
  local l_0_7 = (pe.mmap_string_rva)((l_0_1[l_0_6]).namerva, 64)
  if l_0_7 ~= nil then
    (table.insert)(l_0_2, l_0_7)
  end
end
local l_0_8 = nil
if (mp.get_mpattributevalue)("MpPureForwardedExportsAll") ~= nil then
  l_0_8 = "MpPureForwardedExportsAll"
else
  if (mp.get_mpattributevalue)("MpPureForwardedExportsPresent") ~= nil then
    l_0_8 = "MpPureForwardedExportsPresent"
  else
    if (mp.get_mpattributevalue)("MpForwardedExportsPresent") ~= nil then
      l_0_8 = "MpForwardedExportsPresent"
    else
      return mp.CLEAN
    end
  end
end
local l_0_9 = nil
if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget") > 0 then
  l_0_9 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsTarget"))[1]
else
  if #(mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget") > 0 then
    l_0_9 = ((mp.enum_mpattributesubstring)("MpPureForwardedExportsMissingTarget"))[1]
  else
    l_0_9 = "ForwardedExportsTarget=FailedExtraction"
  end
end
l_0_9 = (string.match)(l_0_9, "ForwardedExports(.+)")
local l_0_10 = "PotentialSideLoadExports"
;
(mp.set_mpattribute)((string.format)("%s_%d_%s_%s", l_0_10, #l_0_2, l_0_8, l_0_9))
set_research_data(l_0_10, (MpCommon.Base64Encode)((string.format)("%d_%s_%s", #l_0_2, l_0_8, l_0_9)), false)
AppendToRollingQueue(l_0_10, "Metadata", (string.format)("%d_%s_%s", #l_0_2, l_0_8, l_0_9))
AppendToRollingQueue(l_0_10, "List", (table.concat)(l_0_2, ", "))
return mp.INFECTED

