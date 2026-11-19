-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:JS/Bondat!LnkTargetJs_lowfi
-- Type: 13

if mp.get_mpattribute("SCRIPT:Worm:JS/Bondat!lnk") and mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  local l_0_0 = tostring(headerpage)
  local l_0_1 = l_0_0:match("/c start wscript \"(%.Trashes\\%d+\\%l+%.js)\" &")
  if l_0_1 == nil then
    l_0_1 = l_0_0:match("/c start wscript%.exe \"(%.Trashes\\%d+\\%l+%.js)\" &")
    if l_0_1 == nil then
      return mp.CLEAN
    end
  end
  local l_0_2
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_3 == mp.SCANREASON_ONOPEN or l_0_3 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    l_0_2 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  end
  if l_0_2 == nil then
    l_0_2 = mp.getfilename():match("(.+)\\[^\\]+$")
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  mp.ReportLowfi(l_0_2 .. "\\" .. l_0_1, 2916175846)
end
return mp.CLEAN
