local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if not (L0_1 < 29000) then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if not (40000 < L0_1) then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PEPCODE:HasDigitalSignature"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdriver
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
