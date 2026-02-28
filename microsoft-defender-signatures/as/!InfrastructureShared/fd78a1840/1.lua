local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    goto lbl_31
  end
end
L0_1 = hstrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[5]
    L0_1 = L0_1.matched
    if not L0_1 then
      goto lbl_34
    end
    L0_1 = hstrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.matched
    if not L0_1 then
      goto lbl_34
    end
  end
end
::lbl_31::
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_34::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
