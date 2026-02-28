local L0_1, L1_1
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 == 232 then
  L0_1 = epcode
  L0_1 = L0_1[6]
  if L0_1 == 233 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Necurs_ObfuscatorADs"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.SUSPICIOUS
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
