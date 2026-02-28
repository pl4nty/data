local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if L0_1 == 30 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[3]
      L0_1 = L0_1.matched
      if L0_1 then
        L0_1 = mp
        L0_1 = L0_1.CLEAN
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 27 <= L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
