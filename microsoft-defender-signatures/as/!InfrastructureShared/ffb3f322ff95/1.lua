local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1003.008"
L4_1 = "CredentialAccess"
L1_1(L2_1, L3_1, L4_1)
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "file_metadata"
L3_1 = L0_1
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = reportRelatedBmHits
L1_1()
L1_1 = addRelatedProcess
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
