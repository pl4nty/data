local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "scpt:WebShellObf_"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if L1_1 < 3 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
