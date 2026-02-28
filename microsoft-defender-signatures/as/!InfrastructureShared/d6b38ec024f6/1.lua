local L0_1, L1_1, L2_1
L0_1 = pcallEx
L1_1 = "isCurrentProcessFriendly"
L2_1 = isCurrentProcessFriendly
L0_1, L1_1 = L0_1(L1_1, L2_1)
if not L0_1 then
  L2_1 = reportPcallEx
  L2_1()
  L1_1 = false
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
