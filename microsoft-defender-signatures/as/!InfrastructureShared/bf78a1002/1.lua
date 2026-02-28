local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.ismsil
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "pea_has_msilresources"
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
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
