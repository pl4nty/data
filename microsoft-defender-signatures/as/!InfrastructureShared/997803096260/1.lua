local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
    if L0_1 == 3 then
      L0_1 = pe
      L0_1 = L0_1.mmap_va
      L1_1 = hstrlog
      L1_1 = L1_1[1]
      L1_1 = L1_1.VA
      L2_1 = hstrlog
      L2_1 = L2_1[1]
      L2_1 = L2_1.match_offsets
      L2_1 = L2_1[2]
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 == nil then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\255\021"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 ~= nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = pe
      L2_1 = L2_1.query_import
      L3_1 = pe
      L3_1 = L3_1.IMPORT_STATIC
      L4_1 = 2307734577
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= 0 then
        L3_1 = hstrlog
        L3_1 = L3_1[1]
        L3_1 = L3_1.VA
        L4_1 = hstrlog
        L4_1 = L4_1[1]
        L4_1 = L4_1.match_offsets
        L4_1 = L4_1[3]
        L3_1 = L3_1 + L4_1
        L4_1 = mp
        L4_1 = L4_1.readu_u32
        L5_1 = pe
        L5_1 = L5_1.mmap_va
        L6_1 = L3_1
        L7_1 = 4
        L5_1 = L5_1(L6_1, L7_1)
        L6_1 = 1
        L4_1 = L4_1(L5_1, L6_1)
        L5_1 = L3_1 + 4
        L5_1 = L5_1 + L4_1
        if L5_1 == L2_1 then
          L6_1 = mp
          L6_1 = L6_1.INFECTED
          return L6_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
