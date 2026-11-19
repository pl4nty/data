-- Threat: !InfrastructureShared
-- Name: !#Lua:HasMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  local l_0_0 = mp.GetMOTWZone()
  if l_0_0 ~= nil and 3 <= l_0_0 then
    local l_0_1 = string.lower(mp.getfilename())
    if l_0_1 ~= nil and string.len(l_0_1) >= 4 then
      local l_0_2 = string.sub(l_0_1, -4)
      local l_0_3 = string.lower(MpCommon.PathToWin32Path(l_0_1))
      if l_0_2 == ".iso" then
        MpCommon.AppendPersistContext(l_0_3, "IsoWithMotw", 5)
      elseif l_0_2 == ".vhd" then
        MpCommon.AppendPersistContext(l_0_3, "VhdWithMotw", 5)
      elseif l_0_2 == ".img" then
        MpCommon.AppendPersistContext(l_0_3, "ImgWithMotw", 5)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
