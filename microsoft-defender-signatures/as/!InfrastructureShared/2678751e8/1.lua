local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 2031616 < L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if L0_1 < 2097152 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306373
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
