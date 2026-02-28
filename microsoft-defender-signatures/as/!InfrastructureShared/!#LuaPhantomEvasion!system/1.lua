local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.query_import
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 1962618287
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1
L3_1 = pe
L3_1 = L3_1.IMPORT_STATIC
L4_1 = 2775632208
L2_1 = L2_1(L3_1, L4_1)
if 0 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
