local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "delete%-snapshot"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "delete%-volume"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
    end
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
      L1_1 = string
      L1_1 = L1_1.match
      L2_1 = L0_1
      L3_1 = "snapshot delete"
      L1_1 = L1_1(L2_1, L3_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.match
        L2_1 = L0_1
        L3_1 = "disk delete"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          L1_1 = mp
          L1_1 = L1_1.CLEAN
          return L1_1
        end
      end
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[3]
        L0_1 = L1_1.utf8p2
        L1_1 = string
        L1_1 = L1_1.match
        L2_1 = L0_1
        L3_1 = "snapshots delete"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.match
          L2_1 = L0_1
          L3_1 = "disks delete"
          L1_1 = L1_1(L2_1, L3_1)
          if not L1_1 then
            L1_1 = mp
            L1_1 = L1_1.CLEAN
            return L1_1
          end
        end
      end
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1490"
L4_1 = "Impact_InhibitSystemRecovery"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
