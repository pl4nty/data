local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 131072 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
else
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if 57344 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306405
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  else
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306406
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.SUSPICIOUS
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
