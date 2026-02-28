local L0_1, L1_1
L0_1 = hstrlog
L0_1 = L0_1[9]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if not (3 <= L0_1) then
    goto lbl_13
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_13::
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
