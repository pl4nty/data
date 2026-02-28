local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "MpVBAPCodeRoutines"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = SetAttributeFromClassifierScoresEx
  L2_1 = L0_1
  L3_1 = {}
  L4_1 = 90
  L5_1 = 80
  L6_1 = 70
  L7_1 = 60
  L8_1 = 30
  L9_1 = 20
  L10_1 = 10
  L11_1 = 8
  L12_1 = 4
  L13_1 = 2
  L14_1 = 1
  L15_1 = 0
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L3_1[7] = L10_1
  L3_1[8] = L11_1
  L3_1[9] = L12_1
  L3_1[10] = L13_1
  L3_1[11] = L14_1
  L3_1[12] = L15_1
  L4_1 = "Lua:VbaPcodeApproxCount:"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "MpVBASourceRoutines"
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = SetAttributeFromClassifierScoresEx
  L3_1 = L1_1
  L4_1 = {}
  L5_1 = 90
  L6_1 = 80
  L7_1 = 70
  L8_1 = 60
  L9_1 = 30
  L10_1 = 20
  L11_1 = 10
  L12_1 = 8
  L13_1 = 4
  L14_1 = 2
  L15_1 = 1
  L16_1 = 0
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L4_1[7] = L11_1
  L4_1[8] = L12_1
  L4_1[9] = L13_1
  L4_1[10] = L14_1
  L4_1[11] = L15_1
  L4_1[12] = L16_1
  L5_1 = "Lua:VbaSourceApproxCount:"
  L2_1(L3_1, L4_1, L5_1)
end
if L0_1 and L1_1 then
  L2_1 = nil
  if L0_1 >= L1_1 then
    L3_1 = L0_1 - L1_1
    L3_1 = L3_1 * 100
    L4_1 = L0_1 + L1_1
    L2_1 = L3_1 / L4_1
  else
    L3_1 = L1_1 - L0_1
    L3_1 = L3_1 * 100
    L4_1 = L0_1 + L1_1
    L2_1 = L3_1 / L4_1
  end
  L3_1 = SetAttributeFromClassifierScoresEx
  L4_1 = L2_1
  L5_1 = {}
  L6_1 = 90
  L7_1 = 80
  L8_1 = 70
  L9_1 = 60
  L10_1 = 30
  L11_1 = 20
  L12_1 = 10
  L13_1 = 8
  L14_1 = 4
  L15_1 = 2
  L16_1 = 1
  L17_1 = 0
  L5_1[1] = L6_1
  L5_1[2] = L7_1
  L5_1[3] = L8_1
  L5_1[4] = L9_1
  L5_1[5] = L10_1
  L5_1[6] = L11_1
  L5_1[7] = L12_1
  L5_1[8] = L13_1
  L5_1[9] = L14_1
  L5_1[10] = L15_1
  L5_1[11] = L16_1
  L5_1[12] = L17_1
  L6_1 = "Lua:VbaRelativeDiff:"
  L3_1(L4_1, L5_1, L6_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
