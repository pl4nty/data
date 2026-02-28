local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:SSHPatchSamDustDiff"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if 3 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:SSHPatchSamDustCode"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if 5 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
