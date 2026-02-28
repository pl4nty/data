local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = bm
    L0_1 = L0_1.trigger_sig
    L1_1 = "UPXFileExec"
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p1
    L0_1(L1_1, L2_1)
    L0_1 = TrackPidAndTechniqueBM
    L1_1 = "BM"
    L2_1 = "T1027.002"
    L3_1 = "DefenseEvasion_SoftwarePacking_mt2023"
    L0_1(L1_1, L2_1, L3_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
