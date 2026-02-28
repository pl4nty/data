local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "EFI_"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "table" then
    L1_1 = SetAttributeFromClassifierScoresEx
    L2_1 = #L0_1
    L3_1 = {}
    L4_1 = 30
    L5_1 = 20
    L6_1 = 15
    L7_1 = 10
    L8_1 = 5
    L9_1 = 1
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L3_1[4] = L7_1
    L3_1[5] = L8_1
    L3_1[6] = L9_1
    L4_1 = "Lua:EfiGuidsApprox:"
    L1_1(L2_1, L3_1, L4_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
