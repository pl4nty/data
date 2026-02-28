local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:PoCExchgGoSource"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 2 <= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:PoCExchgGoSourceFrags"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
