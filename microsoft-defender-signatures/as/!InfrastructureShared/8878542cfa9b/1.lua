local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = candidatePeFile
L0_1 = L0_1()
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.match_offsets_count
    if L0_1 == 4 then
      L0_1 = pe
      L0_1 = L0_1.query_import
      L1_1 = pe
      L1_1 = L1_1.IMPORT_STATIC
      L2_1 = 2307734577
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 ~= 0 then
        L1_1 = hstrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.VA
        L2_1 = hstrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.match_offsets
        L2_1 = L2_1[4]
        L1_1 = L1_1 + L2_1
        L2_1 = mp
        L2_1 = L2_1.readu_u32
        L3_1 = pe
        L3_1 = L3_1.mmap_va
        L4_1 = L1_1
        L5_1 = 4
        L3_1 = L3_1(L4_1, L5_1)
        L4_1 = 1
        L2_1 = L2_1(L3_1, L4_1)
        L3_1 = L1_1 + 4
        L3_1 = L3_1 + L2_1
        if L3_1 == L0_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
