local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = {}
L1_1 = "appsetup%.exe"
L2_1 = "p1%.exe"
L3_1 = "p2%.exe"
L4_1 = "p3%.exe"
L5_1 = "p4%.exe"
L6_1 = "p5%.exe"
L7_1 = "p6%.exe"
L8_1 = "p7%.exe"
L9_1 = "p8%.exe"
L10_1 = "p9%.exe"
L11_1 = "p10%.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1

function L1_1(A0_2, A1_2)
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

DeleteRegistryEntriesOnValueMatch = L1_1

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = sysio
  L1_2 = L1_2.RegOpenKey
  L2_2 = A0_2
  L3_2 = "Processes"
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  L2_2 = DeleteRegistryEntriesOnValueMatch
  L3_2 = L1_2
  L4_2 = L0_1
  L2_2(L3_2, L4_2)
end

FixTamperedExclusionRegEntries = L1_1
L1_1 = Infrastructure_CheckMSEpresence
L1_1 = L1_1()
L2_1 = Infrastructure_CheckDefenderpresence
L2_1 = L2_1()
if L1_1 then
  L3_1 = FixTamperedExclusionRegEntries
  L4_1 = "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\"
  L3_1(L4_1)
elseif L2_1 then
  L3_1 = FixTamperedExclusionRegEntries
  L4_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
  L3_1(L4_1)
end
