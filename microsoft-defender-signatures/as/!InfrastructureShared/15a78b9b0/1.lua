local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[4]
      L0_1 = L0_1.matched
      if not L0_1 then
        goto lbl_36
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 110 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
else
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if 60 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.LOWFI
    return L0_1
  end
end
::lbl_36::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
