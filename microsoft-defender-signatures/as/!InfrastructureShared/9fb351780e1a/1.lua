local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.GetExecutablesFromCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = mp
    L8_1 = L8_1.ContextualExpandEnvironmentVariables
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
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
      end
    end
  end
end
L2_1 = sms_untrusted_process
L2_1()
L2_1 = reportSessionInformation
L2_1()
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1490"
L5_1 = "inhibit_system_recovery"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
