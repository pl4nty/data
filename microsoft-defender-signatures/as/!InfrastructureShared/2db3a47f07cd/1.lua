local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 then
  L1_1 = isTainted
  L2_1 = L0_1
  L3_1 = "upx_file_created_taint"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = bm
    L1_1 = L1_1.add_related_file
    L2_1 = L0_1
    L1_1(L2_1)
    L1_1 = taint
    L2_1 = L0_1
    L3_1 = "upx_file_chmodexec"
    L4_1 = 3600
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
