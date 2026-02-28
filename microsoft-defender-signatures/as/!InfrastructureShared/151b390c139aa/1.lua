local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = next
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = L0_1.command_line
    if L1_1 then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.command_line
      L1_1 = L1_1(L2_1)
      L2_1 = bm_AddRelatedFileFromCommandLine
      L3_1 = L1_1
      L4_1 = nil
      L5_1 = nil
      L6_1 = 1
      L2_1(L3_1, L4_1, L5_1, L6_1)
      L2_1 = bm
      L2_1 = L2_1.request_SMS
      L3_1 = L0_1.ppid
      L4_1 = "h+"
      L2_1(L3_1, L4_1)
      L2_1 = bm
      L2_1 = L2_1.add_action
      L3_1 = "SmsAsyncScanEvent"
      L4_1 = 1
      L2_1(L3_1, L4_1)
      L2_1 = bm
      L2_1 = L2_1.add_related_string
      L3_1 = "[->] MEDICATED COMMAND LINE: "
      L4_1 = L1_1
      L5_1 = bm
      L5_1 = L5_1.RelatedStringBMReport
      L2_1(L3_1, L4_1, L5_1)
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
    end
  end
end
L1_1 = triggerMemoryScanOnProcessTree
L2_1 = true
L3_1 = true
L4_1 = "SMS_H"
L5_1 = 5000
L6_1 = "Behavior:Win32/SharpHound.MK"
L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
L1_1 = add_parents
L1_1()
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
