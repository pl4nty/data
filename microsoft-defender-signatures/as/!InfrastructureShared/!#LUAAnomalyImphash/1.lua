-- Threat: !InfrastructureShared
-- Name: !#LUA:AnomalyImphash
-- Type: 10
-- Includes: ResearchData, LuaFuncHelper
-- MpAttributes: !AGGR:GenericInstallerFile & RPF:TopLevelFile & MpNewlyCreatedHint & Lua:IsDeviceHVA

local l_0_0 = mp.enum_mpattributesubstring("MpInternal_imphash=")
if l_0_0 ~= nil and 0 < #l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    local l_0_3 = string.match(l_0_2, "MpInternal_imphash=(%w+)$")
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = "ImphashTableHVA"
    local l_0_5 = MpCommon.AnomalyEventLookup(l_0_4, "ImphashTableMarker", 1)
    local l_0_6 = 0
    local l_0_7 = MpCommon.GetCurrentTimeT()
    local l_0_8 = l_0_7
    local l_0_9, l_0_10
    local l_0_11 = {}
    l_0_11.AnomalyTableName = l_0_4
    l_0_11.Key = l_0_3
    if l_0_5 then
      l_0_11.MarkerEntryType = "MarkerFound"
      if l_0_5.Count then
        l_0_8 = l_0_5.Count
      end
      l_0_6 = l_0_5.LastSeen
    else
      l_0_8 = l_0_7
      l_0_9, l_0_10 = pcall(MpCommon.AnomalyEventUpdate, l_0_4, "ImphashTableMarker", l_0_7, 1)
      if not l_0_9 then
        l_0_11.Error = l_0_10
      end
      l_0_11.MarkerEntryType = "MarkerCreated"
    end
    local l_0_12 = (l_0_7 - l_0_8) / 60
    l_0_11.TableUnbiasedTime = l_0_12
    l_0_11.current_time = l_0_7
    l_0_11.marker_UnbiasedTime = l_0_8
    l_0_11.TableLastSeen = l_0_6
    local l_0_13 = MpCommon.AnomalyEventLookup(l_0_4, l_0_3, 1)
    if l_0_13 == nil then
      MpCommon.AnomalyEventUpdate(l_0_4, l_0_3, 1, 1)
      local l_0_14, l_0_15, l_0_16 = MpCommon.SNidSearch(98, l_0_3 .. "00000000")
      if l_0_14 == true and l_0_15 == "!#ImpHashCommonGlobal" then
        return mp.CLEAN
      end
      if 10080 < l_0_12 then
        l_0_11.EntryType = "AddedAfterThreshold"
        set_research_data("Imphash_Anomaly", safeJsonSerialize(l_0_11), false)
        mp.set_mpattribute("Lua:AnomalyImphashNew")
        return mp.INFECTED
      end
    else
      MpCommon.AnomalyEventUpdate(l_0_4, l_0_3, l_0_13.Count + 1, 1)
    end
  end
end
return mp.CLEAN
