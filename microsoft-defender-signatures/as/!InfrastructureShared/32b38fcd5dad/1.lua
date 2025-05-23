-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b38fcd5dad\1.luac 

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
  if (MpCommon.IsSampled)(100000, true, true, true) then
    for l_0_11,l_0_12 in ipairs({"Appomaly_Network_HOST", "Appomaly_Network_UserAgent"}) do
      local l_0_8 = nil
      local l_0_14, l_0_15 = {SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A", Url = l_0_3.Url, AnomalyTableName = l_0_13}, nil
      local l_0_16 = nil
      if l_0_13 == "Appomaly_Network_HOST" then
        l_0_16 = l_0_13 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.HostName .. "]"
      else
        -- DECOMPILER ERROR at PC100: Overwrote pending register: R12 in 'AssignReg'

        if l_0_13 == "Appomaly_Network_UserAgent" and l_0_3.UserAgent ~= "" then
          l_0_16 = l_0_13 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.UserAgent .. "]"
        end
      end
      local l_0_17, l_0_18, l_0_19 = , AnomalyTableCheck(l_0_13, l_0_15, 30, "MarkerRecord_" .. l_0_5)
      if l_0_18 and not l_0_19 then
        l_0_14.AnomalyTableInfo = l_0_15
        ;
        (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_14), bm.RelatedStringBMReport)
        ;
        (bm.trigger_sig)(l_0_13, safeJsonSerialize(l_0_14))
        if l_0_17 and l_0_3.AttributeName then
          local l_0_20, l_0_21 = , UrlGrader(l_0_3.Url, "BM_PFAppAnomalousOutbound.A")
          if l_0_21 == 0 and l_0_3.Url and (l_0_3.Url).URL_CLEAN then
            return mp.CLEAN
          end
          l_0_14.Url_ScoringInfo = l_0_3.Url
          IncreaseProcessAnomalyScore(l_0_17.ppid, 10 + l_0_21, l_0_16, l_0_3.AttributeName, l_0_14)
        end
      end
    end
  else
    do
      local l_0_22 = nil
      for l_0_26,l_0_27 in ipairs(l_0_22) do
        local l_0_23 = (MpCommon.GetCurrentTimeT)()
        local l_0_29 = {SignatureName = "Behavior:Win32/PFAppAnomalousOutbound.A", Url = l_0_3.Url, AnomalyTableName = l_0_28, TableAge = GetAnomalyTableAge(l_0_28)}
        local l_0_30 = (MpCommon.AnomalyEventLookup)(l_0_28, "MarkerRecord_" .. l_0_5, 1)
        -- DECOMPILER ERROR at PC203: Overwrote pending register: R14 in 'AssignReg'

        if l_0_30 then
          if l_0_30.Count and l_0_30.Count ~= -1 then
            do
              local l_0_31 = l_0_23
              ;
              (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize({SignatureName = "PFAppAnomalousOutbound.A", Error = "Record has been added with value -1.", AnomalyTableName = l_0_28, Key = "MarkerRecord_" .. l_0_5}))
              pcall(MpCommon.AnomalyEventUpdate, l_0_28, "MarkerRecord_" .. l_0_5, l_0_23, 1)
              do
                local l_0_32, l_0_33 = , pcall(MpCommon.AnomalyEventUpdate, l_0_28, "MarkerRecord_" .. l_0_5, l_0_23, 1)
                if l_0_33 then
                  l_0_29.AnomalyTableName = l_0_28
                  ;
                  (bm.trigger_sig)("AnomalyTableMarker_Rcr", safeJsonSerialize(l_0_29))
                else
                  l_0_29.Error = tostring(R18_PC254) .. R18_PC254
                  -- DECOMPILER ERROR at PC260: Overwrote pending register: R18 in 'AssignReg'

                  ;
                  (bm.trigger_sig)(R18_PC254, safeJsonSerialize(l_0_29))
                end
                local l_0_34, l_0_35 = , nil
                local l_0_36 = nil
                -- DECOMPILER ERROR at PC271: Overwrote pending register: R18 in 'AssignReg'

                -- DECOMPILER ERROR at PC275: Overwrote pending register: R18 in 'AssignReg'

                if l_0_28 == "Appomaly_Network_HOST" then
                  l_0_36 = R18_PC254 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.HostName .. "]"
                else
                  -- DECOMPILER ERROR at PC288: Overwrote pending register: R18 in 'AssignReg'

                  -- DECOMPILER ERROR at PC291: Overwrote pending register: R18 in 'AssignReg'

                  -- DECOMPILER ERROR at PC294: Overwrote pending register: R15 in 'AssignReg'

                  -- DECOMPILER ERROR at PC295: Overwrote pending register: R18 in 'AssignReg'

                  if l_0_28 == "Appomaly_Network_UserAgent" and R18_PC254 ~= "" then
                    l_0_36 = R18_PC254 .. "[" .. (((bm.get_current_process_startup_info)()).ppid):match("pid:(%d+)") .. "][" .. l_0_3.UserAgent .. "]"
                  end
                end
                -- DECOMPILER ERROR at PC307: Overwrote pending register: R18 in 'AssignReg'

                if l_0_35 then
                  local l_0_37, l_0_38 = , R18_PC254
                  local l_0_39 = nil
                  if not (MpCommon.AnomalyEventLookup)(l_0_28, l_0_35, 1) then
                    local l_0_40 = nil
                    local l_0_41 = nil
                    -- DECOMPILER ERROR at PC321: Confused about usage of register: R22 in 'UnsetPending'

                    if (l_0_23 - l_0_34) / 60 / 1440 > 30 then
                      l_0_29.Days_elapsed = (l_0_23 - l_0_34) / 60 / 1440
                      ;
                      (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_29), bm.RelatedStringBMReport)
                      ;
                      (bm.trigger_sig)(l_0_28, safeJsonSerialize(l_0_29))
                      if l_0_37 and l_0_3.AttributeName then
                        local l_0_42, l_0_43 = , UrlGrader(l_0_3.Url, "BM_PFAppAnomalousOutbound.A")
                        if l_0_43 == 0 and l_0_3.Url and (l_0_3.Url).URL_CLEAN then
                          return mp.CLEAN
                        end
                        l_0_29.Url_ScoringInfo = l_0_3.Url
                        IncreaseProcessAnomalyScore(l_0_37.ppid, 10 + l_0_43, l_0_36, l_0_3.AttributeName, l_0_29)
                      end
                    else
                      do
                        do
                          -- DECOMPILER ERROR at PC375: Overwrote pending register: R18 in 'AssignReg'

                          l_0_29.Error = tostring(l_0_39) .. ";Failed to add the key"
                          -- DECOMPILER ERROR at PC383: Confused about usage of register: R20 in 'UnsetPending'

                          do
                            do
                              local l_0_44 = nil
                              -- DECOMPILER ERROR at PC393: Overwrote pending register: R19 in 'AssignReg'

                              -- DECOMPILER ERROR at PC394: Overwrote pending register: R18 in 'AssignReg'

                              l_0_29.Error = tostring(l_0_39) .. ";Failed to update the key"
                              if not l_0_38 then
                                (bm.trigger_sig)("AnomalyTable_Error", safeJsonSerialize(l_0_29))
                              end
                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out IF_STMT

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
  end
end

