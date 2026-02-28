local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = is_excluded_parent_proc_auto
L0_1 = L0_1()
if not L0_1 then
  L0_1 = IsSenseRelatedProc
  L0_1 = L0_1()
  if L0_1 ~= true then
    L0_1 = IsProcNameInParentProcessTree
    L1_1 = "BM"
    L2_1 = {}
    L3_1 = "acrodist.exe"
    L4_1 = "csrss.exe"
    L2_1[1] = L3_1
    L2_1[2] = L4_1
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      goto lbl_21
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_21::
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
      L2_1 = L0_1.integrity_level
      L3_1 = MpCommon
      L3_1 = L3_1.SECURITY_MANDATORY_MEDIUM_RID
      if L2_1 < L3_1 then
        L2_1 = MpCommon
        L2_1 = L2_1.GetProcessElevationAndIntegrityLevel
        L3_1 = L0_1.ppid
        L2_1 = L2_1(L3_1)
        if L2_1 then
          L3_1 = next
          L4_1 = L2_1
          L3_1 = L3_1(L4_1)
          if L3_1 then
            L3_1 = L2_1.IntegrityLevel
            if L3_1 then
              L3_1 = L2_1.IntegrityLevel
              L4_1 = MpCommon
              L4_1 = L4_1.SECURITY_MANDATORY_MEDIUM_RID
              if L3_1 < L4_1 then
                L3_1 = bm_AddRelatedFileFromCommandLine
                L4_1 = L1_1
                L5_1 = nil
                L6_1 = nil
                L7_1 = 1
                L3_1(L4_1, L5_1, L6_1, L7_1)
                L3_1 = bm
                L3_1 = L3_1.request_SMS
                L4_1 = L0_1.ppid
                L5_1 = "h+"
                L3_1(L4_1, L5_1)
                L3_1 = bm
                L3_1 = L3_1.add_action
                L4_1 = "SmsAsyncScanEvent"
                L5_1 = 1
                L3_1(L4_1, L5_1)
                L3_1 = bm
                L3_1 = L3_1.add_related_string
                L4_1 = "[->] MEDICATED COMMAND LINE: "
                L5_1 = L1_1
                L6_1 = bm
                L6_1 = L6_1.RelatedStringBMReport
                L3_1(L4_1, L5_1, L6_1)
                L3_1 = bm
                L3_1 = L3_1.add_related_file
                L4_1 = L1_1
                L3_1(L4_1)
                L3_1 = pcallEx
                L4_1 = "triggerMemoryScanOnProcessTree"
                L5_1 = triggerMemoryScanOnProcessTree
                L6_1 = false
                L7_1 = true
                L8_1 = "SMS_H"
                L9_1 = 5000
                L10_1 = "Behavior:Win32/AMSI.HardwareBreakPoint.G!sms"
                L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
                L3_1 = mp
                L3_1 = L3_1.INFECTED
                return L3_1
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
