local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 then
  L1_1 = isTainted
  L2_1 = L0_1
  L3_1 = "obfuscated_golang"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_file
    L2_1 = L0_1
    L1_1(L2_1)
    L1_1 = addRelatedProcess
    L1_1()
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
