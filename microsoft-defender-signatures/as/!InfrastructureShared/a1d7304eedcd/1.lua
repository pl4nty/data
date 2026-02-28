local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = IsKeyInRollingQueue
    L2_1 = "IsProcessChainViaRUNMRU"
    L3_1 = L0_1.ppid
    L4_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
