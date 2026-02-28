local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = "\\windows\\system32"
L3_1 = "%system%\\"
L4_1 = "\\windows\\syswow64"
L5_1 = "\\windows\\pxiesys.ini\\system32\\"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = contains
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L2_1 = sysio
L2_1 = L2_1.IsFileExists
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = bm
  L2_1 = L2_1.add_threat_file
  L3_1 = L0_1
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
