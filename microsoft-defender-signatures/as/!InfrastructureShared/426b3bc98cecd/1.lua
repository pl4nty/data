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
          local l_0_32 = (string.lower)(l_0_27)
          local l_0_33 = {"-encodedcommand", "-encoded ", " -enc ", "-enc ", "iex(", "iex (", " iex ", "invoke-expression", "downloadstring", "downloadfile", "downloaddata", "invoke-webrequest", " iwr ", "start-bitstransfer", "compress-archive", "frombase64string", "::frombase64", "set-mppreference", "add-mppreference", "reg add ", "reg delete ", "schtasks /create", "wmic process call create"}
          local l_0_34 = {" whoami", " tasklist", " netstat", " systeminfo", " ipconfig", " hostname", " arp ", " route print", " nslookup", " nltest", " quser", " qwinsta", " query user", " net user", " net group", " net localgroup", " net view", " net use", " net start", " dsquery", " date /t", " time /t", " sc query", " wmic nic", " netsh interface", " getmac", "/c whoami", "/c tasklist", "/c netstat", "/c systeminfo", "/c ipconfig", "/c hostname", "/c arp", "/c route", "/c nslookup", "/c nltest", "/c quser", "/c qwinsta", "/c query user", "/c net user", "/c net group", "/c net localgroup", "/c net view", "/c net use", "/c net start", "/c dsquery", "/c date /t", "/c time /t", "/c dir", "/c ver", "/c sc query", "/c wmic nic", "/c netsh interface", "/c getmac"}
          do
            if not contains(l_0_31, l_0_33, true) and not contains(l_0_31, l_0_34, true) then
              local l_0_35 = nil
            end
            if not contains(l_0_31, {"get-wmiobject", "gwmi ", "get-ciminstance", "gcim ", "win32_computersystem", "win32_operatingsystem", "win32_bios", "win32_networkadapterconfiguration", "win32_process", "win32_service", "get-localuser", "get-localgroup", "get-localgroupmember", "get-aduser", "get-adgroup", "get-adcomputer", "get-netuser", "get-netgroup", "get-netcomputer", "get-domainuser", "get-domaingroup", "get-domaincomputer", "get-process", "get-service", "get-childitem", "gci ", "get-netipaddress", "get-nettcpconnection", "get-ipconfiguration", "get-computerinfo", "get-volume", "get-disk", "get-physicaldisk", "get-eventlog", "get-winevent", "psversiontable", "$profile"}, true) then
              return mp.CLEAN
            end
            local l_0_36 = nil
            -- DECOMPILER ERROR at PC421: Overwrote pending register: R8 in 'AssignReg'

            -- DECOMPILER ERROR at PC430: Overwrote pending register: R8 in 'AssignReg'

            -- DECOMPILER ERROR at PC439: Overwrote pending register: R8 in 'AssignReg'

            if ((not (this_sigattrlog[10]).matched or (this_sigattrlog[11]).matched) and not (this_sigattrlog[12]).matched) or not isnull(nil) then
              TrackPidAndTechniqueBM("BM", "T1505.003", "iis_shell_spawn", 28800)
              -- DECOMPILER ERROR at PC453: Confused about usage of register: R8 in 'UnsetPending'

              ;
              (bm.add_related_process)(nil)
            end
            local l_0_37 = nil
            if not isnull((mp.GetExecutablesFromCommandLine)(l_0_32)) then
              local l_0_38 = nil
              do
                if #(mp.GetExecutablesFromCommandLine)(l_0_32) >= 1 then
                  local l_0_39 = nil
                  if not isnull((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_32))[1])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_32))[1])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_32))[1]), true, false) then
                    (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(((mp.GetExecutablesFromCommandLine)(l_0_32))[1]))
                  end
                end
                -- DECOMPILER ERROR at PC494: Confused about usage of register: R10 in 'UnsetPending'

                -- DECOMPILER ERROR at PC498: Confused about usage of register: R9 in 'UnsetPending'

                do
                  if #(mp.GetExecutablesFromCommandLine)(l_0_32) >= 2 then
                    local l_0_40 = nil
                    if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_39[2])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_39[2])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_39[2]), true, false) then
                      (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_39[2]))
                    end
                  end
                  -- DECOMPILER ERROR at PC523: Confused about usage of register: R10 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC527: Confused about usage of register: R9 in 'UnsetPending'

                  do
                    if #(mp.GetExecutablesFromCommandLine)(l_0_32) >= 3 then
                      local l_0_41 = nil
                      if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_40[3])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_40[3])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_40[3]), true, false) then
                        (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_40[3]))
                      end
                    end
                    ;
                    (bm.add_related_string)("iis_shell_child_path", l_0_30, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("iis_shell_child_name", l_0_28, bm.RelatedStringBMReport)
                    ;
                    (bm.add_related_string)("iis_shell_cmd_len", tostring(#l_0_32), bm.RelatedStringBMReport)
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

