local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isvbnative
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
