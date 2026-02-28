local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = false
L2_1 = this_sigattrlog
L2_1 = L2_1[19]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[19]
  L2_1 = L2_1.reg_block_src
  L3_1 = bm
  L3_1 = L3_1.BM_REG_BLOCK_TAMPER_PROTECTION
  if L2_1 == L3_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[19]
    L2_1 = L2_1.reg_block_usermode
    if L2_1 then
      goto lbl_30
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_30::
  L0_1.type = "BM_REG_BLOCK"
  L2_1 = this_sigattrlog
  L2_1 = L2_1[19]
  L2_1 = L2_1.utf8p1
  L0_1.event = L2_1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[20]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[20]
    L2_1 = L2_1.reg_block_src
    L3_1 = bm
    L3_1 = L3_1.BM_REG_BLOCK_TAMPER_PROTECTION
    if L2_1 == L3_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[20]
      L2_1 = L2_1.reg_block_usermode
      if L2_1 then
        goto lbl_56
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_56::
    L0_1.type = "BM_REG_BLOCK"
    L2_1 = this_sigattrlog
    L2_1 = L2_1[20]
    L2_1 = L2_1.utf8p1
    L0_1.event = L2_1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[25]
    L2_1 = L2_1.matched
    if L2_1 then
      L0_1.type = "BM_Exclusion"
      L2_1 = this_sigattrlog
      L2_1 = L2_1[25]
      L2_1 = L2_1.utf8p1
      L0_1.event = L2_1
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[26]
      L2_1 = L2_1.matched
      if L2_1 then
        L0_1.type = "BM_Exclusion"
        L2_1 = this_sigattrlog
        L2_1 = L2_1[26]
        L2_1 = L2_1.utf8p1
        L0_1.event = L2_1
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[27]
        L2_1 = L2_1.matched
        if L2_1 then
          L0_1.type = "AMSI_Exclusion"
          L2_1 = this_sigattrlog
          L2_1 = L2_1[27]
          L2_1 = L2_1.utf8p2
          L0_1.event = L2_1
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[29]
          L2_1 = L2_1.matched
          if L2_1 then
            L0_1.type = "BM_Exclusion_Wide"
            L2_1 = this_sigattrlog
            L2_1 = L2_1[29]
            L2_1 = L2_1.utf8p1
            L0_1.event = L2_1
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[28]
            L2_1 = L2_1.matched
            if L2_1 then
              L0_1.type = "BM_FW"
              L2_1 = this_sigattrlog
              L2_1 = L2_1[28]
              L2_1 = L2_1.utf8p1
              L0_1.event = L2_1
            else
              L2_1 = this_sigattrlog
              L2_1 = L2_1[21]
              L2_1 = L2_1.matched
              if L2_1 then
                L0_1.type = "BM_REG_IGNORE"
                L2_1 = this_sigattrlog
                L2_1 = L2_1[21]
                L2_1 = L2_1.utf8p1
                L0_1.event = L2_1
              else
                L2_1 = this_sigattrlog
                L2_1 = L2_1[22]
                L2_1 = L2_1.matched
                if L2_1 then
                  L0_1.type = "BM_REG_IGNORE"
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[22]
                  L2_1 = L2_1.utf8p1
                  L0_1.event = L2_1
                else
                  L2_1 = this_sigattrlog
                  L2_1 = L2_1[23]
                  L2_1 = L2_1.matched
                  if L2_1 then
                    L0_1.type = "BM_REG_IGNORE"
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[23]
                    L2_1 = L2_1.utf8p1
                    L0_1.event = L2_1
                  else
                    L2_1 = this_sigattrlog
                    L2_1 = L2_1[24]
                    L2_1 = L2_1.matched
                    if L2_1 then
                      L0_1.type = "BM_REG_IGNORE"
                      L2_1 = this_sigattrlog
                      L2_1 = L2_1[24]
                      L2_1 = L2_1.utf8p1
                      L0_1.event = L2_1
                    else
                      L1_1 = true
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
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.SIGATTR_LOG_SZ
  L3_1 = 1
  L4_1 = -1
  for L5_1 = L2_1, L3_1, L4_1 do
    L6_1 = sigattr_tail
    L6_1 = L6_1[L5_1]
    L7_1 = L6_1.matched
    if L7_1 then
      L7_1 = L6_1.attribute
      if L7_1 == 16407 then
        L7_1 = L6_1.utf8p2
        if L7_1 then
          L7_1 = MpCommon
          L7_1 = L7_1.StringRegExpSearch
          L8_1 = "Trojan:Win32\\/MpTamper(SrvDisableAV|BlockNewFirewall|DisableFeatureWd|SvcCfg|BulkExcl|SvcCfg|SysAdmin|SrvStop|PsExec)"
          L9_1 = L6_1.utf8p2
          L7_1, L8_1 = L7_1(L8_1, L9_1)
          if L7_1 then
            L0_1.type = "CMD"
            L9_1 = L6_1.utf8p2
            L0_1.event = L9_1
            L9_1 = L6_1.utf8p1
            L9_1 = L9_1 == "BM_BLOCKPROCESSCREATE" and L9_1
            L0_1.blocked = L9_1
            break
          end
      end
      else
        L7_1 = L6_1.attribute
        if L7_1 == 16472 then
          L7_1 = L6_1.utf8p1
          if L7_1 then
            L7_1 = MpCommon
            L7_1 = L7_1.StringRegExpSearch
            L8_1 = "^Trojan:Win32\\/MpTamper(SrvDisableAV|DisableFeatureWd|BulkExcl)"
            L9_1 = L6_1.utf8p1
            L7_1, L8_1 = L7_1(L8_1, L9_1)
            if L7_1 then
              L0_1.type = "AMSI"
              L9_1 = L6_1.utf8p1
              L0_1.event = L9_1
              L9_1 = L6_1.utf8p2
              L9_1 = L9_1 == "INFECTED" and L9_1
              L0_1.blocked = L9_1
              break
            end
          end
        end
      end
    end
  end
end
L2_1 = false
L3_1 = false
L4_1 = {}
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
L6_1 = bm
L6_1 = L6_1.get_imagepath
L6_1 = L6_1()
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "([^\\]+)$"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = hasSeenBefore
L9_1 = L7_1
L10_1 = L0_1.event
L11_1 = 7
L12_1 = "TamperingAttemptInMachine"
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 and 3 < L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = L5_1.ppid
L4_1.pid = L10_1
L10_1 = bm
L10_1 = L10_1.get_imagepath
L10_1 = L10_1()
L4_1.imagePath = L10_1
L10_1 = MpCommon
L10_1 = L10_1.IsFriendlyProcess
L11_1 = L5_1.ppid
L10_1 = L10_1(L11_1)
L4_1.friendly = L10_1
L10_1 = mp
L10_1 = L10_1.GetProcessCommandLine
L11_1 = L5_1.ppid
L10_1 = L10_1(L11_1)
if not L10_1 then
  L10_1 = ""
end
L4_1.cmdline = L10_1
L10_1 = string
L10_1 = L10_1.lower
L11_1 = L4_1.cmdline
L10_1 = L10_1(L11_1)
L4_1.cmdline = L10_1
L10_1 = L4_1.friendly
if not L10_1 then
  L3_1 = true
end
L10_1 = {}
L10_1[".bat"] = true
L10_1[".cmd"] = true
L10_1[".ps1"] = true
L10_1[".vbs"] = true
L11_1 = bm_AddRelatedFileFromCommandLine
L12_1 = "bm"
L13_1 = L10_1
L14_1 = nil
L15_1 = 2
L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
L4_1.scriptInCmdline = L11_1
L11_1 = L4_1.scriptInCmdline
if L11_1 then
  L11_1 = next
  L12_1 = L4_1.scriptInCmdline
  L11_1 = L11_1(L12_1)
  if L11_1 then
    L2_1 = true
    L4_1.hasScriptInCmdline = true
  end
end
L11_1 = IsKeyInRollingQueue
L12_1 = "ShellScripts"
L13_1 = L5_1.ppid
L14_1 = false
L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1, L14_1)
L14_1 = {}
L4_1.shellScripts = L14_1
if L11_1 then
  L14_1 = ipairs
  L15_1 = L13_1
  L14_1, L15_1, L16_1 = L14_1(L15_1)
  for L17_1, L18_1 in L14_1, L15_1, L16_1 do
    L19_1 = table
    L19_1 = L19_1.insert
    L20_1 = L4_1.shellScripts
    L21_1 = L18_1.value
    L19_1(L20_1, L21_1)
  end
end
L14_1 = pcall
L15_1 = reportAVExcludedEntities
L14_1, L15_1 = L14_1(L15_1)
if L14_1 then
  L4_1.avExcludedEntities = L15_1
end
L0_1.procInfo = L4_1
L16_1 = bm
L16_1 = L16_1.get_process_relationships
L16_1, L17_1 = L16_1()
L18_1 = {}
if L16_1 then
  L19_1 = ipairs
  L20_1 = L16_1
  L19_1, L20_1, L21_1 = L19_1(L20_1)
  for L22_1, L23_1 in L19_1, L20_1, L21_1 do
    L24_1 = {}
    L25_1 = L23_1.ppid
    if L25_1 then
      L25_1 = L23_1.ppid
      L24_1.ppid = L25_1
      L25_1 = L23_1.image_path
      if not L25_1 then
        L25_1 = ""
      end
      L24_1.imagePath = L25_1
      L25_1 = MpCommon
      L25_1 = L25_1.IsFriendlyProcess
      L26_1 = L23_1.ppid
      L25_1 = L25_1(L26_1)
      L24_1.friendly = L25_1
      L25_1 = L24_1.friendly
      if not L25_1 then
        L3_1 = true
      end
      L25_1 = string
      L25_1 = L25_1.lower
      L26_1 = mp
      L26_1 = L26_1.GetProcessCommandLine
      L27_1 = L23_1.ppid
      L26_1 = L26_1(L27_1)
      if not L26_1 then
        L26_1 = ""
      end
      L25_1 = L25_1(L26_1)
      L24_1.cmdline = L25_1
      L25_1 = bm_AddRelatedFileFromCommandLine
      L26_1 = L24_1.cmdline
      L27_1 = L10_1
      L28_1 = nil
      L29_1 = 2
      L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
      L24_1.scriptInCmdline = L25_1
      L25_1 = L24_1.scriptInCmdline
      if L25_1 then
        L25_1 = next
        L26_1 = L24_1.scriptInCmdline
        L25_1 = L25_1(L26_1)
        if L25_1 then
          L2_1 = true
          L24_1.hasScriptInCmdline = true
        end
      end
      L25_1 = L23_1.reason
      L26_1 = bm
      L26_1 = L26_1.RELATIONSHIP_CREATED
      if L25_1 == L26_1 then
        L24_1.reason = "CREATED"
      else
        L25_1 = L23_1.reason
        L26_1 = bm
        L26_1 = L26_1.RELATIONSHIP_INJECTION
        if L25_1 == L26_1 then
          L24_1.reason = "INJECTION"
        end
      end
      L25_1 = IsKeyInRollingQueue
      L26_1 = "ShellScripts"
      L27_1 = L23_1.ppid
      L28_1 = false
      L25_1, L26_1, L27_1 = L25_1(L26_1, L27_1, L28_1)
      L28_1 = {}
      L24_1.shellScripts = L28_1
      if L25_1 then
        L28_1 = ipairs
        L29_1 = L27_1
        L28_1, L29_1, L30_1 = L28_1(L29_1)
        for L31_1, L32_1 in L28_1, L29_1, L30_1 do
          L33_1 = table
          L33_1 = L33_1.insert
          L34_1 = L24_1.shellScripts
          L35_1 = L32_1.value
          L33_1(L34_1, L35_1)
          L2_1 = true
        end
      end
      L28_1 = table
      L28_1 = L28_1.insert
      L29_1 = L18_1
      L30_1 = L24_1
      L28_1(L29_1, L30_1)
    end
  end
end
L0_1.parents = L18_1
L19_1 = {}
L19_1.BM_Exclusion = 5
L19_1.BM_REG_IGNORE = 50
L19_1.BM_REG_BLOCK = 50
L19_1.BM_Exclusion_Wide = 50
L19_1.BM_FW = 100
L19_1.CMD = 50
L19_1.AMSI = 50
L19_1.AMSI_Exclusion = 5
L20_1 = L0_1.type
L20_1 = L19_1[L20_1]
L0_1.weight = L20_1
L20_1 = string
L20_1 = L20_1.lower
L21_1 = L0_1.event
L20_1 = L20_1(L21_1)
L0_1.event = L20_1
L20_1 = {}
L20_1["reg.exe"] = 10
L20_1["cmd.exe"] = 10
L20_1["powershell.exe"] = 10
L20_1["regedit.exe"] = 10
L20_1["svchost.exe"] = 0
L20_1["services.exe"] = 0
L20_1["wmiprvse.exe"] = 0
L20_1["csrss.exe"] = 0
L20_1["lsass.exe"] = 0
L20_1["acmpclientservice.exe"] = 0
L20_1["ccmexec.exe"] = 0
L20_1["taniumcx.exe"] = 0
L20_1.default = 1
L21_1 = L0_1.type
if L21_1 == "BM_Exclusion" then
  L21_1 = L0_1.event
  L22_1 = 3600
  L23_1 = 100
  L24_1 = "exclusion_events"
  L25_1 = IsKeyInRollingQueue
  L26_1 = L24_1
  L27_1 = L21_1
  L28_1 = true
  L25_1 = L25_1(L26_1, L27_1, L28_1)
  if L25_1 then
    L25_1 = mp
    L25_1 = L25_1.CLEAN
    return L25_1
  end
  L25_1 = AppendToRollingQueue
  L26_1 = L24_1
  L27_1 = L21_1
  L28_1 = 1
  L29_1 = L22_1
  L30_1 = L23_1
  L25_1(L26_1, L27_1, L28_1, L29_1, L30_1)
  L25_1 = string
  L25_1 = L25_1.find
  L26_1 = L0_1.event
  L27_1 = "exclusions\\paths"
  L28_1 = 1
  L29_1 = true
  L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
  if L25_1 then
    L0_1.type = "BM_Exclusion_Path"
  else
    L25_1 = string
    L25_1 = L25_1.find
    L26_1 = L0_1.event
    L27_1 = "exclusions\\extensions"
    L28_1 = 1
    L29_1 = true
    L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
    if L25_1 then
      L0_1.type = "BM_Exclusion_Extension"
    else
      L25_1 = string
      L25_1 = L25_1.find
      L26_1 = L0_1.event
      L27_1 = "exclusions\\process"
      L28_1 = 1
      L29_1 = true
      L25_1 = L25_1(L26_1, L27_1, L28_1, L29_1)
      if L25_1 then
        L0_1.type = "BM_Exclusion_Process"
      else
        L0_1.type = "BM_Exclusion_IP"
      end
    end
  end
  L25_1 = L4_1.pid
  L26_1 = L4_1.imagePath
  L25_1 = L25_1 .. L26_1
  L26_1 = 3600
  L27_1 = 100
  L28_1 = "exclusion_events_pid"
  L29_1 = GetRollingQueueKeyValue
  L30_1 = L28_1
  L31_1 = L25_1
  L29_1 = L29_1(L30_1, L31_1)
  if L29_1 then
    L30_1 = AppendToRollingQueue
    L31_1 = L28_1
    L32_1 = L25_1
    L33_1 = L29_1 + 1
    L34_1 = L26_1
    L35_1 = L27_1
    L30_1(L31_1, L32_1, L33_1, L34_1, L35_1)
  else
    L30_1 = AppendToRollingQueue
    L31_1 = L28_1
    L32_1 = L25_1
    L33_1 = 1
    L34_1 = L26_1
    L35_1 = L27_1
    L30_1(L31_1, L32_1, L33_1, L34_1, L35_1)
    L29_1 = 0
  end
  L30_1 = string
  L30_1 = L30_1.lower
  L31_1 = L4_1.imagePath
  L32_1 = L31_1
  L31_1 = L31_1.match
  L33_1 = "([^\\]+)$"
  L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1 = L31_1(L32_1, L33_1)
  L30_1 = L30_1(L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1)
  L31_1 = L0_1.weight
  L32_1 = L20_1[L30_1]
  if not L32_1 then
    L32_1 = L20_1.default
  end
  L31_1 = L31_1 * L32_1
  L0_1.weight = L31_1
  L31_1 = L0_1.weight
  if L31_1 == 0 then
    L31_1 = mp
    L31_1 = L31_1.CLEAN
    return L31_1
  end
  L31_1 = MpCommon
  L31_1 = L31_1.StringRegExpSearch
  L32_1 = "(documents|downloads|pictures|music|videos)$|\\\\\\\\\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)"
  L33_1 = L0_1.event
  L31_1, L32_1 = L31_1(L32_1, L33_1)
  if L31_1 then
    L33_1 = L0_1.weight
    L33_1 = L33_1 * 10
    L0_1.weight = L33_1
  end
  L33_1 = L0_1.event
  L34_1 = L33_1
  L33_1 = L33_1.find
  L35_1 = "(%w+%.%w+)$"
  L33_1 = L33_1(L34_1, L35_1)
  if not L33_1 then
    L33_1 = L0_1.event
    L34_1 = L33_1
    L33_1 = L33_1.find
    L35_1 = "(%.%w+)$"
    L33_1 = L33_1(L34_1, L35_1)
    if not L33_1 then
      goto lbl_608
    end
  end
  L33_1 = MpCommon
  L33_1 = L33_1.StringRegExpSearch
  L34_1 = "[\\\\\\.](exe|dll|ps1|bat|cmd|sys)$"
  L35_1 = L0_1.event
  L33_1, L34_1 = L33_1(L34_1, L35_1)
  L32_1 = L34_1
  L31_1 = L33_1
  if L31_1 then
    L33_1 = L0_1.event
    L34_1 = L33_1
    L33_1 = L33_1.match
    L35_1 = "\\extensions\\\\"
    L33_1 = L33_1(L34_1, L35_1)
    if not L33_1 then
      L33_1 = L0_1.weight
      L34_1 = L29_1 + 1
      L33_1 = L33_1 / L34_1
      L0_1.weight = L33_1
    end
  else
    L0_1.weight = 0
  end
  ::lbl_608::
  L33_1 = L0_1.weight
  if L33_1 == 0 then
    L33_1 = mp
    L33_1 = L33_1.CLEAN
    return L33_1
  end
end
L21_1 = L0_1.type
if L21_1 == "AMSI_Exclusion" then
  L21_1 = L0_1.event
  L22_1 = 3600
  L23_1 = 100
  L24_1 = "exclusion_events"
  L25_1 = IsKeyInRollingQueue
  L26_1 = L24_1
  L27_1 = L21_1
  L28_1 = true
  L25_1 = L25_1(L26_1, L27_1, L28_1)
  if L25_1 then
    L25_1 = mp
    L25_1 = L25_1.CLEAN
    return L25_1
  end
  L25_1 = AppendToRollingQueue
  L26_1 = L24_1
  L27_1 = L21_1
  L28_1 = 1
  L29_1 = L22_1
  L30_1 = L23_1
  L25_1(L26_1, L27_1, L28_1, L29_1, L30_1)
  L25_1 = IsKeyInRollingQueue
  L26_1 = "WDAVExclusion"
  L27_1 = L21_1
  L25_1, L26_1, L27_1 = L25_1(L26_1, L27_1)
  L0_1.weight = 0
  L28_1 = {}
  if L25_1 then
    L29_1 = ipairs
    L30_1 = L27_1
    L29_1, L30_1, L31_1 = L29_1(L30_1)
    for L32_1, L33_1 in L29_1, L30_1, L31_1 do
      L34_1 = string
      L34_1 = L34_1.lower
      L35_1 = L33_1.value
      L34_1 = L34_1(L35_1)
      L35_1 = in_array
      L36_1 = L28_1
      L37_1 = L34_1
      L35_1 = L35_1(L36_1, L37_1)
      if not L35_1 then
        L35_1 = table
        L35_1 = L35_1.insert
        L36_1 = L28_1
        L37_1 = L34_1
        L35_1(L36_1, L37_1)
        L35_1 = L4_1.pid
        L36_1 = L4_1.imagePath
        L35_1 = L35_1 .. L36_1
        L36_1 = "exclusion_events_pid"
        L37_1 = GetRollingQueueKeyValue
        L38_1 = L36_1
        L39_1 = L35_1
        L37_1 = L37_1(L38_1, L39_1)
        if L37_1 then
          L38_1 = AppendToRollingQueue
          L39_1 = L36_1
          L40_1 = L35_1
          L41_1 = L37_1 + 1
          L42_1 = L22_1
          L43_1 = L23_1
          L38_1(L39_1, L40_1, L41_1, L42_1, L43_1)
        else
          L38_1 = AppendToRollingQueue
          L39_1 = L36_1
          L40_1 = L35_1
          L41_1 = 1
          L42_1 = L22_1
          L43_1 = L23_1
          L38_1(L39_1, L40_1, L41_1, L42_1, L43_1)
          L37_1 = 0
        end
        L38_1 = L19_1.AMSI_Exclusion
        L39_1 = L4_1.imagePath
        L40_1 = L39_1
        L39_1 = L39_1.match
        L41_1 = "(%w+%.exe)$"
        L39_1 = L39_1(L40_1, L41_1)
        L40_1 = L20_1[L39_1]
        if not L40_1 then
          L40_1 = L20_1.default
        end
        L38_1 = L38_1 * L40_1
        L40_1 = MpCommon
        L40_1 = L40_1.StringRegExpSearch
        L41_1 = "(documents|downloads|pictures|music|videos)$|\\|\\.?(exe|dll|ps1|bat|cmd|sys)$|(\\w:(\\\\*)?\\*?%?$)"
        L42_1 = L34_1
        L40_1, L41_1 = L40_1(L41_1, L42_1)
        if L40_1 then
          L38_1 = L38_1 * 10
        end
        L43_1 = L34_1
        L42_1 = L34_1.find
        L44_1 = "(%w+%.%w+)$"
        L42_1 = L42_1(L43_1, L44_1)
        if not L42_1 then
          L43_1 = L34_1
          L42_1 = L34_1.find
          L44_1 = "(%.%w+)$"
          L42_1 = L42_1(L43_1, L44_1)
          if not L42_1 then
            goto lbl_737
          end
        end
        L42_1 = MpCommon
        L42_1 = L42_1.StringRegExpSearch
        L43_1 = "[\\|\\.](exe|dll|ps1|bat|cmd|sys)$"
        L44_1 = L34_1
        L42_1, L43_1 = L42_1(L43_1, L44_1)
        L41_1 = L43_1
        L40_1 = L42_1
        if L40_1 then
          L43_1 = L34_1
          L42_1 = L34_1.match
          L44_1 = "^extension"
          L42_1 = L42_1(L43_1, L44_1)
          if not L42_1 then
            L42_1 = L37_1 + 1
            L38_1 = L38_1 / L42_1
          end
        else
          L38_1 = 0
        end
        ::lbl_737::
        L42_1 = L0_1.weight
        L42_1 = L42_1 + L38_1
        L0_1.weight = L42_1
      end
    end
  end
  L29_1 = table
  L29_1 = L29_1.concat
  L30_1 = L28_1
  L31_1 = ";"
  L29_1 = L29_1(L30_1, L31_1)
  L0_1.event = L29_1
  L29_1 = L0_1.weight
  if L29_1 == 0 then
    L29_1 = mp
    L29_1 = L29_1.CLEAN
    return L29_1
  end
end
L21_1 = {}
L21_1.disablearchivescanning = 4
L21_1["threatseveritydefaultaction\\2"] = 8
L21_1.disablescriptscanning = 20
L21_1["5"] = 33
L21_1["4"] = 33
L21_1.disableroutinelytakingaction = 50
L22_1 = {}
L22_1.disableantispyware = 5
L22_1.disableinformationprotectioncontrol = 6
L22_1.disablerawwritenotification = 6
L22_1.disablerealtimemonitoring = 7
L22_1.spynetreporting = 7
L22_1.disablebehaviormonitoring = 8
L22_1.disableintrusionpreventionsystem = 14
L22_1.disableioavprotection = 16
L22_1.disablescriptscanning = 50
L22_1.disableonaccessprotection = 50
L22_1.disablescanonrealtimeenable = 50
L23_1 = L0_1.type
if L23_1 ~= "BM_REG_BLOCK" then
  L23_1 = L0_1.type
  if L23_1 ~= "BM_REG_IGNORE" then
    goto lbl_843
  end
end
L23_1 = L0_1.event
L24_1 = 3600
L25_1 = 100
L26_1 = "reg_events"
L27_1 = IsKeyInRollingQueue
L28_1 = L26_1
L29_1 = L23_1
L30_1 = true
L27_1 = L27_1(L28_1, L29_1, L30_1)
if L27_1 then
  L27_1 = mp
  L27_1 = L27_1.CLEAN
  return L27_1
end
L27_1 = AppendToRollingQueue
L28_1 = L26_1
L29_1 = L23_1
L30_1 = 1
L31_1 = L24_1
L32_1 = L25_1
L27_1(L28_1, L29_1, L30_1, L31_1, L32_1)
L27_1 = 0
L28_1 = GetRollingQueueKeys
L29_1 = L26_1
L28_1 = L28_1(L29_1)
if L28_1 then
  L27_1 = #L28_1
end
if L27_1 <= 1 then
  L29_1 = L0_1.event
  L30_1 = L29_1
  L29_1 = L29_1.match
  L31_1 = "\\\\(%w+)"
  L29_1 = L29_1(L30_1, L31_1)
  L30_1 = L0_1.type
  if L30_1 == "BM_REG_BLOCK" then
    L30_1 = L21_1[L29_1]
    if not L30_1 then
      L30_1 = L19_1.BM_REG_BLOCK
    end
    L0_1.weight = L30_1
  else
    L30_1 = L0_1.type
    if L30_1 == "BM_REG_IGNORE" then
      L30_1 = L22_1[L29_1]
      if not L30_1 then
        L30_1 = L19_1.BM_REG_IGNORE
      end
      L0_1.weight = L30_1
      L30_1 = L0_1.weight
      L31_1 = L20_1[L7_1]
      if not L31_1 then
        L31_1 = L20_1.default
      end
      L30_1 = L30_1 * L31_1
      L0_1.weight = L30_1
      L30_1 = L0_1.weight
      if L30_1 == 0 then
        L30_1 = mp
        L30_1 = L30_1.CLEAN
        return L30_1
      end
    end
  end
end
::lbl_843::
if L3_1 then
  L23_1 = L0_1.weight
  L23_1 = L23_1 + 10
  L0_1.weight = L23_1
end
L23_1 = {}
L23_1[21] = "L"
L23_1[51] = "M"
L23_1[101] = "H"
L23_1[121] = "HP"
L24_1 = {}
L24_1[21] = "L"
L24_1[51] = "M"
L24_1[101] = "H"
L24_1[121] = "HP"
L25_1 = reportSessionInformation
L25_1 = L25_1()
L26_1 = L25_1 or L26_1
if not L25_1 then
  L26_1 = {}
end
L0_1.sessionInfo = L26_1
L26_1 = "TamperingTracking"
L27_1 = 3600
L28_1 = 100
L29_1 = safeJsonSerialize
L30_1 = L0_1
L29_1 = L29_1(L30_1)
L30_1 = AppendToRollingQueue
L31_1 = L26_1
L32_1 = L29_1
L33_1 = L0_1.weight
L34_1 = L27_1
L35_1 = L28_1
L30_1(L31_1, L32_1, L33_1, L34_1, L35_1)
L30_1 = GetRollingQueueSumOfValues
L31_1 = L26_1
L30_1 = L30_1(L31_1)
L31_1 = CheckNewThresholdMet
L32_1 = L30_1.sum
L33_1 = L0_1.weight
L34_1 = L23_1
L31_1, L32_1 = L31_1(L32_1, L33_1, L34_1)
if L31_1 then
  L33_1 = bm
  L33_1 = L33_1.trigger_sig
  L34_1 = "MassTampering_"
  L35_1 = L32_1
  L36_1 = "_Machine"
  L34_1 = L34_1 .. L35_1 .. L36_1
  L35_1 = tostring
  L36_1 = L30_1.sum
  L35_1 = L35_1(L36_1)
  L36_1 = ";"
  L37_1 = L26_1
  L35_1 = L35_1 .. L36_1 .. L37_1
  L33_1(L34_1, L35_1)
  if not L3_1 and not L2_1 then
    L33_1 = next
    L34_1 = L15_1
    L33_1 = L33_1(L34_1)
    if not L33_1 then
      goto lbl_951
    end
  end
  L33_1 = true
  L34_1 = #L15_1
  if L34_1 == 1 then
    L34_1 = next
    L35_1 = L15_1
    L34_1, L35_1 = L34_1(L35_1)
    if L35_1 ~= "[]" then
      L36_1 = string
      L36_1 = L36_1.find
      L37_1 = L35_1
      L38_1 = "c:\\windows\\system32\\wbem\\wmiprvse.exe"
      L39_1 = 1
      L40_1 = true
      L36_1 = L36_1(L37_1, L38_1, L39_1, L40_1)
      if not L36_1 then
        L36_1 = string
        L36_1 = L36_1.find
        L37_1 = L35_1
        L38_1 = "windows\\system32\\svchost.exe"
        L39_1 = 1
        L40_1 = true
        L36_1 = L36_1(L37_1, L38_1, L39_1, L40_1)
        if not L36_1 then
          goto lbl_937
        end
      end
    end
    L33_1 = false
  end
  ::lbl_937::
  if L33_1 then
    L34_1 = bm
    L34_1 = L34_1.trigger_sig
    L35_1 = "MassTampering_NonFriendly_Machine"
    L36_1 = tostring
    L37_1 = L30_1.sum
    L36_1 = L36_1(L37_1)
    L37_1 = ";"
    L38_1 = L32_1
    L39_1 = ";"
    L40_1 = L26_1
    L36_1 = L36_1 .. L37_1 .. L38_1 .. L39_1 .. L40_1
    L34_1(L35_1, L36_1)
  end
end
::lbl_951::
L33_1 = L25_1.User
if L33_1 then
  L33_1 = L25_1.User
  L33_1 = L33_1.UserName
  if L33_1 then
    L33_1 = L25_1.Session
    if L33_1 then
      L33_1 = L25_1.Session
      L33_1 = L33_1.Id
      if L33_1 then
        L33_1 = L26_1
        L34_1 = "-"
        L35_1 = L25_1.User
        L35_1 = L35_1.UserName
        L33_1 = L33_1 .. L34_1 .. L35_1
        L34_1 = AppendToRollingQueue
        L35_1 = L33_1
        L36_1 = L29_1
        L37_1 = L0_1.weight
        L38_1 = L27_1
        L39_1 = L28_1
        L34_1(L35_1, L36_1, L37_1, L38_1, L39_1)
        L34_1 = GetRollingQueueSumOfValues
        L35_1 = L33_1
        L34_1 = L34_1(L35_1)
        L35_1 = CheckNewThresholdMet
        L36_1 = L34_1.sum
        L37_1 = L0_1.weight
        L38_1 = L24_1
        L35_1, L36_1 = L35_1(L36_1, L37_1, L38_1)
        if L35_1 then
          L37_1 = bm
          L37_1 = L37_1.trigger_sig
          L38_1 = "MassTampering_"
          L39_1 = L36_1
          L40_1 = "_User"
          L38_1 = L38_1 .. L39_1 .. L40_1
          L39_1 = tostring
          L40_1 = L34_1.sum
          L39_1 = L39_1(L40_1)
          L40_1 = ";"
          L41_1 = L33_1
          L39_1 = L39_1 .. L40_1 .. L41_1
          L37_1(L38_1, L39_1)
        end
      end
    end
  end
end
L33_1 = string
L33_1 = L33_1.find
L34_1 = L0_1.type
L35_1 = "BM_Exclusion"
L36_1 = 1
L37_1 = true
L33_1 = L33_1(L34_1, L35_1, L36_1, L37_1)
if L33_1 then
  L33_1 = "AVExclusions"
  L34_1 = 946080000
  L35_1 = 100
  L36_1 = AppendToRollingQueue
  L37_1 = L33_1
  L38_1 = L0_1.event
  L39_1 = L29_1
  L40_1 = L34_1
  L41_1 = L35_1
  L36_1(L37_1, L38_1, L39_1, L40_1, L41_1)
end
L33_1 = mp
L33_1 = L33_1.CLEAN
return L33_1
