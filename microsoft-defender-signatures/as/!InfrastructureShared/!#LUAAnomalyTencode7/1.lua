-- Threat: !InfrastructureShared
-- Name: !#LUA:AnomalyTencode7
-- Type: 24
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.enum_mpattributesubstring("MpInternal_researchdata=TENCODE7=")
if l_0_0 ~= nil and 0 < #l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    local l_0_3 = string.match(l_0_2, "MpInternal_researchdata=TENCODE7=(%w+)$")
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = MpCommon.AnomalyEventLookup("AnomalyTencode7", "Tencode7TableMarker", 100)
    if l_0_4 == nil then
      MpCommon.AnomalyEventUpdate("AnomalyTencode7", "Tencode7TableMarker", 1, 1)
      return mp.CLEAN
    end
    local l_0_5 = MpCommon.AnomalyEventLookup("AnomalyTencode7", l_0_3, 1)
    if l_0_5 == nil then
      MpCommon.AnomalyEventUpdate("AnomalyTencode7", l_0_3, 1, 1)
      local l_0_6, l_0_7, l_0_8 = MpCommon.SNidSearch(228, l_0_3)
      if l_0_6 == true and l_0_7 == "!#Tencode7CommonGlobal" then
        return mp.CLEAN
      end
      if l_0_4.UnbiasedTime > 1800 then
        mp.set_mpattribute("Lua:AnomalyPSENew")
        return mp.INFECTED
      end
    else
      MpCommon.AnomalyEventUpdate("AnomalyTencode7", l_0_3, l_0_5.Count + 1, 1)
      local l_0_9, l_0_10, l_0_11 = MpCommon.SNidSearch(228, l_0_3)
      if l_0_9 == true and l_0_10 == "!#Tencode7CommonGlobal" then
        return mp.CLEAN
      end
      if l_0_5.Count == 1 then
        mp.set_mpattribute("Lua:AnomalyPSEObsMal")
        return mp.INFECTED
      end
      if l_0_5.Count < 3 and l_0_5.UnbiasedTime > 20160 then
        mp.set_mpattribute("Lua:AnomalyPSENotFreq")
        return mp.INFECTED
      end
      if l_0_5.LastSeen >= 43200 then
        MpCommon.AnomalyEventUpdate("AnomalyTencode7", l_0_3, 1, 1)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
