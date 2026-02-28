local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_exports
L1_1, L2_1 = L1_1()
if L1_1 == 1 then
  L3_1 = pe
  L3_1 = L3_1.mmap_string_rva
  L4_1 = L2_1[1]
  L4_1 = L4_1.namerva
  L5_1 = 64
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == "GC_VersionInfo" then
    L4_1 = pe
    L4_1 = L4_1.query_import
    L5_1 = L4_1
    L6_1 = pe
    L6_1 = L6_1.IMPORT_STATIC
    L7_1 = 3306045273
    L5_1 = L5_1(L6_1, L7_1)
    if 0 == L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = L4_1
    L6_1 = pe
    L6_1 = L6_1.IMPORT_STATIC
    L7_1 = 2141573459
    L5_1 = L5_1(L6_1, L7_1)
    if 0 == L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = L4_1
    L6_1 = pe
    L6_1 = L6_1.IMPORT_STATIC
    L7_1 = 3604202544
    L5_1 = L5_1(L6_1, L7_1)
    if 0 == L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = L4_1
    L6_1 = pe
    L6_1 = L6_1.IMPORT_STATIC
    L7_1 = 1712054030
    L5_1 = L5_1(L6_1, L7_1)
    if 0 == L5_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
