local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
    L3_1 = "SrcIp=([^;]+);"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = IsHostAttackServer
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = TrackAttackerServer
      L3_1 = L1_1
      L2_1(L3_1)
    end
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = "BM"
    L4_1 = "T1020"
    L5_1 = "active_attacker_server_connection_b"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
