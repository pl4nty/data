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
    L3_1 = pe
    L3_1 = L3_1.IMAGE_DIRECTORY_ENTRY_EXPORT
    L2_1 = L2_1[L3_1]
    L2_1 = L2_1.RVA
    L1_1 = L1_1 + L2_1
    L2_1 = 40
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = mp
    L1_1 = L1_1.readu_u32
    L2_1 = L0_1
    L3_1 = 13
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = pe
    L2_1 = L2_1.mmap_va
    L3_1 = pehdr
    L3_1 = L3_1.ImageBase
    L3_1 = L3_1 + L1_1
    L4_1 = 32
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = 1
    L6_1 = 17
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == "dll_down_exec.dll" then
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
