local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == "explorer.exe" then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L2_1 = L0_1.ppid
  if L2_1 then
    L2_1 = IsKeyInRollingQueue
    L3_1 = "IsProcessChainViaRUNMRU"
    L4_1 = L0_1.ppid
    L5_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
  L2_1 = mp
  L2_1 = L2_1.GetParentProcInfo
  L3_1 = L0_1.ppid
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L3_1 = L2_1.ppid
    if L3_1 then
      L3_1 = IsKeyInRollingQueue
      L4_1 = "IsProcessChainViaRUNMRU"
      L5_1 = L2_1.ppid
      L6_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
