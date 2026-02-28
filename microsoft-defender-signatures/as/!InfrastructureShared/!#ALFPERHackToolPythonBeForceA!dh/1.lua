local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:BeForce.A"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if L0_1 == 1 then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:BeForce.B"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if 8 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
