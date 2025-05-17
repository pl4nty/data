-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d30b3d0db6634\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
local l_0_1 = false
if (this_sigattrlog[19]).matched then
  if (this_sigattrlog[19]).reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION or not (this_sigattrlog[19]).reg_block_usermode then
    return mp.CLEAN
  end
  l_0_0.type = "BM_REG_BLOCK"
  l_0_0.event = (this_sigattrlog[19]).utf8p1
else
  if (this_sigattrlog[20]).matched then
    if (this_sigattrlog[20]).reg_block_src ~= bm.BM_REG_BLOCK_TAMPER_PROTECTION or not (this_sigattrlog[20]).reg_block_usermode then
      return mp.CLEAN
    end
    l_0_0.type = "BM_REG_BLOCK"
    l_0_0.event = (this_sigattrlog[20]).utf8p1
  else
    if (this_sigattrlog[25]).matched then
      l_0_0.type = "BM_Exclusion"
      l_0_0.event = (this_sigattrlog[25]).utf8p1
    else
      if (this_sigattrlog[26]).matched then
        l_0_0.type = "BM_Exclusion"
        l_0_0.event = (this_sigattrlog[26]).utf8p1
      else
        if (this_sigattrlog[27]).matched then
          l_0_0.type = "AMSI_Exclusion"
          l_0_0.event = (this_sigattrlog[27]).utf8p2
        else
          if (this_sigattrlog[29]).matched then
            l_0_0.type = "BM_Exclusion_Wide"
            l_0_0.event = (this_sigattrlog[29]).utf8p1
          else
            if (this_sigattrlog[28]).matched then
              l_0_0.type = "BM_FW"
              l_0_0.event = (this_sigattrlog[28]).utf8p1
            else
              if (this_sigattrlog[21]).matched then
                l_0_0.type = "BM_REG_IGNORE"
                l_0_0.event = (this_sigattrlog[21]).utf8p1
              else
                if (this_sigattrlog[22]).matched then
                  l_0_0.type = "BM_REG_IGNORE"
                  l_0_0.event = (this_sigattrlog[22]).utf8p1
                else
                  if (this_sigattrlog[23]).matched then
                    l_0_0.type = "BM_REG_IGNORE"
                    l_0_0.event = (this_sigattrlog[23]).utf8p1
                  else
                    if (this_sigattrlog[24]).matched then
                      l_0_0.type = "BM_REG_IGNORE"
                      l_0_0.event = (this_sigattrlog[24]).utf8p1
                    else
                      l_0_1 = true
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
if l_0_1 then
  for l_0_5 = mp.SIGATTR_LOG_SZ, 1, -1 do
    local l_0_6 = sigattr_tail[l_0_5]
    if l_0_6.matched then
      if l_0_6.attribute == 16407 and l_0_6.utf8p2 then
        local l_0_7, l_0_8 = (MpCommon.StringRegExpSearch)("Trojan:Win32\\/MpTamper(SrvDisableAV|BlockNewFirewall|DisableFeatureWd|SvcCfg|BulkExcl|SvcCfg|SysAdmin|SrvStop|PsExec)", l_0_6.utf8p2)
        if l_0_7 then
          l_0_0.type = "CMD"
          l_0_0.event = l_0_6.utf8p2
          do
            do
              if l_0_6.utf8p1 == "BM_BLOCKPROCESSCREATE" then
                local l_0_9 = true
              else
              end
              l_0_0.blocked = false
              do break end
              if l_0_6.attribute == 16472 and l_0_6.utf8p1 then
                local l_0_10, l_0_11 = (MpCommon.StringRegExpSearch)("^Trojan:Win32\\/MpTamper(SrvDisableAV|DisableFeatureWd|BulkExcl)", l_0_6.utf8p1)
                if l_0_10 then
                  l_0_0.type = "AMSI"
                  l_0_0.event = l_0_6.utf8p1
                  do
                    do
                      do
                        if l_0_6.utf8p2 == "INFECTED" then
                          local l_0_12 = true
                        else
                        end
                        l_0_0.blocked = false
                        do break end
                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

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
local l_0_13 = false
local l_0_14 = false
local l_0_15 = {}
local l_0_16 = (bm.get_current_process_startup_info)()
local l_0_17 = (bm.get_imagepath)()
local l_0_18 = l_0_17:match("([^\\]+)$")
local l_0_19, l_0_20 = hasSeenBefore(l_0_18, l_0_0.event, 7, "TamperingAttemptInMachine")
if l_0_19 and l_0_20 > 3 then
  return mp.CLEAN
end
l_0_15.pid = l_0_16.ppid
l_0_15.imagePath = (bm.get_imagepath)()
l_0_15.friendly = (MpCommon.IsFriendlyProcess)(l_0_16.ppid)
l_0_15.cmdline = (mp.GetProcessCommandLine)(l_0_16.ppid) or ""
l_0_15.cmdline = (string.lower)(l_0_15.cmdline)
if not l_0_15.friendly then
  l_0_14 = true
end
local l_0_21 = {}
l_0_21[".bat"] = true
l_0_21[".cmd"] = true
l_0_21[".ps1"] = true
l_0_21[".vbs"] = true
l_0_15.scriptInCmdline = bm_AddRelatedFileFromCommandLine("bm", l_0_21, nil, 2)
if l_0_15.scriptInCmdline and next(l_0_15.scriptInCmdline) then
  l_0_13 = true
  l_0_15.hasScriptInCmdline = true
end
local l_0_22, l_0_23, l_0_24 = IsKeyInRollingQueue("ShellScripts", l_0_16.ppid, false)
l_0_15.shellScripts = {}
if l_0_22 then
  for l_0_28,l_0_29 in ipairs(l_0_24) do
    (table.insert)(l_0_15.shellScripts, l_0_29.value)
  end
end
do
  local l_0_30, l_0_31 = pcall(reportAVExcludedEntities)
  if l_0_30 then
    l_0_15.avExcludedEntities = l_0_31
  end
  l_0_0.procInfo = l_0_15
  local l_0_32, l_0_33 = (bm.get_process_relationships)()
  local l_0_34 = {}
  if l_0_32 then
    for l_0_38,l_0_39 in ipairs(l_0_32) do
      local l_0_40 = {}
      if l_0_39.ppid then
        l_0_40.ppid = l_0_39.ppid
        l_0_40.imagePath = l_0_39.image_path or ""
        l_0_40.friendly = (MpCommon.IsFriendlyProcess)(l_0_39.ppid)
        if not l_0_40.friendly then
          l_0_14 = true
        end
        l_0_40.cmdline = (string.lower)((mp.GetProcessCommandLine)(l_0_39.ppid) or "")
        l_0_40.scriptInCmdline = bm_AddRelatedFileFromCommandLine(l_0_40.cmdline, l_0_21, nil, 2)
        if l_0_40.scriptInCmdline and next(l_0_40.scriptInCmdline) then
          l_0_13 = true
          l_0_40.hasScriptInCmdline = true
        end
        if l_0_39.reason == bm.RELATIONSHIP_CREATED then
          l_0_40.reason = "CREATED"
        else
          if l_0_39.reason == bm.RELATIONSHIP_INJECTION then
            l_0_40.reason = "INJECTION"
          end
        end
        local l_0_41, l_0_42, l_0_43 = IsKeyInRollingQueue("ShellScripts", l_0_39.ppid, false)
        l_0_40.shellScripts = {}
        if l_0_41 then
          for l_0_47,l_0_48 in ipairs(l_0_43) do
            (table.insert)(l_0_40.shellScripts, l_0_48.value)
            l_0_13 = true
          end
        end
        do
          do
            ;
            (table.insert)(l_0_34, l_0_40)
            -- DECOMPILER ERROR at PC424: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC424: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC424: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  l_0_0.parents = l_0_34
  local l_0_49 = {}
  l_0_49.BM_Exclusion = 5
  l_0_49.BM_REG_IGNORE = 50
  l_0_49.BM_REG_BLOCK = 50
  l_0_49.BM_Exclusion_Wide = 50
  l_0_49.BM_FW = 100
  l_0_49.CMD = 50
  l_0_49.AMSI = 50
  l_0_49.AMSI_Exclusion = 5
  l_0_0.weight = l_0_49[l_0_0.type]
  l_0_0.event = (string.lower)(l_0_0.event)
  local l_0_50 = {}
  l_0_50["reg.exe"] = 10
  l_0_50["cmd.exe"] = 10
  l_0_50["powershell.exe"] = 10
  l_0_50["regedit.exe"] = 10
  l_0_50["svchost.exe"] = 0
  l_0_50["services.exe"] = 0
  l_0_50["wmiprvse.exe"] = 0
  l_0_50["csrss.exe"] = 0
  l_0_50["lsass.exe"] = 0
  l_0_50["acmpclientservice.exe"] = 0
  l_0_50["ccmexec.exe"] = 0
  l_0_50["taniumcx.exe"] = 0
  l_0_50.default = 1
  if l_0_0.type == "BM_Exclusion" then
    local l_0_51 = l_0_0.event
    local l_0_52 = 3600
    local l_0_53 = 100
    local l_0_54 = "exclusion_events"
    if IsKeyInRollingQueue(l_0_54, l_0_51, true) then
      return mp.CLEAN
    end
    AppendToRollingQueue(l_0_54, l_0_51, 1, l_0_52, l_0_53)
    if (string.find)(l_0_0.event, "exclusions\\paths", 1, true) then
      l_0_0.type = "BM_Exclusion_Path"
    else
      if (string.find)(l_0_0.event, "exclusions\\extensions", 1, true) then
        l_0_0.type = "BM_Exclusion_Extension"
      else
        if (string.find)(l_0_0.event, "exclusions\\process", 1, true) then
          l_0_0.type = "BM_Exclusion_Process"
        else
          l_0_0.type = "BM_Exclusion_IP"
        end
      end
    end
    local l_0_55 = l_0_15.pid .. l_0_15.imagePath
    local l_0_56 = 3600
    local l_0_57 = 100
    local l_0_58 = "exclusion_events_pid"
    local l_0_59 = GetRollingQueueKeyValue(l_0_58, l_0_55)
    if l_0_59 then
      AppendToRollingQueue(l_0_58, l_0_55, l_0_59 + 1, l_0_56, l_0_57)
    else
      AppendToRollingQueue(l_0_58, l_0_55, 1, l_0_56, l_0_57)
      l_0_59 = 0
    end
    local l_0_60 = (string.lower)((l_0_15.imagePath):match("([^\\]+)$"))
    if not l_0_50[l_0_60] then
      l_0_0.weight = l_0_0.weight * l_0_50.default
      if l_0_0.weight == 0 then
        return mp.CLEAN
      end
      do
        local l_0_61, l_0_62 = (MpCommon.StringRegExpSearch)("(documents|downloads|pictures|music|videos)$|\\\\\\\\\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)", l_0_0.event)
        if l_0_61 then
          l_0_0.weight = l_0_0.weight * 10
        end
        if (l_0_0.event):find("(%w+%.%w+)$") or (l_0_0.event):find("(%.%w+)$") then
          l_0_61 = (MpCommon.StringRegExpSearch)("[\\\\\\.](exe|dll|ps1|bat|cmd|sys)$", l_0_0.event)
          if l_0_61 and not (l_0_0.event):match("\\extensions\\\\") then
            l_0_0.weight = l_0_0.weight / (l_0_59 + 1)
          end
        end
        l_0_0.weight = 0
        if l_0_0.weight == 0 then
          return mp.CLEAN
        end
        if l_0_0.type == "AMSI_Exclusion" then
          local l_0_63 = l_0_0.event
          local l_0_64 = 3600
          local l_0_65 = 100
          local l_0_66 = "exclusion_events"
          if IsKeyInRollingQueue(l_0_66, l_0_63, true) then
            return mp.CLEAN
          end
          AppendToRollingQueue(l_0_66, l_0_63, 1, l_0_64, l_0_65)
          local l_0_67, l_0_68, l_0_69 = IsKeyInRollingQueue("WDAVExclusion", l_0_63)
          l_0_0.weight = 0
          local l_0_70 = {}
          if l_0_67 then
            for l_0_74,l_0_75 in ipairs(l_0_69) do
              local l_0_76 = (string.lower)(l_0_75.value)
              if not in_array(l_0_70, l_0_76) then
                (table.insert)(l_0_70, l_0_76)
                local l_0_77 = l_0_15.pid .. l_0_15.imagePath
                local l_0_78 = "exclusion_events_pid"
                local l_0_79 = GetRollingQueueKeyValue(l_0_78, l_0_77)
                if l_0_79 then
                  AppendToRollingQueue(l_0_78, l_0_77, l_0_79 + 1, l_0_64, l_0_65)
                else
                  AppendToRollingQueue(l_0_78, l_0_77, 1, l_0_64, l_0_65)
                  l_0_79 = 0
                end
                local l_0_81 = l_0_49.AMSI_Exclusion
                if not l_0_50[(l_0_15.imagePath):match("(%w+%.exe)$")] then
                  l_0_81 = l_0_81 * l_0_50.default
                  local l_0_82, l_0_83 = , (MpCommon.StringRegExpSearch)("(documents|downloads|pictures|music|videos)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)", l_0_76)
                  if l_0_83 then
                    l_0_81 = l_0_81 * 10
                    local l_0_80 = nil
                  end
                  do
                    do
                      -- DECOMPILER ERROR at PC735: Overwrote pending register: R38 in 'AssignReg'

                      -- DECOMPILER ERROR at PC739: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC739: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC739: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC739: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC739: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC752: Unhandled construct in 'MakeBoolean' P3

          if (not l_0_76:find("(%w+%.%w+)$") and not l_0_76:find("(%.%w+)$")) or not l_0_83 or l_0_0.weight == 0 then
            return mp.CLEAN
          end
        end
        do
          local l_0_84 = {}
          local l_0_85 = {}
          if l_0_0.type == "BM_REG_BLOCK" or l_0_0.type == "BM_REG_IGNORE" then
            local l_0_86 = l_0_0.event
            local l_0_87 = 3600
            local l_0_88 = 100
            local l_0_89 = "reg_events"
            if IsKeyInRollingQueue(l_0_89, l_0_86, true) then
              return mp.CLEAN
            end
            AppendToRollingQueue(l_0_89, l_0_86, 1, l_0_87, l_0_88)
            local l_0_90 = 0
            local l_0_91 = GetRollingQueueKeys(l_0_89)
            if not l_0_91 or l_0_90 <= 1 then
              local l_0_92 = (l_0_0.event):match("\\\\(%w+)")
            end
          end
          do
            if (l_0_0.type ~= "BM_REG_BLOCK" or ((not l_0_85[l_0_92] and l_0_50[l_0_18]) or l_0_0.weight == 0)) then
              return mp.CLEAN
            end
            if l_0_14 then
              local l_0_93 = {}
              local l_0_94 = {}
              local l_0_95 = reportSessionInformation()
              -- DECOMPILER ERROR at PC864: Overwrote pending register: R27 in 'AssignReg'

              if not l_0_95 then
                local l_0_97 = "TamperingTracking"
                local l_0_98 = l_0_90
                local l_0_99 = 100
                AppendToRollingQueue(l_0_97, safeJsonSerialize(l_0_0), l_0_0.weight, l_0_98, l_0_99)
                local l_0_100 = nil
                local l_0_101, l_0_102 = , CheckNewThresholdMet((GetRollingQueueSumOfValues(l_0_97)).sum, l_0_0.weight, l_0_93)
                -- DECOMPILER ERROR at PC897: Overwrote pending register: R35 in 'AssignReg'

                if l_0_102 then
                  (bm.trigger_sig)("MassTampering_" .. R35_PC891 .. "_Machine", R35_PC891)
                  if l_0_14 or l_0_13 or next(l_0_31) then
                    local l_0_103 = nil
                    -- DECOMPILER ERROR at PC913: Overwrote pending register: R35 in 'AssignReg'

                    do
                      do
                        if #l_0_31 == 1 then
                          local l_0_104, l_0_105 = true, next(R35_PC891)
                          -- DECOMPILER ERROR at PC920: Overwrote pending register: R38 in 'AssignReg'

                        end
                        -- DECOMPILER ERROR at PC940: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC942: Overwrote pending register: R37 in 'AssignReg'

                        -- DECOMPILER ERROR at PC944: Overwrote pending register: R37 in 'AssignReg'

                        if (R35_PC891 ~= "[]" and not (string.find)(R37_PC923, l_0_81, 1, true) and not (string.find)(R37_PC923, "windows\\system32\\svchost.exe", 1, true)) or l_0_104 then
                          (bm.trigger_sig)(R35_PC891, tostring(R37_PC923) .. R37_PC923 .. l_0_103 .. ";" .. l_0_97)
                        end
                        -- DECOMPILER ERROR at PC966: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC967: Overwrote pending register: R35 in 'AssignReg'

                        if l_0_95.User and (l_0_95.User).UserName and l_0_95.Session and (l_0_95.Session).Id then
                          local l_0_106 = nil
                          -- DECOMPILER ERROR at PC970: Overwrote pending register: R35 in 'AssignReg'

                          -- DECOMPILER ERROR at PC972: Overwrote pending register: R37 in 'AssignReg'

                          AppendToRollingQueue(R35_PC891, l_0_100, R37_PC923, l_0_98, l_0_99)
                          -- DECOMPILER ERROR at PC977: Confused about usage of register: R33 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC977: Overwrote pending register: R35 in 'AssignReg'

                          local l_0_107 = nil
                          -- DECOMPILER ERROR at PC979: Overwrote pending register: R35 in 'AssignReg'

                          -- DECOMPILER ERROR at PC981: Overwrote pending register: R37 in 'AssignReg'

                          local l_0_108, l_0_109 = , R35_PC891
                          -- DECOMPILER ERROR at PC986: Overwrote pending register: R37 in 'AssignReg'

                          -- DECOMPILER ERROR at PC987: Overwrote pending register: R37 in 'AssignReg'

                          -- DECOMPILER ERROR at PC996: Overwrote pending register: R41 in 'AssignReg'

                          -- DECOMPILER ERROR at PC997: Overwrote pending register: R39 in 'AssignReg'

                          if l_0_109 then
                            R37_PC923("MassTampering_" .. R39_PC991 .. "_User", R39_PC991)
                          end
                        end
                        do
                          -- DECOMPILER ERROR at PC1002: Overwrote pending register: R35 in 'AssignReg'

                          -- DECOMPILER ERROR at PC1004: Overwrote pending register: R37 in 'AssignReg'

                          if (string.find)(l_0_0.type, l_0_109, 1, R37_PC923) then
                            local l_0_110 = nil
                            local l_0_111 = "AVExclusions"
                            local l_0_112 = 946080000
                            -- DECOMPILER ERROR at PC1012: Overwrote pending register: R37 in 'AssignReg'

                            -- DECOMPILER ERROR at PC1014: Overwrote pending register: R39 in 'AssignReg'

                            AppendToRollingQueue(R37_PC923, l_0_0.event, R39_PC991, l_0_112, R41_PC997)
                          end
                          do
                            do
                              do return mp.CLEAN end
                              -- DECOMPILER ERROR at PC1021: freeLocal<0 in 'ReleaseLocals'

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

