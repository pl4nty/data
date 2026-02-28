local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = L0_1.ppid
L2_1 = IsTacticObservedForParents
L3_1 = L1_1
L4_1 = "bas_tool_safebreach_process"
L5_1 = 3
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = bm
  L2_1 = L2_1.request_SMS
  L3_1 = L1_1
  L4_1 = "M"
  L2_1(L3_1, L4_1)
  L2_1 = bm
  L2_1 = L2_1.add_action
  L3_1 = "SmsAsyncScanEvent"
  L4_1 = 1
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
