local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      L1_1 = L0_1.command_line
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "powershell"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L3_1 = L2_1.find
        L4_1 = "pwsh"
        L5_1 = 1
        L6_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        if not L3_1 then
          goto lbl_129
        end
      end
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "microsoft.skypeapp"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "final result:"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          goto lbl_48
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_48::
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "windows\\ccm"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "\\sysvol\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "\\netlogon\\"
          L6_1 = 1
          L7_1 = true
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            goto lbl_72
          end
        end
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      do return L3_1 end
      ::lbl_72::
      L4_1 = L2_1
      L3_1 = L2_1.match
      L5_1 = "%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        L3_1 = GetTacticsTableForPid
        L4_1 = L0_1.ppid
        L3_1 = L3_1(L4_1)
        if L3_1 ~= nil then
          L4_1 = type
          L5_1 = L3_1
          L4_1 = L4_1(L5_1)
          if L4_1 == "table" then
            L4_1 = 0
            L5_1 = L3_1.obfuscation_b64
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.intent_cred_enum_amsi
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.intent_schtask_amsi
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.intent_schtask_script
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.posh_remote_exec
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.posh_webaccess
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.posh_apiexec
            if L5_1 then
              L4_1 = L4_1 + 1
            end
            L5_1 = L3_1.amsi_bypass
            if L5_1 then
              L4_1 = L4_1 + 2
            end
            L5_1 = L3_1.amsitampering
            if L5_1 then
              L4_1 = L4_1 + 2
            end
            if 2 < L4_1 then
              L5_1 = mp
              L5_1 = L5_1.INFECTED
              return L5_1
            end
          end
        end
      end
    end
  end
end
::lbl_129::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
