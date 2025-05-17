-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3547485f1\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = safeJsonDeserialize(l_0_0)
  if not l_0_1 then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  local l_0_2 = (bm.get_current_process_startup_info)()
  if l_0_2 then
    add_related_anomalydetections(l_0_2.ppid)
  end
  local l_0_3 = add_parents_mp()
  if l_0_3 then
    (bm.add_related_string)("ParentsInfo", safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
  end
  reportRelevantUntrustedEntitiesForPid(l_0_2.ppid)
  local l_0_4 = l_0_1.Reason
  if l_0_4 and type(l_0_4) == "table" then
    for l_0_8,l_0_9 in pairs(l_0_4) do
      if (string.find)(l_0_8, "SuspDownload", 1, true) then
        local l_0_10 = l_0_9.CmdGradingInfo
        if l_0_10 and l_0_10.Evidence_L1 then
          local l_0_11 = (l_0_10.Evidence_L1).Urls
          for l_0_15,l_0_16 in pairs(l_0_11) do
            if l_0_16.BadUrlRep then
              do
                local l_0_17 = {}
                l_0_17.Remediation_Reason = "BadUrlRep"
                l_0_17.Evidence = l_0_0
                ;
                (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_17))
                do break end
                if l_0_16.Url_Score >= 30 then
                  do
                    do
                      local l_0_18 = {}
                      l_0_18.Remediation_Reason = "HighScoreUrl"
                      l_0_18.Evidence = l_0_0
                      ;
                      (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_18))
                      do break end
                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      else
        do
          if (string.find)(l_0_8, "Base64Cmd_child", 1, true) then
            local l_0_19 = l_0_9.Base64GradingInfo
            for l_0_23 = 1, 3 do
              if l_0_19 and l_0_19["Evidence_L" .. l_0_23] then
                local l_0_24 = (l_0_19["Evidence_L" .. l_0_23]).Urls
                for l_0_28,l_0_29 in pairs(l_0_24) do
                  if l_0_29.BadUrlRep then
                    do
                      local l_0_30 = {}
                      l_0_30.Remediation_Reason = "BadUrlRep"
                      l_0_30.Evidence = l_0_0
                      ;
                      (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_30))
                      do break end
                      if l_0_29.Url_Score >= 30 then
                        do
                          do
                            local l_0_31 = {}
                            l_0_31.Remediation_Reason = "HighScoreUrl"
                            l_0_31.Evidence = l_0_0
                            ;
                            (bm.trigger_sig)("Remediation_AnomalyMultiStage", safeJsonSerialize(l_0_31))
                            do break end
                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC175: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            -- DECOMPILER ERROR at PC178: Confused about usage of register R11 for local variables in 'ReleaseLocals'

          end
          -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
l_0_0 = mp
l_0_0 = l_0_0.INFECTED
return l_0_0

