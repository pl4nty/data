-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSoftEtherConfig\1.luac 

-- params : ...
-- function num : 0
report_scpt = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_0 == nil or l_1_0 == "" then
    return 
  end
  if l_1_1 == nil then
    return 
  end
  local l_1_2 = (mp.enum_mpattributesubstring)(l_1_0)
  if #l_1_2 > 0 then
    local l_1_3 = {}
    for l_1_7,l_1_8 in ipairs(l_1_2) do
      local l_1_9 = l_1_8:match("%.(%u+)$")
      if l_1_9 and #l_1_9 <= 3 then
        l_1_3[#l_1_3 + 1] = l_1_9
      end
    end
    if #l_1_3 > 0 then
      (table.sort)(l_1_3)
      local l_1_10 = (table.concat)(l_1_3, ":")
      if #l_1_10 <= 128 then
        (mp.set_mpattribute)("MpInternal_researchdata=SCPTSFX=" .. l_1_10)
        ;
        (mp.ReportLowfi)((mp.getfilename)(), l_1_1)
        return true
      end
    end
  end
end

if report_scpt("SCPT:GoatBridge", 1322691715) or report_scpt("SCPT:HardBridge", 3062420643) or report_scpt("SCPT:NullBridge", 3796493493) then
  return mp.CLEAN
end
return mp.CLEAN

