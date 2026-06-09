-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\426b3bc98cecd\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[13]).matched and not isnull((this_sigattrlog[13]).utf8p1) and not isnull((this_sigattrlog[13]).utf8p2) then
  local l_0_0, l_0_1, l_0_3 = nil, nil, nil
  l_0_1 = (this_sigattrlog[13]).utf8p1
  local l_0_2, l_0_4 = nil
  l_0_2 = this_sigattrlog
  l_0_2 = l_0_2[13]
  l_0_3 = l_0_2.utf8p2
  local l_0_5 = nil
else
end
do
  -- DECOMPILER ERROR at PC73: Overwrote pending register: R0 in 'AssignReg'

  if (not (this_sigattrlog[14]).matched or isnull((this_sigattrlog[14]).utf8p1) or isnull((this_sigattrlog[14]).utf8p2) or (this_sigattrlog[15]).matched) and not isnull((this_sigattrlog[15]).utf8p1) and not isnull((this_sigattrlog[15]).utf8p2) then
    local l_0_6, l_0_7, l_0_9 = "ChildPowershell", (this_sigattrlog[14]).utf8p1, (this_sigattrlog[14]).utf8p2
    l_0_7 = (this_sigattrlog[15]).utf8p1
    local l_0_8, l_0_10 = nil
    l_0_8 = this_sigattrlog
    l_0_8 = l_0_8[15]
    l_0_9 = l_0_8.utf8p2
    local l_0_11 = nil
  else
  end
  do
    -- DECOMPILER ERROR at PC127: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[16]).matched or isnull((this_sigattrlog[16]).utf8p1) or isnull((this_sigattrlog[16]).utf8p2) or (this_sigattrlog[17]).matched) and not isnull((this_sigattrlog[17]).utf8p1) and not isnull((this_sigattrlog[17]).utf8p2) then
      local l_0_12, l_0_13, l_0_15 = "ChildCscript", (this_sigattrlog[16]).utf8p1, (this_sigattrlog[16]).utf8p2
      l_0_13 = (this_sigattrlog[17]).utf8p1
      local l_0_14, l_0_16 = nil
      l_0_14 = this_sigattrlog
      l_0_14 = l_0_14[17]
      l_0_15 = l_0_14.utf8p2
      local l_0_17 = nil
    else
    end
    do
      -- DECOMPILER ERROR at PC181: Overwrote pending register: R0 in 'AssignReg'

      if (not (this_sigattrlog[18]).matched or isnull((this_sigattrlog[18]).utf8p1) or isnull((this_sigattrlog[18]).utf8p2) or (this_sigattrlog[19]).matched) and not isnull((this_sigattrlog[19]).utf8p1) and not isnull((this_sigattrlog[19]).utf8p2) then
        local l_0_18, l_0_19, l_0_21 = "ChildMshta", (this_sigattrlog[18]).utf8p1, (this_sigattrlog[18]).utf8p2
        l_0_19 = (this_sigattrlog[19]).utf8p1
        local l_0_20, l_0_22 = nil
        l_0_20 = this_sigattrlog
        l_0_20 = l_0_20[19]
        l_0_21 = l_0_20.utf8p2
        local l_0_23 = nil
      else
      end
      do
        -- DECOMPILER ERROR at PC235: Overwrote pending register: R0 in 'AssignReg'

        if (not (this_sigattrlog[20]).matched or isnull((this_sigattrlog[20]).utf8p1) or isnull((this_sigattrlog[20]).utf8p2) or (this_sigattrlog[21]).matched) and not isnull((this_sigattrlog[21]).utf8p1) and not isnull((this_sigattrlog[21]).utf8p2) then
          local l_0_24, l_0_25, l_0_27 = "ChildRegsvr32", (this_sigattrlog[20]).utf8p1, (this_sigattrlog[20]).utf8p2
          l_0_25 = (this_sigattrlog[21]).utf8p1
          local l_0_26 = nil
          l_0_26 = this_sigattrlog
          l_0_26 = l_0_26[21]
          l_0_27 = l_0_26.utf8p2
          local l_0_29 = nil
        end
        do
          -- DECOMPILER ERROR at PC243: Confused about usage of register: R0 in 'UnsetPending'

          if isnull(l_0_24) then
            return mp.CLEAN
          end
          -- DECOMPILER ERROR at PC252: Confused about usage of register: R1 in 'UnsetPending'

          local l_0_28 = nil
          -- DECOMPILER ERROR at PC257: Confused about usage of register: R2 in 'UnsetPending'

          local l_0_30 = (string.lower)(l_0_25)
          local l_0_31 = nil
          do
            if not (string.find)(l_0_31, "-encodedcommand", 1, true) and not (string.find)(l_0_31, "-encoded ", 1, true) and not (string.find)(l_0_31, " -enc ", 1, true) and not (string.find)(l_0_31, "-enc ", 1, true) and not (string.find)(l_0_31, "iex(", 1, true) and not (string.find)(l_0_31, "iex (", 1, true) and not (string.find)(l_0_31, " iex ", 1, true) and not (string.find)(l_0_31, "invoke-expression", 1, true) and not (string.find)(l_0_31, "downloadstring", 1, true) and not (string.find)(l_0_31, "downloadfile", 1, true) and not (string.find)(l_0_31, "downloaddata", 1, true) and not (string.find)(l_0_31, "invoke-webrequest", 1, true) and not (string.find)(l_0_31, " iwr ", 1, true) and not (string.find)(l_0_31, "start-bitstransfer", 1, true) and not (string.find)(l_0_31, "compress-archive", 1, true) and not (string.find)(l_0_31, "set-mppreference", 1, true) and not (string.find)(l_0_31, "add-mppreference", 1, true) and not (string.find)(l_0_31, "frombase64string", 1, true) and not (string.find)(l_0_31, "::frombase64", 1, true) and not (string.find)(l_0_31, " whoami", 1, true) and not (string.find)(l_0_31, " tasklist", 1, true) and not (string.find)(l_0_31, " netstat", 1, true) and not (string.find)(l_0_31, " systeminfo", 1, true) and not (string.find)(l_0_31, " ipconfig", 1, true) and not (string.find)(l_0_31, " net user", 1, true) and not (string.find)(l_0_31, " net group", 1, true) and not (string.find)(l_0_31, "/c whoami", 1, true) and not (string.find)(l_0_31, "/c tasklist", 1, true) and not (string.find)(l_0_31, "/c netstat", 1, true) and not (string.find)(l_0_31, "/c systeminfo", 1, true) and not (string.find)(l_0_31, "reg add ", 1, true) and not (string.find)(l_0_31, "reg delete ", 1, true) and not (string.find)(l_0_31, "schtasks /create", 1, true) then
              local l_0_32 = (string.lower)(l_0_27)
            end
            if not (string.find)(l_0_31, "wmic process call create", 1, true) then
              return mp.CLEAN
            end
            local l_0_33 = nil
            -- DECOMPILER ERROR at PC585: Overwrote pending register: R5 in 'AssignReg'

            -- DECOMPILER ERROR at PC594: Overwrote pending register: R5 in 'AssignReg'

            -- DECOMPILER ERROR at PC603: Overwrote pending register: R5 in 'AssignReg'

            if ((not (this_sigattrlog[10]).matched or (this_sigattrlog[11]).matched) and not (this_sigattrlog[12]).matched) or not isnull(nil) then
              TrackPidAndTechniqueBM("BM", "T1505.003", "iis_shell_spawn", 28800)
              -- DECOMPILER ERROR at PC617: Confused about usage of register: R5 in 'UnsetPending'

              ;
              (bm.add_related_process)(nil)
            end
            local l_0_34 = nil
            if not isnull((mp.GetExecutablesFromCommandLine)(l_0_33)) then
              local l_0_35 = nil
              do
                if #(mp.GetExecutablesFromCommandLine)(l_0_33) >= 1 then
                  local l_0_36 = nil
                  if not isnull((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_33))[1])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_33))[1])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_33))[1]), true, false) then
                    (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_33))[1]))
                  end
                end
                -- DECOMPILER ERROR at PC658: Confused about usage of register: R7 in 'UnsetPending'

                -- DECOMPILER ERROR at PC662: Confused about usage of register: R6 in 'UnsetPending'

                do
                  if #(mp.GetExecutablesFromCommandLine)(l_0_33) >= 2 then
                    local l_0_37 = nil
                    if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_36[2])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_36[2])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_36[2]), true, false) then
                      (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_36[2]))
                    end
                  end
                  -- DECOMPILER ERROR at PC687: Confused about usage of register: R7 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC691: Confused about usage of register: R6 in 'UnsetPending'

                  do
                    if #(mp.GetExecutablesFromCommandLine)(l_0_33) >= 3 then
                      local l_0_38 = nil
                      if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_37[3])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_37[3])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_37[3]), true, false) then
                        (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_37[3]))
                      end
                    end
                    ;
                    (bm.add_related_string)("iis_shell_child_path", l_0_30, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("iis_shell_child_name", l_0_28, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("iis_shell_cmd_len", tostring(#l_0_33), bm.RelatedStringBMReport)
                    add_parents()
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

