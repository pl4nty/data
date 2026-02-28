local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1048576 then
  L0_1 = mp
  L0_1 = L0_1.readprotection
  L1_1 = false
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.readfile
  L1_1 = 0
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1, L3_1, L4_1, L5_1 = L2_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "TV[pq]QAA[IM]AAAAE"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= 1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L2_1 = L0_1
  L1_1 = L0_1.gsub
  L3_1 = "([A-Za-z0-9+/=]+)(|)"
  L4_1 = "%1"
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.vfo_add_buffer
  L3_1 = L1_1
  L4_1 = "[B64Strpd]"
  L5_1 = mp
  L5_1 = L5_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L2_1(L3_1, L4_1, L5_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
