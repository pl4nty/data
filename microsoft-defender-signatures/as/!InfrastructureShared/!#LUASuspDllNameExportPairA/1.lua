local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L1_1 = pe
L1_1 = L1_1.get_exports
L1_1, L2_1 = L1_1()
if L0_1 ~= nil and 2 < L1_1 and L1_1 < 15 then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = 1
  L6_1 = -5
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L0_1 = L3_1
  L3_1 = 1
  L4_1 = L1_1
  L5_1 = 1
  for L6_1 = L3_1, L4_1, L5_1 do
    L7_1 = pe
    L7_1 = L7_1.mmap_string_rva
    L8_1 = L2_1[L6_1]
    L8_1 = L8_1.namerva
    L9_1 = 64
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 ~= nil then
      L8_1 = string
      L8_1 = L8_1.lower
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      if L8_1 == L0_1 then
        L8_1 = mp
        L8_1 = L8_1.set_mpattribute
        L9_1 = "do_exhaustivehstr_64bit_rescan"
        L8_1(L9_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
