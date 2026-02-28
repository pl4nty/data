local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = {}
L0_1[2460690537] = "SCPT:GoatBridge"
L0_1[1794461769] = "SCPT:HardBridge"
L0_1[3011729072] = "SCPT:NullBridge"
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = mp
  L6_1 = L6_1.enum_mpattributesubstring
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L7_1 = {}
  L8_1 = 1
  L9_1 = #L6_1
  if L9_1 <= 32 then
    L9_1 = #L6_1
    if L9_1 then
      goto lbl_22
    end
  end
  L9_1 = 32
  ::lbl_22::
  L10_1 = 1
  for L11_1 = L8_1, L9_1, L10_1 do
    L12_1 = L6_1[L11_1]
    L13_1 = L12_1
    L12_1 = L12_1.match
    L14_1 = "%.(%u+)$"
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 then
      L13_1 = #L12_1
      if L13_1 <= 3 then
        L13_1 = #L7_1
        L13_1 = L13_1 + 1
        L7_1[L13_1] = L12_1
      end
    end
  end
  L8_1 = #L7_1
  if 0 < L8_1 then
    L8_1 = table
    L8_1 = L8_1.sort
    L9_1 = L7_1
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "MpInternal_researchdata=SCPTSFX="
    L10_1 = table
    L10_1 = L10_1.concat
    L11_1 = L7_1
    L12_1 = ":"
    L10_1 = L10_1(L11_1, L12_1)
    L9_1 = L9_1 .. L10_1
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.changedetectionname
    L9_1 = L4_1
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
