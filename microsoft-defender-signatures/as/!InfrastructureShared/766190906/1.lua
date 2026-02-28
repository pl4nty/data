local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 393216 < L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if L0_1 < 458752 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306399
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
