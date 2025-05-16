-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b38fcd5dad\0x00000e6d_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  if UrlGrader(l_0_0.Url, "FAppAnomalousOutbound.A", false) == 0 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = nil
  local l_0_6 = nil
  if safeJsonDeserialize(l_0_3.AttributeValue) then
    l_0_5 = (safeJsonDeserialize(l_0_3.AttributeValue)).AppName
  else
    l_0_5 = l_0_6:match("[^|]+")
  end
  if not l_0_5 then
    return mp.CLEAN
  end
  local l_0_7 = nil
  local l_0_8 = {"Appomaly_Network_HOST", "Appomaly_Network_UserAgent"}
  for l_0_12,l_0_13 in ipairs(l_0_8) do
    local l_0_9 = (MpCommon.GetCurrentTimeT)()
    local l_0_15 = {SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A", Url = l_0_3.Url, AnomalyTableName = l_0_14, TableAge = GetAnomalyTableAge(l_0_14)}
    local l_0_16 = (MpCommon.AnomalyEventLookup)(l_0_14, "MarkerRecord_" .. l_0_5, 1)
    -- DECOMPILER ERROR at PC86: Overwrote pending register: R14 in 'AssignReg'

    if l_0_16 then
      if l_0_16.Count and l_0_16.Count ~= -1 then
        do
          local l_0_17 = l_0_9
          ;
          (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize({SignatureName = "PFAppAnomalousOutbound.A", Error = "Record has been added with value -1.", AnomalyTableName = l_0_14, Key = "MarkerRecord_" .. l_0_5}))
          pcall(MpCommon.AnomalyEventUpdate, l_0_14, "MarkerRecord_" .. l_0_5, l_0_9, 1)
          do
            local l_0_18, l_0_19 = , pcall(MpCommon.AnomalyEventUpdate, l_0_14, "MarkerRecord_" .. l_0_5, l_0_9, 1)
            if l_0_19 then
              l_0_15.AnomalyTableName = l_0_14
              ;
              (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_15))
            else
              l_0_15.Error = tostring(R18_PC137) .. R18_PC137
              -- DECOMPILER ERROR at PC143: Overwrote pending register: R18 in 'AssignReg'

              ;
              (bm.trigger_sig)(R18_PC137, safeJsonSerialize(l_0_15))
            end
            local l_0_20, l_0_21 = , nil
            local l_0_22 = nil
            -- DECOMPILER ERROR at PC154: Overwrote pending register: R18 in 'AssignReg'

            -- DECOMPILER ERROR at PC158: Overwrote pending register: R18 in 'AssignReg'

            if l_0_14 == "Appomaly_Network_HOST" then
              l_0_22 = R18_PC137 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.HostName .. "]"
            else
              -- DECOMPILER ERROR at PC171: Overwrote pending register: R18 in 'AssignReg'

              -- DECOMPILER ERROR at PC174: Overwrote pending register: R18 in 'AssignReg'

              -- DECOMPILER ERROR at PC177: Overwrote pending register: R15 in 'AssignReg'

              -- DECOMPILER ERROR at PC178: Overwrote pending register: R18 in 'AssignReg'

              if l_0_14 == "Appomaly_Network_UserAgent" and R18_PC137 ~= "" then
                l_0_22 = R18_PC137 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.UserAgent .. "]"
              end
            end
            -- DECOMPILER ERROR at PC190: Overwrote pending register: R18 in 'AssignReg'

            if l_0_21 then
              local l_0_23, l_0_24 = , R18_PC137
              local l_0_25 = nil
              if not (MpCommon.AnomalyEventLookup)(l_0_14, l_0_21, 1) then
                local l_0_26 = nil
                local l_0_27 = nil
                -- DECOMPILER ERROR at PC204: Confused about usage of register: R22 in 'UnsetPending'

                if (l_0_9 - l_0_20) / 60 / 1440 > 30 then
                  l_0_15.Days_elapsed = (l_0_9 - l_0_20) / 60 / 1440
                  ;
                  (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_15), bm.RelatedStringBMReport)
                  ;
                  (bm.trigger_sig)(l_0_14, safeJsonSerialize(l_0_15))
                  if l_0_23 and l_0_3.AttributeName then
                    local l_0_28, l_0_29 = , UrlGrader(l_0_3.Url, "BM_PFAppAnomalousOutbound.A")
                    if l_0_29 == 0 and l_0_3.Url and (l_0_3.Url).URL_CLEAN then
                      return mp.CLEAN
                    end
                    l_0_15.Url_ScoringInfo = l_0_3.Url
                    IncreaseProcessAnomalyScore(l_0_23.ppid, 10 + l_0_29, l_0_22, l_0_3.AttributeName, l_0_15)
                  end
                else
                  do
                    do
                      -- DECOMPILER ERROR at PC258: Overwrote pending register: R18 in 'AssignReg'

                      l_0_15.Error = tostring(l_0_25) .. ";Failed to add the key"
                      -- DECOMPILER ERROR at PC266: Confused about usage of register: R20 in 'UnsetPending'

                      do
                        do
                          local l_0_30 = nil
                          -- DECOMPILER ERROR at PC276: Overwrote pending register: R19 in 'AssignReg'

                          -- DECOMPILER ERROR at PC277: Overwrote pending register: R18 in 'AssignReg'

                          l_0_15.Error = tostring(l_0_25) .. ";Failed to update the key"
                          if not l_0_24 then
                            (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_15))
                          end
                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC293: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return mp.CLEAN
end

