local L0_1, L1_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = A0_2
  L2_2 = "Extensions"
  L1_2 = L1_2 .. L2_2
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = 0
  L4_2 = 0
  L5_2 = 0
  if L2_2 then
    L6_2 = sysio
    L6_2 = L6_2.RegEnumValues
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    for L10_2, L11_2 in L7_2, L8_2, L9_2 do
      L12_2 = string
      L12_2 = L12_2.match
      L13_2 = L11_2
      L14_2 = "%.exe"
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L3_2 = 1
      else
        L12_2 = string
        L12_2 = L12_2.match
        L13_2 = L11_2
        L14_2 = "%.dll"
        L12_2 = L12_2(L13_2, L14_2)
        if L12_2 then
          L4_2 = 1
        else
          L12_2 = string
          L12_2 = L12_2.match
          L13_2 = L11_2
          L14_2 = "%.tmp"
          L12_2 = L12_2(L13_2, L14_2)
          if L12_2 then
            L5_2 = 1
          end
        end
      end
      L12_2 = L3_2 + L4_2
      L12_2 = L12_2 + L5_2
      if 1 < L12_2 then
        L12_2 = MpDetection
        L12_2 = L12_2.ReportResource
        L13_2 = "regkeyvalue"
        L14_2 = L1_2
        L15_2 = "\\\\"
        L16_2 = L11_2
        L14_2 = L14_2 .. L15_2 .. L16_2
        L15_2 = 356
        L16_2 = false
        L12_2(L13_2, L14_2, L15_2, L16_2)
        break
      end
    end
  end
end

ScanTamperedExclusionRegEntries = L0_1

function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Infrastructure_CheckMSEpresence
  L0_2 = L0_2()
  L1_2 = Infrastructure_CheckDefenderpresence
  L1_2 = L1_2()
  if L0_2 then
    L2_2 = ScanTamperedExclusionRegEntries
    L3_2 = "HKLM\\SOFTWARE\\Microsoft\\Microsoft Antimalware\\Exclusions\\"
    L2_2(L3_2)
  elseif L1_2 then
    L2_2 = ScanTamperedExclusionRegEntries
    L3_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
    L2_2(L3_2)
  end
end

Infrastructure_ScanEvotobExclusion = L0_1
