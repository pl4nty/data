local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = "svchost%.exe"
L2_1 = "consent%.exe"
L3_1 = "rundll32%.exe"
L4_1 = "spoolsv%.exe"
L5_1 = "explorer%.exe"
L6_1 = "rgjdu%.exe"
L7_1 = "afwqs%.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L1_1 = {}
L2_1 = "%.tmp"
L3_1 = "%.dll"
L4_1 = "%.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 then
    L2_2 = sysio
    L2_2 = L2_2.RegEnumValues
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L3_2 = pairs
    L4_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2)
    for L6_2, L7_2 in L3_2, L4_2, L5_2 do
      L8_2 = pairs
      L9_2 = A1_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      for L11_2, L12_2 in L8_2, L9_2, L10_2 do
        L13_2 = string
        L13_2 = L13_2.match
        L14_2 = L7_2
        L15_2 = L12_2
        L13_2 = L13_2(L14_2, L15_2)
        if L13_2 then
          L13_2 = sysio
          L13_2 = L13_2.DeleteRegValue
          L14_2 = A0_2
          L15_2 = L7_2
          L13_2(L14_2, L15_2)
        end
      end
    end
  end
end

RamnitDeleteEntries = L2_1

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = A0_2
  L3_2 = "Processes"
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = A0_2
  L4_2 = "Extensions"
  L3_2 = L3_2 .. L4_2
  L2_2 = L2_2(L3_2)
  L3_2 = RamnitDeleteEntries
  L4_2 = L1_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = RamnitDeleteEntries
  L4_2 = L2_2
  L5_2 = L1_1
  L3_2(L4_2, L5_2)
end

RamnitFixTamperingRegEntries = L2_1

function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A2_2 then
    A2_2 = A0_2
  end
  L3_2 = false
  L4_2 = "HKLM\\SYSTEM\\"
  L5_2 = A1_2
  L6_2 = "\\services\\"
  L7_2 = A0_2
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  L5_2 = sysio
  L5_2 = L5_2.RegOpenKey
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = sysio
    L6_2 = L6_2.GetRegValueAsDword
    L7_2 = L5_2
    L8_2 = "Start"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 ~= 4 then
      L6_2 = sysio
      L6_2 = L6_2.GetRegValueAsString
      L7_2 = L5_2
      L8_2 = "DeleteFlag"
      L6_2 = L6_2(L7_2, L8_2)
    end
    if L6_2 then
      L3_2 = true
    end
  else
    L3_2 = true
  end
  if L3_2 then
    L6_2 = Remediation
    L6_2 = L6_2.DefaultSpecialRegistry
    L7_2 = "HKLM\\SYSTEM\\CurrentControlSet\\services\\"
    L8_2 = A2_2
    L7_2 = L7_2 .. L8_2
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
  end
  if L3_2 then
    L6_2 = sysio
    L6_2 = L6_2.RegOpenKey
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = true
      return L6_2
  end
  else
    L6_2 = false
    return L6_2
  end
end

RepairServiceAtPath = L2_1

function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = false
  L1_2 = Infrastructure_CheckMSEpresence
  L1_2 = L1_2()
  L2_2 = true
  L3_2 = Info
  L3_2 = L3_2.OSType
  if L3_2 then
    L3_2 = Info
    L3_2 = L3_2.OSType
    if L3_2 == "Server" then
      L2_2 = false
    end
  end
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = "HKLM\\SYSTEM"
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumKeys
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = pairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = string
        L10_2 = L10_2.match
        L11_2 = L9_2
        L12_2 = "ControlSet%d%d%d"
        L10_2 = L10_2(L11_2, L12_2)
        if L10_2 then
          L10_2 = RepairServiceAtPath
          L11_2 = "MpsSvc"
          L12_2 = L9_2
          L10_2 = L10_2(L11_2, L12_2)
          L0_2 = L10_2 or L0_2
          if not L10_2 then
          end
          L10_2 = RepairServiceAtPath
          L11_2 = "wuauserv"
          L12_2 = L9_2
          L10_2 = L10_2(L11_2, L12_2)
          L0_2 = L10_2 or L0_2
          if not L10_2 then
          end
          L10_2 = RepairServiceAtPath
          L11_2 = "BITS"
          L12_2 = L9_2
          L10_2 = L10_2(L11_2, L12_2)
          L0_2 = L10_2 or L0_2
          if not L10_2 then
          end
          if L2_2 then
            L10_2 = RepairServiceAtPath
            L11_2 = "wscsvc"
            L12_2 = L9_2
            L10_2 = L10_2(L11_2, L12_2)
            L0_2 = L10_2 or L0_2
            if not L10_2 then
            end
            L10_2 = RepairServiceAtPath
            L11_2 = "WinDefend"
            L12_2 = L9_2
            L10_2 = L10_2(L11_2, L12_2)
            L0_2 = L10_2 or L0_2
            if not L10_2 then
            end
          end
          if L1_2 then
            L10_2 = RepairServiceAtPath
            L11_2 = "MsMpSvc"
            L12_2 = L9_2
            L13_2 = "MsMpSvc_Camp"
            L10_2 = L10_2(L11_2, L12_2, L13_2)
            L0_2 = L10_2 or L0_2
            if not L10_2 then
            end
          end
          L10_2 = sysio
          L10_2 = L10_2.RegOpenSubkey
          L11_2 = L3_2
          L12_2 = L9_2
          L13_2 = "\\services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile"
          L12_2 = L12_2 .. L13_2
          L10_2 = L10_2(L11_2, L12_2)
          if L10_2 then
            L11_2 = sysio
            L11_2 = L11_2.SetRegValueAsDword
            L12_2 = L10_2
            L13_2 = "EnableFirewall"
            L14_2 = 1
            L11_2(L12_2, L13_2, L14_2)
          end
        end
      end
    end
  end
  L4_2 = Remediation
  L4_2 = L4_2.DefaultSpecialRegistry
  L5_2 = "HKLM\\SOFTWARE\\Microsoft\\Security Center"
  L4_2(L5_2)
  L4_2 = Infrastructure_EnableUAC
  L4_2()
  if L0_2 then
    L4_2 = Remediation
    L4_2 = L4_2.SetRebootRequired
    L4_2()
  end
end

RepairServicesAndComponents = L2_1
L2_1 = Remediation
L2_1 = L2_1.Threat
L2_1 = L2_1.Active
if L2_1 then
  L2_1 = Infrastructure_CheckMSEpresence
  L2_1 = L2_1()
  L3_1 = Infrastructure_CheckDefenderpresence
  L3_1 = L3_1()
  if L2_1 then
    L4_1 = RamnitFixTamperingRegEntries
    L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\"
    L4_1(L5_1)
  elseif L3_1 then
    L4_1 = RamnitFixTamperingRegEntries
    L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
    L4_1(L5_1)
  end
  L4_1 = RepairServicesAndComponents
  L4_1()
end
