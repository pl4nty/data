local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
if L1_1 ~= nil then
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = L6_1.image_path
    if L7_1 ~= nil then
      L7_1 = L6_1.reason
      L8_1 = bm
      L8_1 = L8_1.RELATIONSHIP_INJECTION
      if L7_1 == L8_1 then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = MpCommon
        L8_1 = L8_1.PathToWin32Path
        L9_1 = bm
        L9_1 = L9_1.get_imagepath
        L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1()
        L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
        L8_1 = sysio
        L8_1 = L8_1.IsFileExists
        L9_1 = L7_1
        L8_1 = L8_1(L9_1)
        if L8_1 then
          L8_1 = mp
          L8_1 = L8_1.IsKnownFriendlyFile
          L9_1 = L7_1
          L10_1 = true
          L11_1 = false
          L8_1 = L8_1(L9_1, L10_1, L11_1)
          if not L8_1 then
            L8_1 = bm
            L8_1 = L8_1.add_related_file
            L9_1 = L7_1
            L8_1(L9_1)
            L8_1 = bm
            L8_1 = L8_1.get_current_process_startup_info
            L8_1 = L8_1()
            L9_1 = bm
            L9_1 = L9_1.request_SMS
            L10_1 = L8_1.ppid
            L11_1 = "m+"
            L9_1(L10_1, L11_1)
            L9_1 = bm
            L9_1 = L9_1.add_action
            L10_1 = "SmsAsyncScanEvent"
            L11_1 = 1
            L9_1(L10_1, L11_1)
          end
        end
        L8_1 = string
        L8_1 = L8_1.lower
        L9_1 = MpCommon
        L9_1 = L9_1.PathToWin32Path
        L10_1 = L6_1.image_path
        L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1)
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "\\installutil.exe"
        L12_1 = -16
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if L9_1 then
          L9_1 = bm
          L9_1 = L9_1.request_SMS
          L10_1 = L6_1.ppid
          L11_1 = "h+"
          L9_1(L10_1, L11_1)
          L9_1 = bm
          L9_1 = L9_1.add_action
          L10_1 = "SmsAsyncScanEvent"
          L11_1 = 1
          L9_1(L10_1, L11_1)
          L9_1 = bm
          L9_1 = L9_1.trigger_sig
          L10_1 = "InstallUtil"
          L11_1 = "WriteVM"
          L9_1(L10_1, L11_1)
          L9_1 = TrackPidAndTechniqueBM
          L10_1 = "BM"
          L11_1 = "T1055.002"
          L12_1 = "portable_executable_injection"
          L9_1(L10_1, L11_1, L12_1)
          L9_1 = mp
          L9_1 = L9_1.INFECTED
          return L9_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
