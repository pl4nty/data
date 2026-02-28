local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[9]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[10]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[10]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[11]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[11]
        L0_1 = L1_1.utf8p1
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[12]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[12]
        L1_1 = L1_1.utf8p1
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[12]
          L0_1 = L1_1.utf8p1
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[13]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[13]
          L1_1 = L1_1.utf8p1
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[13]
            L0_1 = L1_1.utf8p1
          end
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = taint
  L2_1 = L0_1
  L3_1 = "remote_file_created_taint_inWWWD"
  L4_1 = 3600
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  L2_1 = isnull
  L3_1 = L1_1.ppid
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = bm
    L2_1 = L2_1.get_process_relationships
    L3_1 = L1_1.ppid
    L2_1, L3_1 = L2_1(L3_1)
    L4_1 = AppendToRollingQueue
    L5_1 = "queue_pid_taintfactory_a"
    L6_1 = L1_1.ppid
    L7_1 = 1
    L8_1 = 600
    L4_1(L5_1, L6_1, L7_1, L8_1)
    L4_1 = ipairs
    L5_1 = L2_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = bm
      L9_1 = L9_1.add_related_process
      L10_1 = L8_1.ppid
      L9_1(L10_1)
      L9_1 = TrackPidAndTechniqueBM
      L10_1 = L8_1.ppid
      L11_1 = "T1105"
      L12_1 = "CommandAndControl_IngressToolsTransfer"
      L9_1(L10_1, L11_1, L12_1)
    end
  end
  L2_1 = bm
  L2_1 = L2_1.trigger_sig
  L3_1 = "RemoteFileCopyInWWD"
  L4_1 = L0_1
  L2_1(L3_1, L4_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
