local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096 < L0_1 and L0_1 < 716800 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 300000
L4_1 = 400000
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = true
L2_1(L3_1)
L2_1 = MpCommon
L2_1 = L2_1.StringRegExpSearch
L3_1 = "[a-zA-Z]='[a-z?].*?\\+\\\\"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L1_1
L4_1, L5_1 = L4_1(L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == true then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
