local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 <= 500000 or 4000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = L1_1
L1_1 = L1_1.sub
L3_1 = 0
L4_1 = 512
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = L1_1
L1_1 = L1_1.find
L3_1 = "= \".-39"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = tostring
L4_1 = footerpage
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L3_1 = L3_1.find
L5_1 = "%d[%D]-\"%s"
L3_1, L4_1 = L3_1(L4_1, L5_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L2_1 - 2
L7_1 = L0_1 - 4098
L7_1 = L7_1 + L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= nil then
  L6_1 = mp
  L6_1 = L6_1.vfo_add_buffer
  L7_1 = fastDec2Bin
  L8_1 = L5_1
  L9_1 = "(%d+)[%D]+"
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = "[Micwix]"
  L9_1 = mp
  L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
