local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[4]
    L0_1 = L0_1.utf8p2
    L1_1 = bm
    L1_1 = L1_1.get_current_process_startup_info
    L1_1 = L1_1()
    if L1_1 then
      L2_1 = next
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L2_1 = L1_1.command_line
        if L2_1 then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = L1_1.command_line
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
          L4_1 = "[->] MEDICATED URL: "
          L5_1 = L0_1
          L6_1 = bm
          L6_1 = L6_1.RelatedStringBMReport
          L3_1(L4_1, L5_1, L6_1)
          L3_1 = bm
          L3_1 = L3_1.add_related_file
          L4_1 = L2_1
          L3_1(L4_1)
        end
      end
    end
    L2_1 = triggerMemoryScanOnProcessTree
    L3_1 = true
    L4_1 = false
    L5_1 = "SMS_H"
    L6_1 = 5000
    L7_1 = "Behavior:Win32/SusMemDownload.JM"
    L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
    L2_1 = add_parents
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
