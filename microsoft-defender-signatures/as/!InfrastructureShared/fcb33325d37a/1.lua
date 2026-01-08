-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fcb33325d37a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[4]).matched then
  local l_0_0 = nil
  if not l_0_0 or #l_0_0 < 5 then
    return mp.CLEAN
  end
  local l_0_1 = contains
  local l_0_2 = l_0_0
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC20: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R1 in 'AssignReg'

  if l_0_1 then
    return l_0_1
  end
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

  l_0_3 = l_0_3(("osdsetuphook").GetExecutablesFromCommandLine, l_0_0)
  local l_0_4 = nil
  if l_0_3 and l_0_4 then
    for l_0_8,l_0_9 in ipairs(l_0_4) do
      local l_0_10 = {}
      l_0_10.path = l_0_9
      l_0_9 = (mp.ContextualExpandEnvironmentVariables)(l_0_9)
      if l_0_9 then
        local l_0_11 = (mp.IsKnownFriendlyFile)(l_0_9, true, false)
        ;
        (bm.add_related_string)("FriendlyFile", l_0_9, bm.RelatedStringBMReport)
        if l_0_11 == nil or l_0_11 == false then
          local l_0_12 = 0
          local l_0_13 = 0
          local l_0_14 = (MpCommon.PathToWin32Path)(l_0_9)
          if l_0_14 and (string.match)(l_0_14, "^[%a]:\\") then
            l_0_12 = (sysio.GetFileSize)(l_0_14)
            l_0_10.size = l_0_12
            if (sysio.IsFileExists)(l_0_14) then
              local l_0_15 = (sysio.GetFileLastWriteTime)(l_0_14) / 10000000 - 11644473600
              local l_0_16 = (MpCommon.GetCurrentTimeT)()
              l_0_13 = l_0_16 - l_0_15
              l_0_10.age = l_0_13
              ;
              (bm.add_related_file)(l_0_14)
              local l_0_17 = (string.lower)(l_0_14)
              if (string.find)(l_0_17, ".exe", 1, true) then
                local l_0_18, l_0_19 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_17)
                if l_0_18 and l_0_19 then
                  do
                    if l_0_19.value then
                      local l_0_20 = {}
                      -- DECOMPILER ERROR at PC138: No list found for R20 , SetList fails

                    end
                    -- DECOMPILER ERROR at PC141: Overwrote pending register: R21 in 'AssignReg'

                    for l_0_24,l_0_25 in ipairs(l_0_19) do
                      if (string.find)(l_0_25.value, "UnsignedFile", 1, true) and FiletimeToDaysElapsed(l_0_25.insert_time) < 2 then
                        l_0_10.FileDroppedRecently = true
                        l_0_10.FileDropperInfo = l_0_19
                        -- DECOMPILER ERROR at PC160: Overwrote pending register: R2 in 'AssignReg'

                        local l_0_26 = (string.match)(l_0_25.value, "Process_Img(.*)")
                        if l_0_26 then
                          local l_0_27 = contains
                          local l_0_28 = l_0_26
                          local l_0_29 = {}
                          -- DECOMPILER ERROR at PC174: No list found for R28 , SetList fails

                          -- DECOMPILER ERROR at PC178: Overwrote pending register: R2 in 'AssignReg'

                        end
                        do
                          -- DECOMPILER ERROR at PC179: Overwrote pending register: R26 in 'AssignReg'

                          -- DECOMPILER ERROR at PC183: Overwrote pending register: R29 in 'AssignReg'

                          if not l_0_27 or (l_0_27.find)(l_0_25.value, "FileAttributes", "explorer.exe", true) then
                            local l_0_30 = (string.match)(l_0_25.value, "%[(.*)%]")
                            for l_0_34 in (string.gmatch)(l_0_30, "([^|]+)") do
                              -- DECOMPILER ERROR at PC199: Overwrote pending register: R2 in 'AssignReg'

                              -- DECOMPILER ERROR at PC202: Overwrote pending register: R2 in 'AssignReg'

                            end
                          end
                          do
                            if l_0_34 == "SLF:HighRiskHasMotW" then
                              do
                                do break end
                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_STMT

                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out DO_STMT

                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                -- DECOMPILER ERROR at PC207: LeaveBlock: unexpected jumping out IF_STMT

                              end
                            end
                          end
                        end
                      end
                    end
                    -- DECOMPILER ERROR at PC209: Confused about usage of register R20 for local variables in 'ReleaseLocals'

                    -- DECOMPILER ERROR at PC211: Overwrote pending register: R19 in 'AssignReg'

                    -- DECOMPILER ERROR at PC212: Overwrote pending register: R19 in 'AssignReg'

                    local l_0_35, l_0_36 = nil
                    if l_0_18 and l_0_19 then
                      do
                        do
                          if l_0_35 then
                            local l_0_37 = nil
                            -- DECOMPILER ERROR at PC226: Overwrote pending register: R19 in 'AssignReg'

                          end
                          -- DECOMPILER ERROR at PC227: Overwrote pending register: R20 in 'AssignReg'

                          -- DECOMPILER ERROR at PC228: Overwrote pending register: R21 in 'AssignReg'

                          for l_0_41,l_0_42 in l_0_35 do
                            local l_0_41, l_0_42 = nil
                            -- DECOMPILER ERROR at PC238: Overwrote pending register: R2 in 'AssignReg'

                            -- DECOMPILER ERROR at PC239: Overwrote pending register: R25 in 'AssignReg'

                            -- DECOMPILER ERROR at PC240: Overwrote pending register: R25 in 'AssignReg'

                            -- DECOMPILER ERROR at PC241: Overwrote pending register: R26 in 'AssignReg'

                            if l_0_41 < 2 then
                              local l_0_43 = nil
                              -- DECOMPILER ERROR at PC246: Overwrote pending register: R26 in 'AssignReg'

                              if l_0_41 then
                                local l_0_44 = nil
                                local l_0_45 = nil
                                local l_0_46 = nil
                                -- DECOMPILER ERROR at PC251: Overwrote pending register: R31 in 'AssignReg'

                                l_0_42, l_0_44 = l_0_42(l_0_43, l_0_44), {l_0_45, l_0_46, "7z.exe"}
                                -- DECOMPILER ERROR at PC256: Overwrote pending register: R2 in 'AssignReg'

                              end
                              do
                                if l_0_42 then
                                  l_0_42 = string
                                  l_0_42 = l_0_42.find
                                  -- DECOMPILER ERROR at PC259: Overwrote pending register: R27 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC261: Overwrote pending register: R29 in 'AssignReg'

                                  l_0_42 = l_0_42(l_0_43, "FileAttributes", l_0_45, true)
                                  if l_0_42 then
                                    l_0_42 = string
                                    l_0_42 = l_0_42.match
                                    -- DECOMPILER ERROR at PC268: Overwrote pending register: R27 in 'AssignReg'

                                    l_0_42 = l_0_42(l_0_43, "%[(.*)%]")
                                    local l_0_47 = nil
                                    -- DECOMPILER ERROR at PC271: Overwrote pending register: R27 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC272: Overwrote pending register: R27 in 'AssignReg'

                                    l_0_47 = l_0_42
                                    l_0_43 = l_0_43(l_0_47, "([^|]+)")
                                    for l_0_51 in l_0_43 do
                                      local l_0_50, l_0_51 = nil
                                      -- DECOMPILER ERROR at PC277: Overwrote pending register: R2 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC280: Overwrote pending register: R2 in 'AssignReg'

                                    end
                                  end
                                  do
                                    if l_0_49 == "SLF:HighRiskHasMotW" then
                                      l_0_10.score = l_0_2
                                      -- DECOMPILER ERROR at PC284: Confused about usage of register R28 for local variables in 'ReleaseLocals'

                                      do break end
                                      -- DECOMPILER ERROR at PC285: Confused about usage of register R27 for local variables in 'ReleaseLocals'

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC285: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                              end
                            end
                          end
                          -- DECOMPILER ERROR at PC287: Overwrote pending register: R18 in 'AssignReg'

                          -- DECOMPILER ERROR at PC288: Overwrote pending register: R18 in 'AssignReg'

                          -- DECOMPILER ERROR at PC289: Overwrote pending register: R19 in 'AssignReg'

                          l_0_1 = {}
                          -- DECOMPILER ERROR at PC290: Overwrote pending register: R20 in 'AssignReg'

                          l_0_18(l_0_19, l_0_35)
                          -- DECOMPILER ERROR at PC292: Confused about usage of register R24 for local variables in 'ReleaseLocals'

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC292: LeaveBlock: unexpected jumping out IF_STMT

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
  do
    if next(l_0_1) then
      local l_0_52 = nil
      ;
      (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
      if l_0_2 > 0 then
        (bm.trigger_sig)("SetupMode_Block", "untrusted_entities")
      end
    end
    local l_0_53 = nil
    local l_0_54 = l_0_41
    local l_0_55 = nil
    if contains(l_0_0, {"software\\Microsoft\\"}) then
      do
        (bm.trigger_sig)("SetupMode_Block", "script_in_cmd")
        -- DECOMPILER ERROR at PC329: Confused about usage of register R23 for local variables in 'ReleaseLocals'

        l_0_1 = mp
        l_0_1 = l_0_1.INFECTED
        return l_0_1
      end
    end
  end
end

