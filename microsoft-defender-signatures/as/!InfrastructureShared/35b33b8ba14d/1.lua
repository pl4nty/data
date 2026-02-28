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
        L9_1 = L6_1.image_path
        L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L8_1(L9_1)
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "\\explorer.exe"
        L11_1 = -13
        L12_1 = true
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
        if L8_1 then
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = MpCommon
          L9_1 = L9_1.PathToWin32Path
          L10_1 = bm
          L10_1 = L10_1.get_imagepath
          L10_1, L11_1, L12_1, L13_1 = L10_1()
          L9_1, L10_1, L11_1, L12_1, L13_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
          L9_1 = bm
          L9_1 = L9_1.get_current_process_startup_info
          L9_1 = L9_1()
          L10_1 = sysio
          L10_1 = L10_1.IsFileExists
          L11_1 = L8_1
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = mp
            L10_1 = L10_1.IsKnownFriendlyFile
            L11_1 = L8_1
            L12_1 = true
            L13_1 = false
            L10_1 = L10_1(L11_1, L12_1, L13_1)
            if not L10_1 then
              L10_1 = bm
              L10_1 = L10_1.add_related_file
              L11_1 = L8_1
              L10_1(L11_1)
              L10_1 = bm
              L10_1 = L10_1.request_SMS
              L11_1 = L9_1.ppid
              L12_1 = "m+"
              L10_1(L11_1, L12_1)
              L10_1 = bm
              L10_1 = L10_1.add_action
              L11_1 = "SmsAsyncScanEvent"
              L12_1 = 1
              L10_1(L11_1, L12_1)
            end
          end
          L10_1 = bm
          L10_1 = L10_1.request_SMS
          L11_1 = L6_1.ppid
          L12_1 = "m+"
          L10_1(L11_1, L12_1)
          L10_1 = bm
          L10_1 = L10_1.add_action
          L11_1 = "SmsAsyncScanEvent"
          L12_1 = 1
          L10_1(L11_1, L12_1)
          L10_1 = bm
          L10_1 = L10_1.trigger_sig
          L11_1 = "Explorer"
          L12_1 = "InjectRemoteThread"
          L10_1(L11_1, L12_1)
          L10_1 = TrackPidAndTechniqueBM
          L11_1 = "BM"
          L12_1 = "T1055.002"
          L13_1 = "portable_executable_injection"
          L10_1(L11_1, L12_1, L13_1)
          L10_1 = mp
          L10_1 = L10_1.INFECTED
          return L10_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
