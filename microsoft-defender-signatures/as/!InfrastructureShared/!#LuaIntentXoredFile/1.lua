local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = 256
L1_1 = tostring
L2_1 = pesecs
L2_1 = L2_1[3]
L2_1 = L2_1.Name
L1_1 = L1_1(L2_1)
if L1_1 ~= ".data" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = pesecs
L3_1 = L3_1[3]
L3_1 = L3_1.PointerToRawData
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
L3_1 = 1
L4_1 = L0_1
L5_1 = 8
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = L2_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = mp
  L8_1 = L8_1.readu_u32
  L9_1 = L2_1
  L10_1 = L6_1 + 4
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = mp
  L9_1 = L9_1.bitxor
  L10_1 = L7_1
  L11_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == 9460302 and L7_1 ~= 10115661 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
