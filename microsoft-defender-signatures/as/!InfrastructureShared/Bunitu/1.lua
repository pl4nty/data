local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = "rundll32%.exe"
L0_1[1] = L1_1
L1_1 = {}
L2_1 = "tmp"
L3_1 = "dll"
L4_1 = "exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = {}
L3_1 = "disableantivirus"
L4_1 = "disableantispyware"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "disablerealtimemonitoring"
L5_1 = "disableonaccessprotection"
L6_1 = "disablebehaviormonitoring"
L7_1 = "disableioavprotection"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = {}
L5_1 = "spynetreporting"
L4_1[1] = L5_1

function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 == nil then
    return
  end
  L2_2 = sysio
  L2_2 = L2_2.RegEnumValues
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 ~= nil then
      L8_2 = string
      L8_2 = L8_2.lower
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L7_2 = L8_2
      L8_2 = pairs
      L9_2 = A1_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      for L11_2, L12_2 in L8_2, L9_2, L10_2 do
        if L7_2 == L12_2 then
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

DeleteRegistryEntriesOnValueMatch = L5_1

function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender"
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = DeleteRegistryEntriesOnValueMatch
  L3_2 = L1_2
  L4_2 = L2_1
  L2_2(L3_2, L4_2)
  L2_2 = L0_2
  L3_2 = "\\REAL-TIME PROTECTION"
  L2_2 = L2_2 .. L3_2
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L1_2 = L3_2
  L3_2 = DeleteRegistryEntriesOnValueMatch
  L4_2 = L1_2
  L5_2 = L3_1
  L3_2(L4_2, L5_2)
  L3_2 = L0_2
  L4_2 = "\\SPYNET"
  L2_2 = L3_2 .. L4_2
  L3_2 = sysio
  L3_2 = L3_2.RegOpenKey
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L1_2 = L3_2
  if L1_2 ~= nil then
    L3_2 = sysio
    L3_2 = L3_2.GetRegValueAsDword
    L4_2 = L1_2
    L5_2 = "SpyNetReporting"
    L3_2 = L3_2(L4_2, L5_2)
    if L3_2 ~= nil and L3_2 == 0 then
      L4_2 = DeleteRegistryEntriesOnValueMatch
      L5_2 = L1_2
      L6_2 = L4_1
      L4_2(L5_2, L6_2)
    end
  end
end

ResetWDPreferences = L5_1

function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\FirewallRules"
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil then
    return
  end
  L2_2 = sysio
  L2_2 = L2_2.RegEnumValues
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    if L7_2 ~= nil then
      L8_2 = sysio
      L8_2 = L8_2.GetRegValueAsString
      L9_2 = L1_2
      L10_2 = L7_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 ~= nil then
        L9_2 = string
        L9_2 = L9_2.match
        L10_2 = string
        L10_2 = L10_2.lower
        L11_2 = L8_2
        L10_2 = L10_2(L11_2)
        L11_2 = "action=allow|active=true|dir=out|app=[^|]*rundll32%.exe"
        L9_2 = L9_2(L10_2, L11_2)
        if L9_2 then
          L9_2 = sysio
          L9_2 = L9_2.DeleteRegValue
          L10_2 = L1_2
          L11_2 = L7_2
          L9_2(L10_2, L11_2)
        end
      end
    end
  end
end

FixTamperedWDFirewall = L5_1

function L5_1(A0_2)
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
  L3_2 = DeleteRegistryEntriesOnValueMatch
  L4_2 = L1_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = DeleteRegistryEntriesOnValueMatch
  L4_2 = L2_2
  L5_2 = L1_1
  L3_2(L4_2, L5_2)
end

FixTamperedExclusionRegEntries = L5_1
L5_1 = Remediation
L5_1 = L5_1.Threat
L5_1 = L5_1.Active
if L5_1 then
  L5_1 = Infrastructure_CheckDefenderpresence
  L5_1 = L5_1()
  if L5_1 then
    L5_1 = FixTamperedExclusionRegEntries
    L6_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
    L5_1(L6_1)
    L5_1 = ResetWDPreferences
    L5_1()
  end
  L5_1 = FixTamperedWDFirewall
  L5_1()
end
