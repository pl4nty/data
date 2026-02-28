local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_filesize_by_handle
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if 500000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 < 8192 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readfile_by_handle
L3_1 = L0_1
L4_1 = 4096
L5_1 = 4096
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L2_1
L5_1 = "[pdfwithjsarray]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
