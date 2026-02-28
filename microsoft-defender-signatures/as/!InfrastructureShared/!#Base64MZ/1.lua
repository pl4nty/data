local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = 0
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "TV[pq]QAA[IM]AAAAEAA"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil or L1_1 == 1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "[A-Za-z0-9+/=]+"
L5_1 = L1_1
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L2_1
L5_1 = "[Base64]"
L6_1 = mp
L6_1 = L6_1.bitor
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1 = mp
L8_1 = L8_1.ADD_VFO_LOW_PRIORITY
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
