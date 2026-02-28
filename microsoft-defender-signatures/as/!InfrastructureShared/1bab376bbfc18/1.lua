local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[8]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L1_1 = L2_1.utf8p1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[10]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L0_1 = L2_1.utf8p2
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L1_1 = L2_1.utf8p1
end
if not L1_1 or not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "InjectionType"
L4_1 = L0_1
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "InjectedIn"
L4_1 = L1_1
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
