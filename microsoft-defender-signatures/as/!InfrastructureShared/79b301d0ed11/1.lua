local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L0_1 = L1_1.ppid
end
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.get_process_notifications
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = ipairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L6_1.tag
      L8_1 = bm
      L8_1 = L8_1.ActionTagFileCreate
      if L7_1 == L8_1 then
        L7_1 = L6_1.rawutf8p1
        L8_1 = taint
        L9_1 = L7_1
        L10_1 = "remote_file_created_taint"
        L11_1 = 3600
        L8_1(L9_1, L10_1, L11_1)
        L8_1 = AppendToRollingQueue
        L9_1 = "queue_pid_taintfactory_a"
        L10_1 = L0_1
        L11_1 = 1
        L12_1 = 600
        L8_1(L9_1, L10_1, L11_1, L12_1)
        L8_1 = bm
        L8_1 = L8_1.get_current_process_startup_info
        L8_1 = L8_1()
        L9_1 = bm
        L9_1 = L9_1.get_process_relationships
        L10_1 = L8_1.ppid
        L9_1, L10_1 = L9_1(L10_1)
        L11_1 = ipairs
        L12_1 = L9_1
        L11_1, L12_1, L13_1 = L11_1(L12_1)
        for L14_1, L15_1 in L11_1, L12_1, L13_1 do
          L16_1 = bm
          L16_1 = L16_1.add_related_process
          L17_1 = L15_1.ppid
          L16_1(L17_1)
          L16_1 = TrackPidAndTechniqueBM
          L17_1 = L15_1.ppid
          L18_1 = "T1105"
          L19_1 = "CommandAndControl"
          L16_1(L17_1, L18_1, L19_1)
        end
        L11_1 = mp
        L11_1 = L11_1.INFECTED
        return L11_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
