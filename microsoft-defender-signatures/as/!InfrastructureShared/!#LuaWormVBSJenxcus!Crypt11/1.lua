local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
if L0_1 < 60000 or 500000 < L0_1 then
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
L4_1 = "'execute%(%p%(?(.-)%)?%)\r\n"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end

function L3_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 - A1_2
  return L2_2
end

L5_1 = L2_1
L4_1 = L2_1.gsub
L6_1 = "(%d%d?%d?%d?)%-%s(%d%d?%d?%d?)[^%d]?%)?%s?%p?%s?%p?"
L7_1 = L3_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = fastDec2Bin
L7_1 = L4_1
L8_1 = "(%d+)[^%d]?"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = "[JenxcusCrypt1.1]"
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
