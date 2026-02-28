local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if L0_1 == 245760 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306372
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
