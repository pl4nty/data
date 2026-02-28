local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 then
    L0_1 = pe
    L0_1 = L0_1.mmap_va
    L1_1 = pehdr
    L1_1 = L1_1.ImageBase
    L2_1 = pehdr
    L2_1 = L2_1.DataDirectory
    L2_1 = L2_1[1]
    L2_1 = L2_1.RVA
    L1_1 = L1_1 + L2_1
    L2_1 = 40
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = mp
    L1_1 = L1_1.readu_u32
    L2_1 = L0_1
    L3_1 = 13
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = mp
    L2_1 = L2_1.readu_u32
    L3_1 = L0_1
    L4_1 = 21
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == 3 then
      L3_1 = pe
      L3_1 = L3_1.mmap_va
      L4_1 = pehdr
      L4_1 = L4_1.ImageBase
      L4_1 = L4_1 + L1_1
      L5_1 = 27
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = string
      L4_1 = L4_1.sub
      L5_1 = L3_1
      L6_1 = 8
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == "\000Destroy\000Init\000Start\000" then
        L4_1 = mp
        L4_1 = L4_1.set_mpattribute
        L5_1 = "do_exhaustivehstr_rescan"
        L4_1(L5_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
