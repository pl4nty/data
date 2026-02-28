local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.utf8p1
  end
end
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "/%.[^/]+$"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1003.008"
    L4_1 = "OSCredentialDumping_mt2023"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = TrackPidAndTechniqueBM
    L2_1 = "BM"
    L3_1 = "T1564.001"
    L4_1 = "DefenseEvasion_HiddenArtifacts_mt2023"
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = reportRelatedBmHits
    L1_1()
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  else
    L1_1 = isTainted
    L2_1 = L0_1
    L3_1 = "remote_file_chmodexec"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = TrackPidAndTechniqueBM
      L2_1 = "BM"
      L3_1 = "T1003.008"
      L4_1 = "OSCredentialDumping_mt2023"
      L1_1(L2_1, L3_1, L4_1)
      L1_1 = reportRelatedBmHits
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
