local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = bm_AddRelatedFileFromCommandLine
L2_1 = L0_1.command_line
L3_1 = nil
L4_1 = nil
L5_1 = 1
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.bitand
  L9_1 = L7_1.reason_ex
  L10_1 = bm
  L10_1 = L10_1.RELATIONSHIP_INJECTION
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = bm
  L9_1 = L9_1.RELATIONSHIP_INJECTION
  if L8_1 == L9_1 then
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = L7_1.ppid
    L11_1 = "T1055.002"
    L12_1 = "processinjection_target_remoteinitiated_a"
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = bm
    L9_1 = L9_1.request_SMS
    L10_1 = L7_1.ppid
    L11_1 = "M"
    L9_1(L10_1, L11_1)
    L9_1 = bm
    L9_1 = L9_1.add_action
    L10_1 = "SmsAsyncScanEvent"
    L11_1 = 1000
    L9_1(L10_1, L11_1)
  end
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1055.002"
L6_1 = "processinjection_source_remoteinitiated_a"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
