local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = GetRollingQueueKeys
L1_1 = "Trojan:Win32/EnumDesktopsA.AM"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  if L1_1 then
    L2_1 = L1_1.command_line
    if L2_1 then
      goto lbl_17
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_17::
  L2_1 = L1_1.command_line
  L3_1 = L2_1
  L2_1 = L2_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = bm_AddRelatedFileFromCommandLine
  L4_1 = L2_1
  L5_1 = nil
  L6_1 = nil
  L7_1 = 1
  L3_1(L4_1, L5_1, L6_1, L7_1)
  L3_1 = bm
  L3_1 = L3_1.request_SMS
  L4_1 = L1_1.ppid
  L5_1 = "h+"
  L3_1(L4_1, L5_1)
  L3_1 = bm
  L3_1 = L3_1.add_action
  L4_1 = "SmsAsyncScanEvent"
  L5_1 = 1
  L3_1(L4_1, L5_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "[->] PAYLOAD: "
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L2_1
  L3_1(L4_1)
  L3_1 = triggerMemoryScanOnProcessTree
  L4_1 = true
  L5_1 = true
  L6_1 = "SMS_H"
  L7_1 = 5000
  L8_1 = "Behavior:Win32/EnumDesktopsA.MK"
  L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  L3_1 = add_parents
  L3_1()
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
