local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = pcall
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L1_1, L2_1 = L1_1(L2_1)
L3_1 = nil
if L1_1 then
  L0_1 = L2_1.command_line
  L3_1 = L2_1.ppid
end
if L0_1 ~= nil and L3_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.GetExecutablesFromCommandLine
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = mp
    L10_1 = L10_1.ContextualExpandEnvironmentVariables
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L9_1 = L10_1
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.IsKnownFriendlyFile
      L11_1 = L9_1
      L12_1 = true
      L13_1 = false
      L10_1 = L10_1(L11_1, L12_1, L13_1)
      if not L10_1 then
        L10_1 = bm
        L10_1 = L10_1.add_related_file
        L11_1 = L9_1
        L10_1(L11_1)
      end
    end
  end
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = L3_1
  L7_1 = "T1574.002"
  L8_1 = "susp_dll_loaded"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
