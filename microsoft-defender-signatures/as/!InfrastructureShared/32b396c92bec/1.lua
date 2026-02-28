local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = bm
    L2_1 = L2_1.trigger_sig
    L3_1 = L0_1
    L4_1 = "FTPStoreParent"
    L5_1 = L1_1.ppid
    L2_1(L3_1, L4_1, L5_1)
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
