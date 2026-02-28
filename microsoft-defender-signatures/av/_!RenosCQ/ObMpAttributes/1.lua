local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = peattributes
L0_1 = L0_1.resource_only_dll
if L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.NumberOfSections
  if L0_1 == 3 then
    L0_1 = peattributes
    L0_1 = L0_1.no_ep
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.x86_image
      if L0_1 then
        L0_1 = mp
        L0_1 = L0_1.readprotection
        L1_1 = false
        L0_1(L1_1)
        L0_1 = mp
        L0_1 = L0_1.readfile
        L1_1 = pesecs
        L1_1 = L1_1[2]
        L1_1 = L1_1.PointerToRawData
        L2_1 = 352
        L0_1 = L0_1(L1_1, L2_1)
        L1_1 = mp
        L1_1 = L1_1.crc32
        L2_1 = -1
        L3_1 = L0_1
        L4_1 = 1
        L5_1 = 352
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == 2202006724 then
          L2_1 = mp
          L2_1 = L2_1.INFECTED
          return L2_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
