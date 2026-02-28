local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:TopLevelFile"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = candidatePeFile
  L0_1 = L0_1()
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
