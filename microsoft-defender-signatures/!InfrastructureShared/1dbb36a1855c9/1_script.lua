-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1dbb36a1855c9\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
    local l_0_0, l_0_1 = nil
    if not l_0_0 then
      l_0_1 = mp
      l_0_1 = l_0_1.CLEAN
      return l_0_1
    end
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_2, l_0_3 = , UrlGrader(l_0_0.Url, "PFATamper.E", false)
  if l_0_3 == 0 then
    return mp.CLEAN
  end
  l_0_2.Url = l_0_0.Url
  local l_0_4, l_0_5 = , nil
  if not l_0_2.AttributeValue then
    return mp.CLEAN
  end
  local l_0_6 = nil
  local l_0_7 = nil
  if safeJsonDeserialize(l_0_2.AttributeValue) then
    l_0_5 = (safeJsonDeserialize(l_0_2.AttributeValue)).AppName
    l_0_6 = (safeJsonDeserialize(l_0_2.AttributeValue)).Pid
  else
    l_0_5 = l_0_7:match("[^|]+")
    l_0_6 = l_0_7:match("|(pid[^|]+)")
  end
  if not l_0_5 or not l_0_6 then
    return mp.CLEAN
  end
  local l_0_8 = nil
  if (this_sigattrlog[2]).matched then
    do
      if (this_sigattrlog[2]).utf8p2 == "THREAT" then
        local l_0_9 = {isThreat = false, type = "BM_SIGTRIGGER", event = (this_sigattrlog[2]).utf8p1}
      else
      end
      -- DECOMPILER ERROR at PC84: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC84: Confused about usage of register: R7 in 'UnsetPending'

      l_0_9.isThreat = false
      -- DECOMPILER ERROR at PC88: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC88: Confused about usage of register: R7 in 'UnsetPending'

      l_0_9.processName = (this_sigattrlog[2]).image_path
      -- DECOMPILER ERROR at PC95: Confused about usage of register: R7 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R7 in 'UnsetPending'

      if (this_sigattrlog[3]).matched then
        l_0_9.type = "BM_SIGTRIGGER"
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R7 in 'UnsetPending'

        -- DECOMPILER ERROR at PC99: Confused about usage of register: R7 in 'UnsetPending'

        l_0_9.event = (this_sigattrlog[3]).utf8p1
        do
          if (this_sigattrlog[3]).utf8p2 == "THREAT" then
            local l_0_10 = nil
          else
          end
          -- DECOMPILER ERROR at PC109: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC109: Confused about usage of register: R7 in 'UnsetPending'

          l_0_10.isThreat = false
          -- DECOMPILER ERROR at PC113: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC113: Confused about usage of register: R7 in 'UnsetPending'

          l_0_10.processName = (this_sigattrlog[3]).image_path
          -- DECOMPILER ERROR at PC120: Confused about usage of register: R7 in 'UnsetPending'

          -- DECOMPILER ERROR at PC120: Confused about usage of register: R7 in 'UnsetPending'

          if (this_sigattrlog[4]).matched then
            l_0_10.type = "BM_SIGTRIGGER"
            -- DECOMPILER ERROR at PC124: Confused about usage of register: R7 in 'UnsetPending'

            -- DECOMPILER ERROR at PC124: Confused about usage of register: R7 in 'UnsetPending'

            l_0_10.event = (this_sigattrlog[4]).utf8p1
            do
              if (this_sigattrlog[4]).utf8p2 == "THREAT" then
                local l_0_11 = nil
              else
              end
              -- DECOMPILER ERROR at PC134: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC134: Confused about usage of register: R7 in 'UnsetPending'

              l_0_11.isThreat = false
              -- DECOMPILER ERROR at PC138: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC138: Confused about usage of register: R7 in 'UnsetPending'

              l_0_11.processName = (this_sigattrlog[4]).image_path
              -- DECOMPILER ERROR at PC145: Confused about usage of register: R7 in 'UnsetPending'

              -- DECOMPILER ERROR at PC145: Confused about usage of register: R7 in 'UnsetPending'

              if (this_sigattrlog[5]).matched then
                l_0_11.type = "BM_TP_IGNORE"
                -- DECOMPILER ERROR at PC149: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC149: Confused about usage of register: R7 in 'UnsetPending'

                l_0_11.block_usermode = (this_sigattrlog[5]).reg_block_usermode
                -- DECOMPILER ERROR at PC153: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC153: Confused about usage of register: R7 in 'UnsetPending'

                l_0_11.event = (this_sigattrlog[5]).utf8p1
                -- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

                l_0_11.isThreat = false
                -- DECOMPILER ERROR at PC158: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC158: Confused about usage of register: R7 in 'UnsetPending'

                l_0_11.processName = (this_sigattrlog[5]).image_path
              else
                -- DECOMPILER ERROR at PC165: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC165: Confused about usage of register: R7 in 'UnsetPending'

                if (this_sigattrlog[6]).matched then
                  l_0_11.type = "BM_TP_IGNORE"
                  -- DECOMPILER ERROR at PC169: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC169: Confused about usage of register: R7 in 'UnsetPending'

                  l_0_11.block_usermode = (this_sigattrlog[6]).reg_block_usermode
                  -- DECOMPILER ERROR at PC173: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC173: Confused about usage of register: R7 in 'UnsetPending'

                  l_0_11.event = (this_sigattrlog[6]).utf8p1
                  -- DECOMPILER ERROR at PC174: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC174: Confused about usage of register: R7 in 'UnsetPending'

                  l_0_11.isThreat = false
                  -- DECOMPILER ERROR at PC178: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC178: Confused about usage of register: R7 in 'UnsetPending'

                  l_0_11.processName = (this_sigattrlog[6]).image_path
                else
                  -- DECOMPILER ERROR at PC185: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC185: Confused about usage of register: R7 in 'UnsetPending'

                  if (this_sigattrlog[7]).matched then
                    l_0_11.type = "BM_TP_BLOCK"
                    -- DECOMPILER ERROR at PC189: Confused about usage of register: R7 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC189: Confused about usage of register: R7 in 'UnsetPending'

                    l_0_11.block_usermode = (this_sigattrlog[7]).reg_block_usermode
                    -- DECOMPILER ERROR at PC193: Confused about usage of register: R7 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC193: Confused about usage of register: R7 in 'UnsetPending'

                    l_0_11.event = (this_sigattrlog[7]).utf8p1
                    -- DECOMPILER ERROR at PC194: Confused about usage of register: R7 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC194: Confused about usage of register: R7 in 'UnsetPending'

                    l_0_11.isThreat = true
                    -- DECOMPILER ERROR at PC198: Confused about usage of register: R7 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC198: Confused about usage of register: R7 in 'UnsetPending'

                    l_0_11.processName = (this_sigattrlog[7]).image_path
                  else
                    -- DECOMPILER ERROR at PC205: Confused about usage of register: R7 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC205: Confused about usage of register: R7 in 'UnsetPending'

                    if (this_sigattrlog[8]).matched then
                      l_0_11.type = "BM_TP_BLOCK"
                      -- DECOMPILER ERROR at PC209: Confused about usage of register: R7 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC209: Confused about usage of register: R7 in 'UnsetPending'

                      l_0_11.block_usermode = (this_sigattrlog[8]).reg_block_usermode
                      -- DECOMPILER ERROR at PC213: Confused about usage of register: R7 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC213: Confused about usage of register: R7 in 'UnsetPending'

                      l_0_11.event = (this_sigattrlog[8]).utf8p1
                      -- DECOMPILER ERROR at PC214: Confused about usage of register: R7 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC214: Confused about usage of register: R7 in 'UnsetPending'

                      l_0_11.isThreat = true
                      -- DECOMPILER ERROR at PC218: Confused about usage of register: R7 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC218: Confused about usage of register: R7 in 'UnsetPending'

                      l_0_11.processName = (this_sigattrlog[8]).image_path
                    else
                      -- DECOMPILER ERROR at PC225: Confused about usage of register: R7 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC225: Confused about usage of register: R7 in 'UnsetPending'

                      if (this_sigattrlog[9]).matched then
                        l_0_11.type = "CMD_DETECTION"
                        -- DECOMPILER ERROR at PC229: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC229: Confused about usage of register: R7 in 'UnsetPending'

                        l_0_11.event = (this_sigattrlog[9]).utf8p2
                        do
                          if (this_sigattrlog[9]).utf8p1 == "BM_BLOCKPROCESSCREATE" then
                            local l_0_12 = nil
                          else
                          end
                          -- DECOMPILER ERROR at PC239: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC239: Confused about usage of register: R7 in 'UnsetPending'

                          l_0_12.isThreat = false
                          -- DECOMPILER ERROR at PC243: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC243: Confused about usage of register: R7 in 'UnsetPending'

                          l_0_12.processName = (this_sigattrlog[9]).image_path
                          -- DECOMPILER ERROR at PC250: Confused about usage of register: R7 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC250: Confused about usage of register: R7 in 'UnsetPending'

                          if (this_sigattrlog[10]).matched then
                            l_0_12.type = "AMSI_DETECTION"
                            -- DECOMPILER ERROR at PC254: Confused about usage of register: R7 in 'UnsetPending'

                            -- DECOMPILER ERROR at PC254: Confused about usage of register: R7 in 'UnsetPending'

                            l_0_12.event = (this_sigattrlog[10]).utf8p1
                            do
                              if (this_sigattrlog[10]).utf8p2 == "INFECTED" then
                                local l_0_13 = nil
                              else
                              end
                              -- DECOMPILER ERROR at PC264: Confused about usage of register: R7 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC264: Confused about usage of register: R7 in 'UnsetPending'

                              l_0_13.isThreat = false
                              -- DECOMPILER ERROR at PC268: Confused about usage of register: R7 in 'UnsetPending'

                              -- DECOMPILER ERROR at PC268: Confused about usage of register: R7 in 'UnsetPending'

                              l_0_13.processName = (this_sigattrlog[10]).image_path
                              add_parents()
                              local l_0_14 = nil
                              local l_0_15 = nil
                              ;
                              (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(reportRelevantUntrustedEntitiesForPid(((bm.get_current_process_startup_info)()).ppid)), bm.RelatedStringBMReport)
                              l_0_2.TamperingEvent = l_0_14
                              ;
                              (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_2), bm.RelatedStringBMReport)
                              local l_0_16 = nil
                              -- DECOMPILER ERROR at PC300: Overwrote pending register: R10 in 'AssignReg'

                              -- DECOMPILER ERROR at PC302: Overwrote pending register: R10 in 'AssignReg'

                              if l_0_2.AttributeName == "PFApp_Parent" then
                                local l_0_17, l_0_18 = , startTrackingApp(l_0_6, l_0_5, nil, l_0_2.AttributeName)
                                if not l_0_18 then
                                  l_0_6.SignatureName = "PFATamper.E"
                                  ;
                                  (bm.trigger_sig)("ProcAttribError", safeJsonSerialize(R16_PC317))
                                else
                                  do
                                    local l_0_19, l_0_20 = , l_0_14.isThreat and 30 or 10
                                    do
                                      local l_0_21 = nil
                                      -- DECOMPILER ERROR at PC338: Confused about usage of register: R13 in 'UnsetPending'

                                      IncreaseProcessAnomalyScore(l_0_15.ppid, l_0_20, "Tampering[" .. (l_0_15.ppid):match("pid:(%d+)") .. "][" .. l_0_14.event .. "]", l_0_2.AttributeName)
                                      return mp.INFECTED
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
            end
          end
        end
      end
    end
  end
end

