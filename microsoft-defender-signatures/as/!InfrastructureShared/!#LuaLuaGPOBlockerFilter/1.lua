local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.match
L3_1 = "^(.*)\\gpt.ini$"
L1_1 = L1_1(L2_1, L3_1)
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L3_1 = L2_1
L2_1 = L2_1.match
L4_1 = "^\\device\\mup\\.+\\sysvol\\.+\\policies\\{(%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x)}\\gpt.ini$"
L2_1 = L2_1(L3_1, L4_1)

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = pcall
  L2_2 = parseRegistryPol
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L3_2 = {}
    L3_2.error = L2_2
    return L3_2
  end
  L3_2 = #L2_2
  if L3_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = {}
  L4_2 = "^SOFTWARE\\Microsoft\\Windows Defender\\"
  L5_2 = "^SOFTWARE\\Policies\\Microsoft\\Windows Defender\\"
  L6_2 = ipairs
  L7_2 = L2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  for L9_2, L10_2 in L6_2, L7_2, L8_2 do
    L11_2 = L10_2.key
    L12_2 = L11_2
    L11_2 = L11_2.find
    L13_2 = L4_2
    L11_2 = L11_2(L12_2, L13_2)
    if not L11_2 then
      L11_2 = L10_2.key
      L12_2 = L11_2
      L11_2 = L11_2.find
      L13_2 = L5_2
      L11_2 = L11_2(L12_2, L13_2)
      if not L11_2 then
        goto lbl_112
      end
    end
    L11_2 = L10_2.data
    L12_2 = L10_2.typ
    if L12_2 == 1 then
      L12_2 = mp
      L12_2 = L12_2.utf16to8
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      L11_2 = L12_2
    else
      L12_2 = L10_2.typ
      if L12_2 == 4 then
        L12_2 = mp
        L12_2 = L12_2.readu_u32
        L13_2 = L11_2
        L14_2 = 1
        L12_2 = L12_2(L13_2, L14_2)
        L11_2 = L12_2
      end
    end
    L12_2 = #L3_2
    L12_2 = L12_2 + 1
    L13_2 = {}
    L14_2 = L10_2.key
    L13_2.key = L14_2
    L14_2 = MpCommon
    L14_2 = L14_2.NormalizeString
    L15_2 = L10_2.value
    L16_2 = "CmdLineNormalizationStandard"
    L14_2 = L14_2(L15_2, L16_2)
    L13_2.name = L14_2
    L13_2.value = L11_2
    L3_2[L12_2] = L13_2
    L12_2 = L10_2.key
    L13_2 = L12_2
    L12_2 = L12_2.find
    L14_2 = "Exclusions\\Paths"
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L12_2 = MpCommon
      L12_2 = L12_2.StringRegExpSearch
      L13_2 = "(c:?\\\\*\\*?%?$)"
      L14_2 = L11_2
      L12_2, L13_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L14_2 = AppendToRollingQueue
        L15_2 = "gpo_broad_exclusion"
        L16_2 = string
        L16_2 = L16_2.lower
        L17_2 = L11_2
        L16_2 = L16_2(L17_2)
        L17_2 = true
        L18_2 = 94608000
        L19_2 = 100
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
      end
    end
    L12_2 = L10_2.key
    L13_2 = L12_2
    L12_2 = L12_2.find
    L14_2 = "Exclusions\\Extensions"
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L12_2 = MpCommon
      L12_2 = L12_2.StringRegExpSearch
      L13_2 = "(([.*]+)?(exe|dll|bat|ps1)$)"
      L14_2 = L11_2
      L12_2, L13_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L14_2 = AppendToRollingQueue
        L15_2 = "gpo_broad_exclusion"
        L16_2 = string
        L16_2 = L16_2.lower
        L17_2 = L11_2
        L16_2 = L16_2(L17_2)
        L17_2 = true
        L18_2 = 94608000
        L19_2 = 100
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
      end
    end
    ::lbl_112::
  end
  L6_2 = #L3_2
  if L6_2 == 0 then
    L6_2 = nil
    return L6_2
  end
  return L3_2
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = sysio
  L1_2 = L1_2.GetFileSize
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.GetLastResult
  L2_2 = L2_2()
  L2_2 = L2_2.Success
  if not L2_2 then
    L2_2 = nil
    return L2_2
  end
  if 65536 < L1_2 then
    L2_2 = 65536
    L1_2 = L2_2 or L1_2
    if not L2_2 then
    end
  end
  L2_2 = sysio
  L2_2 = L2_2.ReadFile
  L3_2 = A0_2
  L4_2 = 0
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = sysio
  L3_2 = L3_2.GetLastResult
  L3_2 = L3_2()
  L3_2 = L3_2.Success
  if not L3_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = {}
  
  function L4_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L3_3 = "^SOFTWARE\\Microsoft\\Windows Defender\\"
    L4_3 = "^SOFTWARE\\Policies\\Microsoft\\Windows Defender\\"
    if A0_3 == "Properties" then
      L5_3 = A1_3.key
      if L5_3 then
        L5_3 = A1_3.key
        L6_3 = L5_3
        L5_3 = L5_3.find
        L7_3 = L3_3
        L5_3 = L5_3(L6_3, L7_3)
        if not L5_3 then
          L5_3 = A1_3.key
          L6_3 = L5_3
          L5_3 = L5_3.find
          L7_3 = L4_3
          L5_3 = L5_3(L6_3, L7_3)
          if not L5_3 then
            goto lbl_90
          end
        end
        L5_3 = A1_3.value
        L6_3 = A1_3.type
        if L6_3 == "REG_DWORD" then
          L6_3 = tonumber
          L7_3 = A1_3.value
          L8_3 = 16
          L6_3 = L6_3(L7_3, L8_3)
          L5_3 = L6_3
        end
        L6_3 = L3_2
        L7_3 = L3_2
        L7_3 = #L7_3
        L7_3 = L7_3 + 1
        L8_3 = {}
        L9_3 = A1_3.key
        L8_3.key = L9_3
        L9_3 = MpCommon
        L9_3 = L9_3.NormalizeString
        L10_3 = A1_3.name
        L11_3 = "CmdLineNormalizationStandard"
        L9_3 = L9_3(L10_3, L11_3)
        L8_3.name = L9_3
        L8_3.value = L5_3
        L6_3[L7_3] = L8_3
        L6_3 = A1_3.key
        L7_3 = L6_3
        L6_3 = L6_3.find
        L8_3 = "Exclusions\\Paths"
        L6_3 = L6_3(L7_3, L8_3)
        if L6_3 then
          L6_3 = MpCommon
          L6_3 = L6_3.StringRegExpSearch
          L7_3 = "(c:?\\\\*\\*?%?$)"
          L8_3 = L5_3
          L6_3, L7_3 = L6_3(L7_3, L8_3)
          if L6_3 then
            L8_3 = AppendToRollingQueue
            L9_3 = "gpo_broad_exclusion"
            L10_3 = string
            L10_3 = L10_3.lower
            L11_3 = L5_3
            L10_3 = L10_3(L11_3)
            L11_3 = true
            L12_3 = 94608000
            L13_3 = 100
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
          end
        end
        L6_3 = A1_3.key
        L7_3 = L6_3
        L6_3 = L6_3.find
        L8_3 = "Exclusions\\Extensions"
        L6_3 = L6_3(L7_3, L8_3)
        if L6_3 then
          L6_3 = MpCommon
          L6_3 = L6_3.StringRegExpSearch
          L7_3 = "(([.*]+)?(exe|dll|bat|ps1)$)"
          L8_3 = L5_3
          L6_3, L7_3 = L6_3(L7_3, L8_3)
          if L6_3 then
            L8_3 = AppendToRollingQueue
            L9_3 = "gpo_broad_exclusion"
            L10_3 = string
            L10_3 = L10_3.lower
            L11_3 = L5_3
            L10_3 = L10_3(L11_3)
            L11_3 = true
            L12_3 = 94608000
            L13_3 = 100
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
          end
        end
      end
    end
    ::lbl_90::
  end
  
  function L5_2()
    local L0_3, L1_3
  end
  
  L6_2 = pcall
  L7_2 = parseXML
  L8_2 = L2_2
  L9_2 = L4_2
  L10_2 = L5_2
  L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  if not L6_2 then
    L3_2.error = L7_2
  end
  L8_2 = next
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = nil
    return L8_2
  end
  return L3_2
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = sysio
  L1_2 = L1_2.GetFileSize
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.GetLastResult
  L2_2 = L2_2()
  L2_2 = L2_2.Success
  if not L2_2 then
    L2_2 = nil
    return L2_2
  end
  if 65536 < L1_2 then
    L2_2 = 65536
    L1_2 = L2_2 or L1_2
    if not L2_2 then
    end
  end
  L2_2 = sysio
  L2_2 = L2_2.ReadFile
  L3_2 = A0_2
  L4_2 = 0
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = sysio
  L3_2 = L3_2.GetLastResult
  L3_2 = L3_2()
  L3_2 = L3_2.Success
  if not L3_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = {}
  L13_2 = false
  
  function L14_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = L10_2
    if not L0_3 then
      return
    end
    L0_3 = string
    L0_3 = L0_3.format
    L1_3 = "%s %s"
    L2_3 = L10_2
    if not L2_3 then
      L2_3 = ""
    end
    L3_3 = L11_2
    if not L3_3 then
      L3_3 = ""
    end
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    if L0_3 ~= "" then
      L1_3 = string
      L1_3 = L1_3.lower
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = {}
      L3_3 = "\\windowsdefenderatponboardingscript.cmd"
      L4_3 = "\\windowsdefenderatplocalonboardingscript.cmd"
      L5_3 = "schtasks /change /tn \"\\microsoft\\windows\\diskcleanup\\silentcleanup\" /disable"
      L6_3 = "schtasks /change /tn \"\\microsoft\\windows\\certificateservicesclient\\aikcertenrolltask\" /disable"
      L7_3 = "c:\\program files (x86)\\common files\\adobe\\arm\\1.0\\adobearm.exe"
      L8_3 = "c:\\windows\\syswow64\\macromed\\flash\\flashplayerupdateservice.exe"
      L9_3 = "\\vgregion.se\\ifr$\\scriptandexec\\ps1\\"
      L10_3 = "\\vgregion.se\\ifr$\\scriptandexec\\exec\\"
      L11_3 = "c:\\windows\\system32\\restartsms.ps1"
      L12_3 = "c:\\windows\\system32\\pgrvpnlogonactions_1_3.ps1"
      L2_3[1] = L3_3
      L2_3[2] = L4_3
      L2_3[3] = L5_3
      L2_3[4] = L6_3
      L2_3[5] = L7_3
      L2_3[6] = L8_3
      L2_3[7] = L9_3
      L2_3[8] = L10_3
      L2_3[9] = L11_3
      L2_3[10] = L12_3
      L3_3 = ipairs
      L4_3 = L2_3
      L3_3, L4_3, L5_3 = L3_3(L4_3)
      for L6_3, L7_3 in L3_3, L4_3, L5_3 do
        L8_3 = string
        L8_3 = L8_3.find
        L9_3 = L7_3
        L10_3 = L1_3
        L8_3 = L8_3(L9_3, L10_3)
        if L8_3 then
          L8_3 = true
          L13_2 = L8_3
        end
      end
    end
    L1_3 = L13_2
    if not L1_3 then
      L1_3 = AppendToRollingQueue
      L2_3 = "gpo_schtasks"
      L3_3 = L0_3
      L4_3 = L2_1
      L5_3 = 946080000
      L6_3 = 300
      L7_3 = 0
      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
      L1_3 = sysio
      L1_3 = L1_3.CommandLineScan
      L2_3 = L0_3
      L3_3 = 0
      L1_3 = L1_3(L2_3, L3_3)
      L2_3 = L7_2
      L3_3 = L2_3
      L2_3 = L2_3.match
      L4_3 = "^([^\\]+)\\([^\\]+)$"
      L2_3, L3_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        L2_3 = ""
        L3_3 = L7_2
      end
      L4_3 = L12_2
      L5_3 = L12_2
      L5_3 = #L5_3
      L5_3 = L5_3 + 1
      L6_3 = {}
      L7_3 = L4_2
      L6_3.task_uid = L7_3
      L7_3 = L6_2
      L6_3.task_name = L7_3
      L7_3 = L5_2
      L6_3.changed_time = L7_3
      L7_3 = MpCommon
      L7_3 = L7_3.NormalizeString
      L8_3 = L0_3
      L9_3 = "CmdLineNormalizationStandard"
      L7_3 = L7_3(L8_3, L9_3)
      L6_3.cmdline = L7_3
      L7_3 = L1_3 or L7_3
      if not L1_3 then
        L7_3 = false
      end
      L6_3.scan_result = L7_3
      L7_3 = L9_2
      if L7_3 then
        L7_3 = MpCommon
        L7_3 = L7_3.NormalizeString
        L8_3 = L9_2
        L9_3 = "CmdLineNormalizationStandard"
        L7_3 = L7_3(L8_3, L9_3)
        if L7_3 then
          goto lbl_106
        end
      end
      L7_3 = ""
      ::lbl_106::
      L6_3.working_directory = L7_3
      L7_3 = crypto
      L7_3 = L7_3.Sha1Buffer
      L8_3 = L2_3
      L9_3 = 0
      L10_3 = #L2_3
      L7_3 = L7_3(L8_3, L9_3, L10_3)
      L6_3.domain = L7_3
      L7_3 = crypto
      L7_3 = L7_3.Sha1Buffer
      L8_3 = L3_3
      L9_3 = 0
      L10_3 = #L3_3
      L7_3 = L7_3(L8_3, L9_3, L10_3)
      L6_3.user = L7_3
      L7_3 = L8_2
      L7_3 = L7_3 and true or L7_3
      L6_3.pass = L7_3
      L4_3[L5_3] = L6_3
    end
  end
  
  function L15_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3
    if A2_3 and A1_3 then
      L3_3 = error
      L4_3 = "unexpected text in tag with attributes"
      L3_3(L4_3)
    else
      L3_3 = L3_2
      if not L3_3 then
        if A0_3 == "Task" or A0_3 == "ImmediateTask" then
          L3_3 = 1
          L3_2 = L3_3
        elseif A0_3 == "TaskV2" or A0_3 == "ImmediateTaskV2" then
          L3_3 = 2
          L3_2 = L3_3
        end
        L3_3 = A1_3.uid
        if not L3_3 then
          L3_3 = ""
        end
        L4_2 = L3_3
        L3_3 = A1_3.changed
        if not L3_3 then
          L3_3 = ""
        end
        L5_2 = L3_3
      else
        L3_3 = L3_2
        if L3_3 == 1 then
          if A0_3 == "Properties" then
            L3_3 = A1_3.appName
            L10_2 = L3_3
            L3_3 = A1_3.args
            L11_2 = L3_3
            L3_3 = A1_3.name
            if not L3_3 then
              L3_3 = ""
            end
            L6_2 = L3_3
            L3_3 = A1_3.runAs
            if not L3_3 then
              L3_3 = ""
            end
            L7_2 = L3_3
            L3_3 = A1_3.cpassword
            if not L3_3 then
              L3_3 = ""
            end
            L8_2 = L3_3
            L3_3 = A1_3.startIn
            if not L3_3 then
              L3_3 = ""
            end
            L9_2 = L3_3
          end
        else
          L3_3 = L3_2
          if L3_3 == 2 then
            if A0_3 == "Properties" then
              L3_3 = A1_3.name
              if not L3_3 then
                L3_3 = ""
              end
              L6_2 = L3_3
              L3_3 = A1_3.runAs
              if not L3_3 then
                L3_3 = ""
              end
              L7_2 = L3_3
              L3_3 = A1_3.cpassword
              if not L3_3 then
                L3_3 = ""
              end
              L8_2 = L3_3
            elseif A0_3 == "Command" then
              L10_2 = A2_3
            elseif A0_3 == "Arguments" then
              L11_2 = A2_3
            elseif A0_3 == "WorkingDirectory" then
              L9_2 = A2_3
            end
          end
        end
      end
    end
  end
  
  function L16_2(A0_3)
    local L1_3, L2_3
    L1_3 = L3_2
    if not L1_3 then
      return
    end
    L1_3 = L3_2
    if L1_3 == 1 then
      if A0_3 == "Task" or A0_3 == "ImmediateTask" then
        L1_3 = L14_2
        L1_3()
        L1_3 = nil
        L2_3 = nil
        L11_2 = L2_3
        L10_2 = L1_3
        L1_3 = nil
        L3_2 = L1_3
        L1_3 = nil
        L4_2 = L1_3
        L1_3 = nil
        L5_2 = L1_3
        L1_3 = nil
        L6_2 = L1_3
        L1_3 = nil
        L7_2 = L1_3
        L1_3 = nil
        L8_2 = L1_3
        L1_3 = nil
        L9_2 = L1_3
      end
    else
      L1_3 = L3_2
      if L1_3 == 2 then
        if A0_3 == "Exec" then
          L1_3 = L14_2
          L1_3()
          L1_3 = nil
          L2_3 = nil
          L11_2 = L2_3
          L10_2 = L1_3
          L1_3 = nil
          L9_2 = L1_3
        elseif A0_3 == "TaskV2" or A0_3 == "ImmediateTaskV2" then
          L1_3 = nil
          L3_2 = L1_3
          L1_3 = nil
          L4_2 = L1_3
          L1_3 = nil
          L5_2 = L1_3
          L1_3 = nil
          L6_2 = L1_3
          L1_3 = nil
          L7_2 = L1_3
          L1_3 = nil
          L8_2 = L1_3
        end
      end
    end
  end
  
  L17_2 = pcall
  L18_2 = parseXML
  L19_2 = L2_2
  L20_2 = L15_2
  L21_2 = L16_2
  L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
  if not L17_2 then
    L12_2.error = true
  end
  L18_2 = next
  L19_2 = L12_2
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = nil
    return L18_2
  end
  return L12_2
end

L6_1 = {}
L7_1 = {}
L8_1 = {}
L9_1 = L4_1
L10_1 = L1_1
L11_1 = "\\machine\\preferences\\registry\\registry.xml"
L10_1 = L10_1 .. L11_1
L9_1 = L9_1(L10_1)
L8_1.registry = L9_1
L9_1 = L5_1
L10_1 = L1_1
L11_1 = "\\machine\\preferences\\scheduledtasks\\scheduledtasks.xml"
L10_1 = L10_1 .. L11_1
L9_1 = L9_1(L10_1)
L8_1.scheduledtasks = L9_1
L7_1.preferences = L8_1
L8_1 = L3_1
L9_1 = L1_1
L10_1 = "\\machine\\registry.pol"
L9_1 = L9_1 .. L10_1
L8_1 = L8_1(L9_1)
L7_1.registry = L8_1
L6_1.machine = L7_1
L7_1 = {}
L8_1 = {}
L9_1 = L4_1
L10_1 = L1_1
L11_1 = "\\user\\preferences\\registry\\registry.xml"
L10_1 = L10_1 .. L11_1
L9_1 = L9_1(L10_1)
L8_1.registry = L9_1
L9_1 = L5_1
L10_1 = L1_1
L11_1 = "\\user\\preferences\\scheduledtasks\\scheduledtasks.xml"
L10_1 = L10_1 .. L11_1
L9_1 = L9_1(L10_1)
L8_1.scheduledtasks = L9_1
L7_1.preferences = L8_1
L8_1 = L3_1
L9_1 = L1_1
L10_1 = "\\user\\registry.pol"
L9_1 = L9_1 .. L10_1
L8_1 = L8_1(L9_1)
L7_1.registry = L8_1
L6_1.user = L7_1
L7_1 = next
L8_1 = L6_1.machine
L8_1 = L8_1.preferences
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = L6_1.machine
  L7_1 = L7_1.registry
  if not L7_1 then
    L7_1 = next
    L8_1 = L6_1.user
    L8_1 = L8_1.preferences
    L7_1 = L7_1(L8_1)
    if not L7_1 then
      L7_1 = L6_1.user
      L7_1 = L7_1.registry
      if not L7_1 then
        goto lbl_156
      end
    end
  end
end
L7_1 = crypto
L7_1 = L7_1.Sha1Buffer
L8_1 = L2_1
L9_1 = 0
L10_1 = #L2_1
L7_1 = L7_1(L8_1, L9_1, L10_1)
L8_1 = string
L8_1 = L8_1.format
L9_1 = "http://gpo.%s"
L10_1 = L7_1
L8_1 = L8_1(L9_1, L10_1)
L9_1 = tonumber
L10_1 = mp
L10_1 = L10_1.get_mpattributevalue
L11_1 = "Lua:GPOVersion"
L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L10_1(L11_1)
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
L10_1 = mp
L10_1 = L10_1.bitand
L11_1 = L9_1
L12_1 = 4294901760
L10_1 = L10_1(L11_1, L12_1)
L10_1 = L10_1 / 65536
L11_1 = mp
L11_1 = L11_1.bitand
L12_1 = L9_1
L13_1 = 65535
L11_1 = L11_1(L12_1, L13_1)
L12_1 = {}
L12_1.SIG_CONTEXT = "LUA_GENERIC"
L12_1.CONTENT_SOURCE = "GPO"
L12_1.TAG = "NOLOOKUP"
L12_1.GPO_USER_VERSION = L10_1
L12_1.GPO_MACHINE_VERSION = L11_1
L13_1 = safeJsonSerialize
L14_1 = L6_1
L13_1 = L13_1(L14_1)
L12_1.INFO = L13_1
L13_1 = pcall
L14_1 = mp
L14_1 = L14_1.GetUrlReputation
L15_1 = {}
L16_1 = L8_1
L15_1[1] = L16_1
L16_1 = L12_1
L13_1, L14_1 = L13_1(L14_1, L15_1, L16_1)
if L13_1 then
  L15_1 = L14_1.urls
  L15_1 = L15_1[1]
  L15_1 = L15_1.determination
  if L15_1 == 4 then
    L15_1 = AppendToRollingQueue
    L16_1 = "gpo_block"
    L17_1 = L2_1
    L18_1 = L9_1
    L19_1 = 28800
    L20_1 = 128
    L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
    L15_1 = mp
    L15_1 = L15_1.INFECTED
    return L15_1
  end
end
L15_1 = AppendToRollingQueue
L16_1 = "gpo_applied"
L17_1 = L2_1
L18_1 = L9_1
L19_1 = 31536000
L20_1 = 128
L15_1(L16_1, L17_1, L18_1, L19_1, L20_1)
L15_1 = mp
L15_1 = L15_1.INFECTED
do return L15_1 end
::lbl_156::
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
