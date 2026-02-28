local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[1]
L2_1 = headerpage
L2_1 = L2_1[2]
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 52 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u16
L3_1 = headerpage
L4_1 = 3
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L0_1 ~= 16496 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = headerpage
L1_1 = L1_1[1]
L2_1 = 202
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.bitxor
L2_1 = headerpage
L2_1 = L2_1[2]
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == 254 then
  L1_1 = mp
  L1_1 = L1_1.bitxor
  L2_1 = headerpage
  L2_1 = L2_1[3]
  L3_1 = L0_1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 186 then
    L1_1 = mp
    L1_1 = L1_1.bitxor
    L2_1 = headerpage
    L2_1 = L2_1[4]
    L3_1 = L0_1
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == 190 then
      goto lbl_69
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_69::
L1_1 = headerpage
L1_1 = L1_1[5]
if L1_1 == L0_1 then
  L1_1 = headerpage
  L1_1 = L1_1[6]
  if L1_1 == L0_1 then
    goto lbl_80
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_80::
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 786432 < L1_1 or L1_1 < 256 then
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
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = fastBinaryTransform
L5_1 = L2_1
L6_1 = "(.)"
L7_1 = L0_1
L8_1 = mp
L8_1 = L8_1.bitxor
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
L5_1 = "[XorJavaClass]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
