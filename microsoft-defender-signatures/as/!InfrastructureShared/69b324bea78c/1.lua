local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.timestamp
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.timestamp
    L2_1 = nil
    if L0_1 > L1_1 then
      L2_1 = L0_1 - L1_1
    else
      L2_1 = L1_1 - L0_1
    end
    if 50000000 < L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = "BM"
    L5_1 = "T1133"
    L6_1 = "tooldrop_by_remote_access_tool"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
