local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "queue_chmodremotefilecopy_a"
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = AppendToRollingQueue
  L3_1 = L0_1
  L4_1 = "sshbruteforce"
  L5_1 = 1
  L6_1 = 600
  L2_1(L3_1, L4_1, L5_1, L6_1)
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = AppendToRollingQueue
    L3_1 = L0_1
    L4_1 = "remotefilecopy"
    L5_1 = 1
    L6_1 = 600
    L2_1(L3_1, L4_1, L5_1, L6_1)
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
        L2_1 = AppendToRollingQueue
        L3_1 = L0_1
        L4_1 = "chmodexec"
        L5_1 = L1_1
        L6_1 = 600
        L2_1(L3_1, L4_1, L5_1, L6_1)
      end
    end
  end
end
L2_1 = IsKeyInRollingQueue
L3_1 = L0_1
L4_1 = "sshbruteforce"
L5_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = IsKeyInRollingQueue
  L3_1 = L0_1
  L4_1 = "remotefilecopy"
  L5_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L2_1 = IsKeyInRollingQueue
    L3_1 = L0_1
    L4_1 = "chmodexec"
    L5_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 and L1_1 ~= nil then
      L2_1 = isTainted
      L3_1 = L1_1
      L4_1 = "remote_file_created_taint"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
