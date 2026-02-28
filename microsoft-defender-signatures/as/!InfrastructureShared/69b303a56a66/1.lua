local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L1_1 = L3_1.utf8p1
end
if L2_1 ~= nil and L1_1 ~= nil then
  L3_1 = isParentPackageManager
  L4_1 = L2_1.ppid
  L5_1 = true
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = TrackPidAndTechniqueBM
    L4_1 = L2_1.ppid
    L5_1 = "T1562.001"
    L6_1 = "DefenseEvasion"
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = isTainted
    L4_1 = L1_1
    L5_1 = L0_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = addRelatedProcess
      L3_1()
      L3_1 = reportRelatedBmHits
      L3_1()
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
