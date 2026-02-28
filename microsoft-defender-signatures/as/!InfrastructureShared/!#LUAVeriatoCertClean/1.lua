local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = peattributes
  L0_1 = L0_1.isdll
  if L0_1 ~= true then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "LUA:VeriatoCertClean"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
