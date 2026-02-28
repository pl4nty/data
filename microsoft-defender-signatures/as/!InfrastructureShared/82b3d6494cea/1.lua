local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = L6_1.ppid
    if L7_1 ~= nil then
      L7_1 = MpCommon
      L7_1 = L7_1.IsFriendlyProcess
      L8_1 = L6_1.ppid
      L7_1 = L7_1(L8_1)
      if not L7_1 then
        L7_1 = 1
        L8_1 = mp
        L8_1 = L8_1.bitand
        L9_1 = L6_1.reason_ex
        L10_1 = L7_1
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 == L7_1 then
          L9_1 = L6_1.image_path
          L10_1 = L6_1.ppid
          L11_1 = L6_1.cmd_line
          if not L11_1 then
            L11_1 = ""
          end
          L12_1 = MpCommon
          L12_1 = L12_1.Base64Encode
          L13_1 = L9_1
          L14_1 = "|"
          L15_1 = L11_1
          L13_1 = L13_1 .. L14_1 .. L15_1
          L12_1 = L12_1(L13_1)
          L13_1 = ";"
          L14_1 = L10_1
          L12_1 = L12_1 .. L13_1 .. L14_1
          L13_1 = "RemoteInvocation:WMI|"
          L14_1 = MpCommon
          L14_1 = L14_1.Base64Encode
          L15_1 = L9_1
          L14_1 = L14_1(L15_1)
          L13_1 = L13_1 .. L14_1
          L14_1 = reportSessionInformationInclusive
          L14_1 = L14_1()
          L15_1 = AppendToRollingQueue
          L16_1 = L13_1
          L17_1 = L10_1
          L18_1 = safeJsonSerialize
          L19_1 = L14_1
          L18_1 = L18_1(L19_1)
          L19_1 = 3600
          L20_1 = 100
          L21_1 = 1
          L15_1(L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
          L15_1 = recursiveTriggerSig
          L16_1 = "RemoteInvocation:WMI"
          L17_1 = L12_1
          L18_1 = L10_1
          L19_1 = 0
          L15_1(L16_1, L17_1, L18_1, L19_1)
        end
      end
    end
  end
end
L2_1 = reportRelevantUntrustedEntities
L2_1()
L2_1 = reportTimingData
L2_1()
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
