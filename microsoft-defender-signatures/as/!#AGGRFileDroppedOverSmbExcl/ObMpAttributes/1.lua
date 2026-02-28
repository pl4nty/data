local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "BM_MZ_FILE"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:RemoteCopyExclusions"
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
