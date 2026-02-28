local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L0_1 = L1_1.utf8p1
end
if L0_1 ~= nil then
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  L2_1 = isnull
  L3_1 = L1_1.command_line
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    L2_1 = L1_1.command_line
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "-k localService -p -s RemoteRegistry"
    L6_1 = -36
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = GetRollingQueue
      L4_1 = "SuspADSyncAccessByPid4"
      L3_1 = L3_1(L4_1)
      if L3_1 ~= nil then
        L3_1 = bm
        L3_1 = L3_1.add_threat_file
        L4_1 = L0_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
