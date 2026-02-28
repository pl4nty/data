local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L3_1 = bm
L3_1 = L3_1.GetSignatureMatchDuration
L3_1 = L3_1()
if 600000000 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L0_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L1_1 = L3_1.utf8p1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[5]
  L2_1 = L3_1.utf8p1
end
if not L0_1 or L0_1 == "" or L0_1 ~= L1_1 or L0_1 ~= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1190"
L6_1 = "InitialAccess_ElfFileDrop"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
