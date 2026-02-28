local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L1_1 = L3_1.utf8p1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L2_1 = L3_1.ppid
end
if L1_1 then
  L3_1 = isParentPackageManager
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = isTainted
  L4_1 = L1_1
  L5_1 = L0_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
