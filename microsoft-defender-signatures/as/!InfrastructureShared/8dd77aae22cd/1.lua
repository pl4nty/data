local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
      L1_1 = L1_1.GetProcessCommandLine
      L2_1 = L0_1.ppid
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = L1_1
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "echo binary"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "echo get "
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 then
            L2_1 = mp
            L2_1 = L2_1.INFECTED
            return L2_1
          end
        end
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "curl"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = string
          L2_1 = L2_1.find
          L3_1 = L1_1
          L4_1 = "ftp -s:"
          L5_1 = 1
          L6_1 = true
          L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
          if L2_1 then
            L2_1 = mp
            L2_1 = L2_1.INFECTED
            return L2_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
