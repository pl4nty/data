local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.NumberOfSections
if L0_1 == 4 then
  L0_1 = pevars
  L0_1 = L0_1.epsec
  if L0_1 == 1 then
    L0_1 = pesecs
    L1_1 = pevars
    L1_1 = L1_1.epsec
    L0_1 = L0_1[L1_1]
    L0_1 = L0_1.SizeOfRawData
    if 40960 <= L0_1 then
      L0_1 = pesecs
      L1_1 = pevars
      L1_1 = L1_1.epsec
      L0_1 = L0_1[L1_1]
      L0_1 = L0_1.SizeOfRawData
      if L0_1 <= 57344 then
        L0_1 = mp
        L0_1 = L0_1.SUSPICIOUS
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
