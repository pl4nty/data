local L0_1, L1_1
L0_1 = pesecs
L0_1 = L0_1[1]
L0_1 = L0_1.VirtualSize
if 851968 < L0_1 then
  L0_1 = pesecs
  L0_1 = L0_1[1]
  L0_1 = L0_1.VirtualSize
  if L0_1 < 983040 then
    L0_1 = pesecs
    L0_1 = L0_1[3]
    L0_1 = L0_1.VirtualSize
    if 1769472 < L0_1 then
      L0_1 = pesecs
      L0_1 = L0_1[3]
      L0_1 = L0_1.VirtualSize
      if L0_1 < 2031616 then
        L0_1 = mp
        L0_1 = L0_1.changedetectionname
        L1_1 = 186
        L0_1(L1_1)
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
