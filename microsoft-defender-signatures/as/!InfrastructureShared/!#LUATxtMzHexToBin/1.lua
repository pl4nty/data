local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 8192 or 4194304 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 0
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == 1953651835 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "4d5a9000"
L5_1 = 1
L6_1 = true
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L2_1 - 1
L7_1 = L2_1 - 1
L7_1 = L0_1 - L7_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.vfo_add_buffer
L7_1 = fastHex2Bin
L8_1 = L5_1
L9_1 = "([0-9A-Fa-f][0-9A-Fa-f])"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = "[txtmzhextobin]"
L9_1 = mp
L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
