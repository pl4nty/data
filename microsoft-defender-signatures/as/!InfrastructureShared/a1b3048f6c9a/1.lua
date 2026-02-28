local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.command_line
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = L0_1.command_line
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "%)%.b64decode%(%s*b?['\"]([A-Za-z0-9%+/=]+)['\"]%)"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.len
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 < 1024 then
        L3_1 = bm
        L3_1 = L3_1.get_current_process_startup_info
        L3_1 = L3_1()
        L4_1 = bm
        L4_1 = L4_1.request_SMS
        L5_1 = L3_1.ppid
        L6_1 = "M"
        L4_1(L5_1, L6_1)
        L4_1 = bm
        L4_1 = L4_1.add_action
        L5_1 = "SmsAsyncScanEvent"
        L6_1 = 100
        L4_1(L5_1, L6_1)
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
