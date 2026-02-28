local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "//Lua:MSIBinary:"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L1_1 = #L0_1
if 10 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "//Lua:MSIBinCount:GE10"
  L2_1(L3_1)
elseif 5 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "//Lua:MSIBinCount:GE5"
  L2_1(L3_1)
elseif 3 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "//Lua:MSIBinCount:GE3"
  L2_1(L3_1)
elseif 2 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "//Lua:MSIBinCount:GE2"
  L2_1(L3_1)
else
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "//Lua:MSIBinCount:GE1"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
