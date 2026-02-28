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

DeleteRegistryEntriesOnValueMatch = L2_1

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
  L3_2 = DeleteRegistryEntriesOnValueMatch
  L4_2 = L1_2
  L5_2 = L0_1
  L3_2(L4_2, L5_2)
  L3_2 = DeleteRegistryEntriesOnValueMatch
  L4_2 = L2_2
  L5_2 = L1_1
  L3_2(L4_2, L5_2)
end

FixTamperedExclusionRegEntries = L2_1
L2_1 = Infrastructure_CheckMSEpresence
L2_1 = L2_1()
L3_1 = Infrastructure_CheckDefenderpresence
L3_1 = L3_1()
if L2_1 then
  L4_1 = FixTamperedExclusionRegEntries
  L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\"
  L4_1(L5_1)
elseif L3_1 then
  L4_1 = FixTamperedExclusionRegEntries
  L5_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
  L4_1(L5_1)
end
