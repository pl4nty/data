local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//AGGREGATOR:GIOAVTopLevelZIP"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//GIOAV7ZipInTopLevelZIP"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:IOAVFirst7ZipInTopLevelZIP"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "//GIOAV7ZipInTopLevelZIP"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//AGGREGATOR:GIOAVTopLevelUncompressedZip"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//GIOAV7ZipInTopLevelUncompressedZip"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:IOAVFirst7ZipInTopLevelUncompressedZip"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "//GIOAV7ZipInTopLevelUncompressedZip"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
