local L0_1, L1_1, L2_1, L3_1
L0_1 = reportGenericRansomwareRQ
L1_1 = "gene_linux_ransom_meta"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L0_1 = TrackPidAndTechniqueBM
  L1_1 = "BM"
  L2_1 = "T1486"
  L3_1 = "Impact_FileEncryption"
  L0_1(L1_1, L2_1, L3_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
