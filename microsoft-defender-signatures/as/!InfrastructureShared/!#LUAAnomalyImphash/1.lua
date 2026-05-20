-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAAnomalyImphash\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("MpInternal_imphash=")
if l_0_0 ~= nil and #l_0_0 > 0 then
  for l_0_4,l_0_5 in ipairs(l_0_0) do
    local l_0_6 = (string.match)(l_0_5, "MpInternal_imphash=(%w+)$")
    if l_0_6 == nil then
      return mp.CLEAN
    end
    local l_0_7 = "ImphashTableHVA"
    local l_0_8 = (MpCommon.AnomalyEventLookup)(l_0_7, "ImphashTableMarker", 1)
    local l_0_9 = 0
    local l_0_10 = (MpCommon.GetCurrentTimeT)()
    local l_0_11 = l_0_10
    local l_0_12, l_0_13 = nil, nil
    local l_0_14 = {}
    l_0_14.AnomalyTableName = l_0_7
    l_0_14.Key = l_0_6
    if l_0_8 then
      l_0_14.MarkerEntryType = "MarkerFound"
      if l_0_8.Count then
        l_0_11 = l_0_8.Count
      end
      l_0_9 = l_0_8.LastSeen
    else
      l_0_11 = l_0_10
      l_0_12 = pcall(MpCommon.AnomalyEventUpdate, l_0_7, "ImphashTableMarker", l_0_10, 1)
      if not l_0_12 then
        l_0_14.Error = l_0_13
      end
      l_0_14.MarkerEntryType = "MarkerCreated"
    end
    local l_0_15 = (l_0_10 - l_0_11) / 60
    l_0_14.TableUnbiasedTime = l_0_15
    l_0_14.current_time = l_0_10
    l_0_14.marker_UnbiasedTime = l_0_11
    l_0_14.TableLastSeen = l_0_9
    local l_0_16 = (MpCommon.AnomalyEventLookup)(l_0_7, l_0_6, 1)
    if l_0_16 == nil then
      (MpCommon.AnomalyEventUpdate)(l_0_7, l_0_6, 1, 1)
      local l_0_17, l_0_18, l_0_19 = (MpCommon.SNidSearch)(98, l_0_6 .. "00000000")
      if l_0_17 == true and l_0_18 == "!#ImpHashCommonGlobal" then
        return mp.CLEAN
      end
      if l_0_15 > 10080 then
        l_0_14.EntryType = "AddedAfterThreshold"
        set_research_data("Imphash_Anomaly", safeJsonSerialize(l_0_14), false)
        ;
        (mp.set_mpattribute)("Lua:AnomalyImphashNew")
        return mp.INFECTED
      else
        set_research_data("Imphash_Anomaly", safeJsonSerialize(l_0_14), false)
        ;
        (mp.set_mpattribute)("Lua:AnomalyImphashWithinTraining")
      end
    else
      do
        do
          ;
          (MpCommon.AnomalyEventUpdate)(l_0_7, l_0_6, l_0_16.Count + 1, 1)
          -- DECOMPILER ERROR at PC136: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC136: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC136: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
return mp.CLEAN

