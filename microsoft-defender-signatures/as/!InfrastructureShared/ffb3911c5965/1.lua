local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.utf8p2
  L1_1 = L0_1
  L0_1 = L0_1.lower
  L0_1 = L0_1(L1_1)
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = "treatwarningsaserrors=true"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.ppid
  if L1_1 ~= nil then
    L2_1 = bm
    L2_1 = L2_1.request_SMS
    L3_1 = L1_1
    L4_1 = "M"
    L2_1(L3_1, L4_1)
    L2_1 = bm
    L2_1 = L2_1.add_action
    L3_1 = "SmsAsyncScanEvent"
    L4_1 = 100
    L2_1(L3_1, L4_1)
    L2_1 = add_parents
    L2_1()
    L2_1 = reportRelatedBmHits
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
