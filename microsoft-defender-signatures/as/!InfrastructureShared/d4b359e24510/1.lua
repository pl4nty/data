local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p2
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.CommandLineScan
L2_1 = L0_1
L3_1 = 0
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "ScrpService_cmdline"
  L4_1 = L0_1
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "ScrpService"
  L4_1 = tostring
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
