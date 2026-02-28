local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 12000000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.utf8p1
  end
end
L2_1 = isLolbinFilename
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm_AddRelatedFileFromCommandLine
L3_1 = L0_1
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
