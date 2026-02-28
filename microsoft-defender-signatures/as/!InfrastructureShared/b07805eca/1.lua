local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 10 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.Magic
if L0_1 ~= 267 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L0_1 = L0_1[1]
L0_1 = L0_1.RVA
L1_1 = pehdr
L1_1 = L1_1.DataDirectory
L1_1 = L1_1[1]
L1_1 = L1_1.Size
L2_1 = pe
L2_1 = L2_1.foffset_rva
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.ror32
L4_1 = mp
L4_1 = L4_1.readu_u32
L5_1 = L2_1
L6_1 = 20
L4_1 = L4_1(L5_1, L6_1)
L5_1 = 8
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.ror32
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = L2_1
L7_1 = 40
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 8
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = 0
L7_1 = mp
L7_1 = L7_1.getfilesize
L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1()
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = mp
L6_1 = L6_1.ror32
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L5_1
L9_1 = 60
L7_1 = L7_1(L8_1, L9_1)
L8_1 = 8
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.ror32
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = L5_1
L10_1 = L6_1 + 40
L8_1 = L8_1(L9_1, L10_1)
L9_1 = 8
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == L4_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.writeu_u32
L9_1 = L5_1
L10_1 = L6_1 + 40
L10_1 = L10_1 + 1
L11_1 = L4_1
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L5_1
L10_1 = "Export_OEP"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
