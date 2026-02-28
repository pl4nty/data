local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "TARG:Worm:VBS/Jenxcus!Crypt1"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 70000 or 130000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "'execute%(%p([%d%s&%p%(%)]-)%)\r\n"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = fastDec2Bin
L5_1 = L2_1
L6_1 = "%((%d+)%)%s?&?%s?%p?"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = "[Crypt1]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
