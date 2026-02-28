local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
      L7_1 = L6_1.ppid
      if L7_1 ~= nil then
        L7_1 = bm
        L7_1 = L7_1.request_SMS
        L8_1 = L6_1.ppid
        L9_1 = "H"
        L7_1(L8_1, L9_1)
        L7_1 = bm
        L7_1 = L7_1.add_action
        L8_1 = "SmsAsyncScanEvent"
        L9_1 = 5000
        L7_1(L8_1, L9_1)
        L7_1 = TrackPidAndTechniqueBM
        L8_1 = L6_1.ppid
        L9_1 = "T1133"
        L10_1 = "remote_access_tool_childproc"
        L7_1(L8_1, L9_1, L10_1)
        L7_1 = triggerMemQueryOnProcess
        L8_1 = L6_1.ppid
        L9_1 = "Behavior:Win32/ActiveConnToAttackerServer.C"
        L10_1 = "remote_access_tool_childproc"
        L7_1(L8_1, L9_1, L10_1)
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
