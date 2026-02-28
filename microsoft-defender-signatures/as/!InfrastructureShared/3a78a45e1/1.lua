local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 == true then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 == true then
    L0_1 = pehdr
    L0_1 = L0_1.DataDirectory
    L0_1 = L0_1[1]
    L0_1 = L0_1.Size
    if L0_1 ~= 0 then
      L0_1 = pehdr
      L0_1 = L0_1.DataDirectory
      L0_1 = L0_1[1]
      L0_1 = L0_1.RVA
      L1_1 = mp
      L1_1 = L1_1.readprotection
      L2_1 = false
      L1_1(L2_1)
      L1_1 = mp
      L1_1 = L1_1.readfile
      L2_1 = pe
      L2_1 = L2_1.foffset_rva
      L3_1 = L0_1
      L2_1 = L2_1(L3_1)
      L3_1 = 36
      L1_1 = L1_1(L2_1, L3_1)
      L2_1 = mp
      L2_1 = L2_1.readu_u32
      L3_1 = L1_1
      L4_1 = 21
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 == 1 then
        L2_1 = mp
        L2_1 = L2_1.readu_u32
        L3_1 = L1_1
        L4_1 = 25
        L2_1 = L2_1(L3_1, L4_1)
        if L2_1 == 1 then
          L2_1 = mp
          L2_1 = L2_1.readu_u32
          L3_1 = L1_1
          L4_1 = 33
          L2_1 = L2_1(L3_1, L4_1)
          L3_1 = pe
          L3_1 = L3_1.mmap_rva
          L4_1 = L2_1
          L5_1 = 4
          L3_1 = L3_1(L4_1, L5_1)
          L1_1 = L3_1
          L3_1 = mp
          L3_1 = L3_1.readu_u32
          L4_1 = L1_1
          L5_1 = 1
          L3_1 = L3_1(L4_1, L5_1)
          L4_1 = pe
          L4_1 = L4_1.mmap_rva
          L5_1 = L3_1
          L6_1 = 12
          L4_1 = L4_1(L5_1, L6_1)
          L5_1 = string
          L5_1 = L5_1.sub
          L6_1 = L4_1
          L7_1 = 1
          L8_1 = 12
          L5_1 = L5_1(L6_1, L7_1, L8_1)
          if L5_1 == "ServiceMain\000" then
            L5_1 = mp
            L5_1 = L5_1.INFECTED
            return L5_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
