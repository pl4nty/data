local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = "hmdprecisionpulse"
L1_1 = ipairs
L2_1 = Remediation
L2_1 = L2_1.Threat
L2_1 = L2_1.Resources
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.Path
  L7_1 = pcall
  L8_1 = MpCommon
  L8_1 = L8_1.RollingQueueQueryKeyNamespaced
  L9_1 = "hmdprecisionpulseregkeyvaluescan"
  L10_1 = L0_1
  L11_1 = L6_1
  L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 and L8_1 then
    L9_1 = split
    L11_1 = L6_1
    L10_1 = L6_1.gsub
    L12_1 = "\\\\"
    L13_1 = "#DELIM#"
    L10_1 = L10_1(L11_1, L12_1, L13_1)
    L11_1 = "#DELIM#"
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 ~= nil then
      L10_1 = #L9_1
      if L10_1 == 2 then
        L10_1 = L9_1[1]
        L11_1 = L9_1[2]
        L12_1 = sysio
        L12_1 = L12_1.RegOpenKey
        L13_1 = L10_1
        L12_1 = L12_1(L13_1)
        if L12_1 ~= nil then
          L13_1 = sysio
          L13_1 = L13_1.DeleteRegValue
          L14_1 = L12_1
          L15_1 = L11_1
          L13_1(L14_1, L15_1)
        end
      end
    end
  end
end
