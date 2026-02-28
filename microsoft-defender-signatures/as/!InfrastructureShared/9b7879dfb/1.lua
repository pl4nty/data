local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 30000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 200000 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
