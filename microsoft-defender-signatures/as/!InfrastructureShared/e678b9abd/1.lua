local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 11 <= L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.changedetectionname
    L1_1 = 805306452
    L0_1(L1_1)
  else
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.changedetectionname
      L1_1 = 805306453
      L0_1(L1_1)
    end
  end
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
else
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if L0_1 == 10 then
    L0_1 = hstrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[5]
      L0_1 = L0_1.matched
      if L0_1 then
        L0_1 = mp
        L0_1 = L0_1.set_mpattribute
        L1_1 = "HSTR:PossibleGamarue"
        L0_1(L1_1)
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
