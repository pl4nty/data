local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.VA
if not (L0_1 < 16384) then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_24
  end
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1024 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if L0_1 < 10000000 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
::lbl_24::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
