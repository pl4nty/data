local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = sysio
  L3_2 = L3_2.RegExpandUserKey
  L4_2 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Shell Folders"
  L3_2 = L3_2(L4_2)
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = sysio
    L9_2 = L9_2.RegOpenKey
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L10_2 = sysio
      L10_2 = L10_2.GetRegValueAsString
      L11_2 = L9_2
      L12_2 = "Startup"
      L10_2 = L10_2(L11_2, L12_2)
      L2_2 = L10_2
      L10_2 = sysio
      L10_2 = L10_2.IsFolderExists
      L11_2 = L2_2
      L10_2 = L10_2(L11_2)
      if L10_2 then
        L10_2 = L2_2
        L11_2 = "\\"
        L12_2 = A0_2
        L10_2 = L10_2 .. L11_2 .. L12_2
        L11_2 = sysio
        L11_2 = L11_2.IsFileExists
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = sysio
          L11_2 = L11_2.GetFileSize
          L12_2 = L10_2
          L11_2 = L11_2(L12_2)
          if A1_2 == L11_2 then
            L11_2 = Remediation
            L11_2 = L11_2.BtrDeleteFile
            L12_2 = L10_2
            L11_2(L12_2)
          end
        end
      end
    end
  end
end

RemoveStartupFileCmpFileNameAndSize = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  if L3_2 then
    L5_2 = sysio
    L5_2 = L5_2.RegEnumValues
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    L6_2 = pairs
    L7_2 = L5_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    for L9_2, L10_2 in L6_2, L7_2, L8_2 do
      if L10_2 then
        L11_2 = sysio
        L11_2 = L11_2.GetRegValueAsString
        L12_2 = L3_2
        L13_2 = L10_2
        L11_2 = L11_2(L12_2, L13_2)
        L4_2 = L11_2
        if L4_2 then
          L11_2 = string
          L11_2 = L11_2.lower
          L12_2 = L4_2
          L11_2 = L11_2(L12_2)
          L4_2 = L11_2
          L11_2 = sysio
          L11_2 = L11_2.IsFileExists
          L12_2 = L4_2
          L11_2 = L11_2(L12_2)
          if L11_2 then
            L11_2 = string
            L11_2 = L11_2.find
            L12_2 = L4_2
            L13_2 = A1_2
            L14_2 = 1
            L15_2 = true
            L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
            if L11_2 then
              L11_2 = sysio
              L11_2 = L11_2.GetFileSize
              L12_2 = L4_2
              L11_2 = L11_2(L12_2)
              if A2_2 == L11_2 then
                L11_2 = sysio
                L11_2 = L11_2.DeleteRegValue
                L12_2 = L3_2
                L13_2 = L10_2
                L11_2(L12_2, L13_2)
                L11_2 = true
                return L11_2
              end
            end
          end
        end
      end
    end
  end
  L5_2 = false
  return L5_2
end

CompareRegValueFileSizeAndRemove = L0_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A1_2 and 256 < A2_2 then
    L3_2 = CompareRegValueFileSizeAndRemove
    L4_2 = "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
    L5_2 = A1_2
    L6_2 = A2_2
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = pairs
    L4_2 = A0_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L8_2 = CompareRegValueFileSizeAndRemove
      L9_2 = L7_2
      L10_2 = A1_2
      L11_2 = A2_2
      L8_2(L9_2, L10_2, L11_2)
    end
    L3_2 = sysio
    L3_2 = L3_2.RegExpandUserKey
    L4_2 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce"
    L3_2 = L3_2(L4_2)
    L4_2 = pairs
    L5_2 = L3_2
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    for L7_2, L8_2 in L4_2, L5_2, L6_2 do
      L9_2 = CompareRegValueFileSizeAndRemove
      L10_2 = L8_2
      L11_2 = A1_2
      L12_2 = A2_2
      L9_2(L10_2, L11_2, L12_2)
    end
    L4_2 = RemoveStartupFileCmpFileNameAndSize
    L5_2 = A1_2
    L6_2 = A2_2
    L4_2(L5_2, L6_2)
  end
end

RemoveCrowtiASEPs = L0_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = nil
  L1_1 = nil
  L2_1 = nil
  L3_1 = nil
  L4_1 = nil
  L5_1 = sysio
  L5_1 = L5_1.RegExpandUserKey
  L6_1 = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run"
  L5_1 = L5_1(L6_1)
  L6_1 = pairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = sysio
    L11_1 = L11_1.RegOpenKey
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    L0_1 = L11_1
    if L0_1 then
      L11_1 = sysio
      L11_1 = L11_1.RegEnumValues
      L12_1 = L0_1
      L11_1 = L11_1(L12_1)
      L1_1 = L11_1
      L11_1 = pairs
      L12_1 = L1_1
      L11_1, L12_1, L13_1 = L11_1(L12_1)
      for L14_1, L15_1 in L11_1, L12_1, L13_1 do
        if L15_1 then
          L16_1 = sysio
          L16_1 = L16_1.GetRegValueAsString
          L17_1 = L0_1
          L18_1 = L15_1
          L16_1 = L16_1(L17_1, L18_1)
          L4_1 = L16_1
          if L4_1 then
            L16_1 = string
            L16_1 = L16_1.match
            L17_1 = L4_1
            L18_1 = "^%a:\\([0-9a-z]+)\\([0-9a-z]+)%.exe"
            L16_1, L17_1 = L16_1(L17_1, L18_1)
            if L16_1 ~= nil and L17_1 ~= nil and L16_1 == L17_1 then
              L18_1 = string
              L18_1 = L18_1.len
              L19_1 = L16_1
              L18_1 = L18_1(L19_1)
              if 7 <= L18_1 and L18_1 <= 8 then
                L19_1 = L16_1
                L20_1 = ".exe"
                L2_1 = L19_1 .. L20_1
                L19_1 = sysio
                L19_1 = L19_1.DeleteRegValue
                L20_1 = L0_1
                L21_1 = L15_1
                L19_1(L20_1, L21_1)
                L19_1 = sysio
                L19_1 = L19_1.IsFileExists
                L20_1 = L4_1
                L19_1 = L19_1(L20_1)
                if L19_1 then
                  L19_1 = sysio
                  L19_1 = L19_1.GetFileSize
                  L20_1 = L4_1
                  L19_1 = L19_1(L20_1)
                  L3_1 = L19_1
                  L19_1 = Remediation
                  L19_1 = L19_1.BtrDeleteFile
                  L20_1 = L4_1
                  L19_1(L20_1)
                  L19_1 = RemoveCrowtiASEPs
                  L20_1 = L5_1
                  L21_1 = L2_1
                  L22_1 = L3_1
                  L19_1(L20_1, L21_1, L22_1)
                  L19_1 = MpCommon
                  L19_1 = L19_1.ReportLowfi
                  L20_1 = L4_1
                  L21_1 = 2546441377
                  L19_1(L20_1, L21_1)
                end
              end
            end
          end
        end
      end
    end
  end
end

function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = false
  L1_2 = true
  L2_2 = Info
  L2_2 = L2_2.OSType
  if L2_2 then
    L2_2 = Info
    L2_2 = L2_2.OSType
    if L2_2 == "Server" then
      L1_2 = false
    end
  end
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = "HKLM\\SYSTEM"
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = sysio
    L3_2 = L3_2.RegEnumKeys
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = pairs
      L5_2 = L3_2
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      for L7_2, L8_2 in L4_2, L5_2, L6_2 do
        L9_2 = string
        L9_2 = L9_2.match
        L10_2 = L8_2
        L11_2 = "ControlSet%d%d%d"
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L9_2 = Infrastructure_RepairServiceAtPath
          L10_2 = "wuauserv"
          L11_2 = L8_2
          L9_2 = L9_2(L10_2, L11_2)
          L0_2 = L9_2 or L0_2
          if not L9_2 then
          end
          L9_2 = Infrastructure_RepairServiceAtPath
          L10_2 = "BITS"
          L11_2 = L8_2
          L9_2 = L9_2(L10_2, L11_2)
          L0_2 = L9_2 or L0_2
          if not L9_2 then
          end
          L9_2 = Infrastructure_RepairServiceAtPath
          L10_2 = "WerSvc"
          L11_2 = L8_2
          L9_2 = L9_2(L10_2, L11_2)
          L0_2 = L9_2 or L0_2
          if not L9_2 then
          end
          if L1_2 then
            L9_2 = Infrastructure_RepairServiceAtPath
            L10_2 = "wscsvc"
            L11_2 = L8_2
            L9_2 = L9_2(L10_2, L11_2)
            L0_2 = L9_2 or L0_2
            if not L9_2 then
            end
            L9_2 = Infrastructure_RepairServiceAtPath
            L10_2 = "WinDefend"
            L11_2 = L8_2
            L9_2 = L9_2(L10_2, L11_2)
            L0_2 = L9_2 or L0_2
            if not L9_2 then
            end
          end
          L9_2 = sysio
          L9_2 = L9_2.RegOpenSubkey
          L10_2 = L2_2
          L11_2 = L8_2
          L12_2 = "\\services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile"
          L11_2 = L11_2 .. L12_2
          L9_2 = L9_2(L10_2, L11_2)
          if L9_2 then
            L10_2 = sysio
            L10_2 = L10_2.SetRegValueAsDword
            L11_2 = L9_2
            L12_2 = "EnableFirewall"
            L13_2 = 1
            L10_2(L11_2, L12_2, L13_2)
          end
        end
      end
    end
  end
  L3_2 = Remediation
  L3_2 = L3_2.DefaultSpecialRegistry
  L4_2 = "HKLM\\SOFTWARE\\Microsoft\\Security Center"
  L3_2(L4_2)
  L3_2 = Infrastructure_EnableUAC
  L3_2()
  L3_2 = Infrastructure_EnableSystemRestore
  L3_2()
  if L0_2 then
    L3_2 = Remediation
    L3_2 = L3_2.SetRebootRequired
    L3_2()
  end
end

RepairServicesAndComponents = L0_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if not L0_1 then
  L0_1 = string
  L0_1 = L0_1.match
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  L2_1 = "Ransom:Win32/Crowti"
  L0_1 = L0_1(L1_1, L2_1)
  if not L0_1 then
    goto lbl_121
  end
end
L0_1 = RepairServicesAndComponents
L0_1()
::lbl_121::
