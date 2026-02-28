local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 12 then
  L0_1 = pesecs
  L0_1 = L0_1[9]
  L0_1 = L0_1.VirtualSize
  if L0_1 == 13320 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
