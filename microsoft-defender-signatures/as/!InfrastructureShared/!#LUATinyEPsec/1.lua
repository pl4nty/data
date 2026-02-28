local L0_1, L1_1
L0_1 = pevars
L0_1 = L0_1.epsec
if L0_1 == 1 then
  L0_1 = pesecs
  L0_1 = L0_1[1]
  L0_1 = L0_1.SizeOfRawData
  if L0_1 == 1024 then
    L0_1 = peattributes
    L0_1 = L0_1.isdll
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
    L0_1 = mp
    L0_1 = L0_1.LOWFI
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
