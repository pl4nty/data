local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
      goto lbl_17
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.command_line
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "gpsvc"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = L2_1 ~= nil
L3_1 = string
L3_1 = L3_1.find
L4_1 = L1_1
L5_1 = "schedule"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
L3_1 = L3_1 ~= nil
if L2_1 and L3_1 then
  L4_1 = bm_AddRelatedFileFromCommandLine
  L5_1 = L1_1
  L6_1 = nil
  L7_1 = nil
  L8_1 = 1
  L4_1(L5_1, L6_1, L7_1, L8_1)
  L4_1 = bm
  L4_1 = L4_1.add_related_file
  L5_1 = L1_1
  L4_1(L5_1)
  L4_1 = bm
  L4_1 = L4_1.add_related_string
  L5_1 = "[->] MEDICATED SCRIPT: "
  L6_1 = L1_1
  L7_1 = bm
  L7_1 = L7_1.RelatedStringBMReport
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = bm
  L4_1 = L4_1.request_SMS
  L5_1 = L0_1.ppid
  L6_1 = "h+"
  L4_1(L5_1, L6_1)
  L4_1 = bm
  L4_1 = L4_1.add_action
  L5_1 = "SmsAsyncScanEvent"
  L6_1 = 1
  L4_1(L5_1, L6_1)
  L4_1 = triggerMemoryScanOnProcessTree
  L5_1 = true
  L6_1 = false
  L7_1 = "SMS_H"
  L8_1 = 5000
  L9_1 = "Behavior:Win32/SusGPOUpdate.MK"
  L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
  L4_1 = add_parents
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
