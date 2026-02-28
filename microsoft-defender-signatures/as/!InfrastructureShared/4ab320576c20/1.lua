local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = TrackPidAndTechniqueBM
    L1_1 = "BM"
    L2_1 = "T1027.002"
    L3_1 = "DefenseEvasionn_SoftwarePacking_mt2023"
    L0_1(L1_1, L2_1, L3_1)
    L0_1 = bm
    L0_1 = L0_1.trigger_sig
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p1
    L2_1 = "UPXELFDroppedSelf"
    L0_1(L1_1, L2_1)
    L0_1 = mp
    L0_1 = L0_1.GetParentProcInfo
    L0_1 = L0_1()
    if L0_1 ~= nil then
      L1_1 = L0_1.ppid
      if L1_1 ~= nil then
        L1_1 = bm
        L1_1 = L1_1.trigger_sig
        L2_1 = this_sigattrlog
        L2_1 = L2_1[1]
        L2_1 = L2_1.utf8p1
        L3_1 = "UPXELFDroppedParent"
        L4_1 = L0_1.ppid
        L1_1(L2_1, L3_1, L4_1)
      end
    end
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
