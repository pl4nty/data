local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = IsADConnectRole
L1_1 = L1_1()
if L1_1 then
  L0_1 = "Ad Connect"
else
  L1_1 = IsADConnectCloudSyncRole
  L1_1 = L1_1()
  if L1_1 then
    L0_1 = "Ad Connect Cloud Sync"
  else
    L1_1 = IsADFSRole
    L1_1 = L1_1()
    if L1_1 then
      L0_1 = "ADFS"
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "HybridServerRole"
L3_1 = L0_1
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
