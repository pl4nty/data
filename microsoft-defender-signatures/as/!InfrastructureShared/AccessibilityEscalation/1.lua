local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.I"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.N"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_28
    end
  end
  L0_1 = Infrastructure_CleanImageFileDebugger
  L1_1 = "sethc.exe"
  L0_1(L1_1)
  goto lbl_238
  ::lbl_28::
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.J"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.O"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_50
    end
  end
  L0_1 = Infrastructure_CleanImageFileDebugger
  L1_1 = "utilman.exe"
  L0_1(L1_1)
  goto lbl_238
  ::lbl_50::
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.K"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.P"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_72
    end
  end
  L0_1 = Infrastructure_CleanImageFileDebugger
  L1_1 = "osk.exe"
  L0_1(L1_1)
  goto lbl_238
  ::lbl_72::
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.L"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.Q"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_94
    end
  end
  L0_1 = Infrastructure_CleanImageFileDebugger
  L1_1 = "magnify.exe"
  L0_1(L1_1)
  goto lbl_238
  ::lbl_94::
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.M"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.R"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_116
    end
  end
  L0_1 = Infrastructure_CleanImageFileDebugger
  L1_1 = "narrator.exe"
  L0_1(L1_1)
  goto lbl_238
  ::lbl_116::
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Behavior:Win32/AccessibilityEscalation.S"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 then
    L0_1 = Infrastructure_CleanImageFileDebugger
    L1_1 = "atbroker.exe"
    L0_1(L1_1)
  else
    L0_1 = string
    L0_1 = L0_1.match
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Name
    L2_1 = "Behavior:Win32/AccessibilityEscalation.AC"
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 then
      L0_1 = Infrastructure_CleanImageFileDebugger
      L1_1 = "displayswitch.exe"
      L0_1(L1_1)
    end
  end
else
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Trojan:Win32/AccessibilityEscalation.C"
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 then
    L0_1 = ipairs
    L1_1 = Remediation
    L1_1 = L1_1.Threat
    L1_1 = L1_1.Resources
    L0_1, L1_1, L2_1 = L0_1(L1_1)
    for L3_1, L4_1 in L0_1, L1_1, L2_1 do
      L5_1 = L4_1.Schema
      if L5_1 == "CmdLine" then
        L5_1 = L4_1.Path
        if L5_1 ~= nil then
          L5_1 = L4_1.Path
          if L5_1 ~= "" then
            L5_1 = string
            L5_1 = L5_1.match
            L6_1 = L4_1.Path
            L7_1 = "([^%s]+)"
            L5_1 = L5_1(L6_1, L7_1)
            if L5_1 ~= nil then
              L6_1 = #L5_1
              if 25 < L6_1 then
                L6_1 = sysio
                L6_1 = L6_1.IsFileExists
                L7_1 = L5_1
                L6_1 = L6_1(L7_1)
                if L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.lower
                  L7_1 = L5_1
                  L6_1 = L6_1(L7_1)
                  L5_1 = L6_1
                  L6_1 = string
                  L6_1 = L6_1.match
                  L7_1 = L5_1
                  L8_1 = "^(.*\\)([^\\]+)$"
                  L6_1, L7_1 = L6_1(L7_1, L8_1)
                  L8_1 = "\\windows\\system32\\"
                  L9_1 = {}
                  L9_1["utilman.exe"] = true
                  L9_1["sethc.exe"] = true
                  L9_1["osk.exe"] = true
                  L9_1["magnify.exe"] = true
                  L9_1["narrator.exe"] = true
                  L9_1["displayswitch.exe"] = true
                  L9_1["atbroker.exe"] = true
                  L10_1 = string
                  L10_1 = L10_1.sub
                  L11_1 = L6_1
                  L12_1 = #L8_1
                  L12_1 = -L12_1
                  L10_1 = L10_1(L11_1, L12_1)
                  if L10_1 == L8_1 then
                    L10_1 = L9_1[L7_1]
                    if L10_1 ~= nil then
                      L10_1 = sysio
                      L10_1 = L10_1.GetPEVersionInfo
                      L11_1 = L5_1
                      L10_1 = L10_1(L11_1)
                      L11_1 = L10_1 or L11_1
                      if L10_1 then
                        L11_1 = L10_1.OriginalFilename
                        if L11_1 then
                          L11_1 = string
                          L11_1 = L11_1.lower
                          L12_1 = L10_1.OriginalFilename
                          L11_1 = L11_1(L12_1)
                        end
                      end
                      L12_1 = {}
                      L12_1["netplwiz.exe"] = true
                      if L11_1 ~= nil then
                        L13_1 = L12_1[L11_1]
                        if L13_1 ~= nil then
                          L13_1 = sysio
                          L13_1 = L13_1.DeleteFile
                          L14_1 = L5_1
                          L13_1(L14_1)
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
::lbl_238::
