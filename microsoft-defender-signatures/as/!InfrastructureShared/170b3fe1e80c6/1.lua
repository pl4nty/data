local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[11]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[11]
    L0_1 = L1_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "--status-all"
    L1_1 = L1_1(L2_1, L3_1)
    if not L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1518"
L4_1 = "Discovery_SoftwareDiscovery_mt2023"
L5_1 = 300
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
