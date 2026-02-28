local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "pea_ismsil"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "pea_no_security"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
