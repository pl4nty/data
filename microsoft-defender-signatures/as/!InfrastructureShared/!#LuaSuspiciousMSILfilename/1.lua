local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L1_1 = {}
L2_1 = "payment proof"
L1_1[1] = L2_1
L2_1 = 1
L3_1 = #L1_1
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L0_1
  L8_1 = L1_1[L5_1]
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:SuspiciousMSILfilename"
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.LOWFI
    return L6_1
  end
end
L2_1 = {}
L3_1 = "payment.proof"
L4_1 = "booking.+confirmation"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = 1
L4_1 = #L2_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L0_1
  L9_1 = L2_1[L6_1]
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:SuspiciousMSILfilename"
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.LOWFI
    return L7_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
