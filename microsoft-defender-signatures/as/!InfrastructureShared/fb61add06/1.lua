local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if L0_1 ~= 2 then
  L0_1 = mp
  L0_1 = L0_1.HSTR_WEIGHT
  if L0_1 ~= 3 then
    goto lbl_12
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
do return L0_1 end
::lbl_12::
L0_1 = peattributes
L0_1 = L0_1.ismsil
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
