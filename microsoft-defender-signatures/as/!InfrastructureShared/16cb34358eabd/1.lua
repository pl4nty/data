local L0_1, L1_1, L2_1, L3_1
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
    L3_1 = 1000
    L1_1(L2_1, L3_1)
    L1_1 = bm
    L1_1 = L1_1.add_action
    L2_1 = "EmsScan"
    L3_1 = 500
    L1_1(L2_1, L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
