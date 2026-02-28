local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if 5 < L0_1 then
  L0_1 = pesecs
  L0_1 = L0_1[1]
  L0_1 = L0_1.SizeOfRawData
  if L0_1 == 0 then
    L0_1 = pesecs
    L0_1 = L0_1[2]
    L0_1 = L0_1.SizeOfRawData
    if L0_1 == 0 then
      L0_1 = pesecs
      L0_1 = L0_1[3]
      L0_1 = L0_1.SizeOfRawData
      if L0_1 == 0 then
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
