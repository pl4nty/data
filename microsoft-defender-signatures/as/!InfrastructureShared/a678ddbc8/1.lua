local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_32
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 2 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.LOWFI
  return L0_1
end
::lbl_32::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
