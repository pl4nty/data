local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//AGGREGATOR:GIOAVTopLevelZIP"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//GIOAVZIPinTopLevelZIP"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.HEADERPAGE_SZ
    if 8 < L0_1 then
      L0_1 = mp
      L0_1 = L0_1.readu_u32
      L1_1 = headerpage
      L2_1 = 1
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 == 67324752 then
        L0_1 = mp
        L0_1 = L0_1.set_mpattribute
        L1_1 = "//GIOAVZIPinTopLevelZIP"
        L0_1(L1_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//AGGREGATOR:GIOAVTopLevelUncompressedZip"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//GIOAVZIPinTopLevelUncompressedZip"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.HEADERPAGE_SZ
    if 8 < L0_1 then
      L0_1 = mp
      L0_1 = L0_1.readu_u32
      L1_1 = headerpage
      L2_1 = 1
      L0_1 = L0_1(L1_1, L2_1)
      if L0_1 == 67324752 then
        L0_1 = mp
        L0_1 = L0_1.set_mpattribute
        L1_1 = "//GIOAVZIPinTopLevelUncompressedZip"
        L0_1(L1_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
