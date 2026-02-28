local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.Machine
if L0_1 == 332 then
  L0_1 = mp
  L0_1 = L0_1.changedetectionname
  L1_1 = 805306393
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 8 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if 10 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
  L0_1 = mp
  L0_1 = L0_1.SUSPICIOUS
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
