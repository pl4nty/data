local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  if L7_1 then
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = isTainted
      L9_1 = L7_1
      L10_1 = "remote_file_created_taint"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L8_1 = addRelatedProcess
        L8_1()
        L8_1 = reportRelatedBmHits
        L8_1()
        L8_1 = TrackPidAndTechniqueBM
        L9_1 = "BM"
        L10_1 = "T1080"
        L11_1 = "LateralMovement_TaintSharedContent_RemoteMountedScriptExecution"
        L8_1(L9_1, L10_1, L11_1)
        L8_1 = mp
        L8_1 = L8_1.INFECTED
        return L8_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
