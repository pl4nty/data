local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SIGATTR:PY2EXE!compiled"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "HSTR:PY2EXE!compiled"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_RESOURCE
L0_1 = L0_1[L1_1]
L0_1 = L0_1.RVA
if L0_1 == 0 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = pe
L2_1 = L2_1.mmap_rva
L3_1 = L0_1 + 12
L4_1 = 2
L2_1 = L2_1(L3_1, L4_1)
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 2 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u16
L3_1 = pe
L3_1 = L3_1.mmap_rva
L4_1 = L0_1 + 14
L5_1 = 2
L3_1 = L3_1(L4_1, L5_1)
L4_1 = 1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readu_u16
L4_1 = pe
L4_1 = L4_1.mmap_rva
L5_1 = L0_1 + 16
L6_1 = 2
L4_1 = L4_1(L5_1, L6_1)
L5_1 = 1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readu_u16
L5_1 = pe
L5_1 = L5_1.mmap_rva
L6_1 = L0_1 + 24
L7_1 = 2
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = pe
L6_1 = L6_1.mmap_rva
L7_1 = L0_1 + L4_1
L8_1 = 4
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 5242892 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = pe
L6_1 = L6_1.mmap_rva
L7_1 = L0_1 + L4_1
L7_1 = L7_1 + 4
L8_1 = 4
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 5505113 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = pe
L6_1 = L6_1.mmap_rva
L7_1 = L0_1 + L4_1
L7_1 = L7_1 + 8
L8_1 = 4
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 5177416 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readu_u32
L6_1 = pe
L6_1 = L6_1.mmap_rva
L7_1 = L0_1 + L4_1
L7_1 = L7_1 + 12
L8_1 = 4
L6_1 = L6_1(L7_1, L8_1)
L7_1 = 1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= 5439566 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L1_1 - 1
L5_1 = L5_1 * 16
L6_1 = L2_1 * 16
L5_1 = L5_1 + L6_1
L5_1 = L3_1 - L5_1
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = pe
L7_1 = L7_1.mmap_rva
L8_1 = L0_1 + L5_1
L8_1 = L8_1 + 4
L9_1 = 4
L7_1 = L7_1(L8_1, L9_1)
L8_1 = 1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = pe
L8_1 = L8_1.mmap_rva
L9_1 = L0_1 + L5_1
L10_1 = 4
L8_1 = L8_1(L9_1, L10_1)
L9_1 = 1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.readu_u32
L9_1 = pe
L9_1 = L9_1.mmap_rva
L10_1 = L7_1
L11_1 = 4
L9_1 = L9_1(L10_1, L11_1)
L10_1 = 1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 ~= 2018915346 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = pe
L9_1 = L9_1.mmap_rva
L10_1 = L7_1
L11_1 = L6_1
L9_1 = L9_1(L10_1, L11_1)
L10_1 = mp
L10_1 = L10_1.vfo_add_buffer
L11_1 = L9_1
L12_1 = "[py2exebin]"
L13_1 = mp
L13_1 = L13_1.ADD_VFO_TAKE_ACTION_ON_DAD
L10_1(L11_1, L12_1, L13_1)
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
