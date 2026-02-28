local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L1_1 = addRelatedProcess
  L1_1()
  L1_1 = reportRelatedBmHits
  L1_1()
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "ImagePath"
  L3_1 = L0_1
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1486"
  L4_1 = "Impact_FileEncryption"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
