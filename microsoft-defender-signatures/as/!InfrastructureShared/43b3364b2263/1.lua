local L0_1, L1_1, L2_1, L3_1
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
if L0_1 ~= "" and L0_1 ~= nil then
  L1_1 = bm
  L1_1 = L1_1.trigger_sig
  L2_1 = L0_1
  L3_1 = "BMDroppedArchiveInRoot"
  L1_1(L2_1, L3_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
