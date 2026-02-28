local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  L3_1 = table
  L3_1 = L3_1.insert
  L4_1 = L0_1
  L5_1 = {}
  L5_1.Event = "ProcessCreate_0"
  L5_1.ImagePath = L1_1
  L5_1.P2 = L2_1
  L3_1(L4_1, L5_1)
end
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  L3_1 = table
  L3_1 = L3_1.insert
  L4_1 = L0_1
  L5_1 = {}
  L5_1.Event = "OpenProc_0"
  L5_1.ImagePath = L1_1
  L5_1.P2 = L2_1
  L3_1(L4_1, L5_1)
end
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  L3_1 = table
  L3_1 = L3_1.insert
  L4_1 = L0_1
  L5_1 = {}
  L5_1.Event = "ProcessCreate_1"
  L5_1.ImagePath = L1_1
  L5_1.P2 = L2_1
  L3_1(L4_1, L5_1)
end
L1_1 = bm
L1_1 = L1_1.add_related_string
L2_1 = "AdditionalInfo"
L3_1 = safeJsonSerialize
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = bm
L4_1 = L4_1.RelatedStringBMReport
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
