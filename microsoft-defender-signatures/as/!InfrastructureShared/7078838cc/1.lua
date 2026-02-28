local L0_1, L1_1, L2_1
L0_1 = pevars
L0_1 = L0_1.epsec
L1_1 = pevars
L1_1 = L1_1.epsec
if L1_1 then
  L1_1 = pesecs
  L1_1 = L1_1[L0_1]
  L1_1 = L1_1.SizeOfRawData
  if 40960 <= L1_1 then
    L1_1 = pesecs
    L1_1 = L1_1[L0_1]
    L1_1 = L1_1.SizeOfRawData
    if L1_1 <= 131072 then
      L1_1 = pehdr
      L1_1 = L1_1.SizeOfImage
      if 65536 <= L1_1 then
        L1_1 = pehdr
        L1_1 = L1_1.SizeOfImage
        if L1_1 <= 1044480 then
          L1_1 = mp
          L1_1 = L1_1.changedetectionname
          L2_1 = 805306422
          L1_1(L2_1)
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.SUSPICIOUS
return L1_1
