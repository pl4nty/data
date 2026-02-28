local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = bm
    L1_1 = L1_1.request_SMS
    L2_1 = L0_1.ppid
    L3_1 = "M"
    L1_1(L2_1, L3_1)
    L1_1 = bm
    L1_1 = L1_1.add_action
    L2_1 = "SmsAsyncScanEvent"
    L3_1 = 500
    L1_1(L2_1, L3_1)
    L1_1 = bm
    L1_1 = L1_1.add_action
    L2_1 = "EmsScan"
    L3_1 = 500
    L1_1(L2_1, L3_1)
  end
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
if L2_1 ~= nil then
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    if L7_1 ~= nil then
      L8_1 = L7_1.ppid
      if L8_1 ~= nil then
        L8_1 = bm
        L8_1 = L8_1.request_SMS
        L9_1 = L7_1.ppid
        L10_1 = "M"
        L8_1(L9_1, L10_1)
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
