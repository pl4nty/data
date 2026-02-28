local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = isnull
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
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
          L2_1 = L1_1.integrity_level
          L3_1 = MpCommon
          L3_1 = L3_1.SECURITY_MANDATORY_HIGH_RID
          if L2_1 >= L3_1 then
            L2_1 = {}
            L3_1 = "services.exe"
            L2_1[1] = L3_1
            L3_1 = MpCommon
            L3_1 = L3_1.GetProcessElevationAndIntegrityLevel
            L4_1 = L1_1.ppid
            L3_1 = L3_1(L4_1)
            if L3_1 then
              L4_1 = next
              L5_1 = L3_1
              L4_1 = L4_1(L5_1)
              if L4_1 then
                L4_1 = L3_1.IntegrityLevel
                if L4_1 then
                  L4_1 = L3_1.IntegrityLevel
                  L5_1 = MpCommon
                  L5_1 = L5_1.SECURITY_MANDATORY_HIGH_RID
                  if L4_1 >= L5_1 then
                    L4_1 = IsProcNameInParentProcessTree
                    L5_1 = "BM"
                    L6_1 = L2_1
                    L4_1 = L4_1(L5_1, L6_1)
                    if L4_1 then
                      L4_1 = string
                      L4_1 = L4_1.lower
                      L5_1 = L1_1.command_line
                      L4_1 = L4_1(L5_1)
                      L5_1 = bm_AddRelatedFileFromCommandLine
                      L6_1 = L4_1
                      L7_1 = nil
                      L8_1 = nil
                      L9_1 = 1
                      L5_1(L6_1, L7_1, L8_1, L9_1)
                      L5_1 = bm
                      L5_1 = L5_1.request_SMS
                      L6_1 = L1_1.ppid
                      L7_1 = "h+"
                      L5_1(L6_1, L7_1)
                      L5_1 = bm
                      L5_1 = L5_1.add_action
                      L6_1 = "SmsAsyncScanEvent"
                      L7_1 = 1
                      L5_1(L6_1, L7_1)
                      L5_1 = bm
                      L5_1 = L5_1.add_related_string
                      L6_1 = "[->] MEDICATED URL: "
                      L7_1 = L0_1
                      L8_1 = bm
                      L8_1 = L8_1.RelatedStringBMReport
                      L5_1(L6_1, L7_1, L8_1)
                      L5_1 = bm
                      L5_1 = L5_1.add_related_file
                      L6_1 = L4_1
                      L5_1(L6_1)
                      L5_1 = pcallEx
                      L6_1 = "triggerMemoryScanOnProcessTree"
                      L7_1 = triggerMemoryScanOnProcessTree
                      L8_1 = false
                      L9_1 = true
                      L10_1 = "SMS_H"
                      L11_1 = 5000
                      L12_1 = "Behavior:Win32/SusMemDownload.MK!sms"
                      L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
                      L5_1 = mp
                      L5_1 = L5_1.INFECTED
                      return L5_1
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
