local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 5 then
  L0_1 = peattributes
  L0_1 = L0_1.epinfirstsect
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.hasappendeddata
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
