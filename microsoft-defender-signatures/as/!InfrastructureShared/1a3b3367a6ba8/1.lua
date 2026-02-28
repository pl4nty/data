local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = L1_1.command_line
    if L2_1 ~= nil then
      goto lbl_15
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_15::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L0_1 = L2_1.utf8p1
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L0_1 = L2_1.utf8p1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[9]
      L0_1 = L2_1.utf8p1
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[10]
        L0_1 = L2_1.utf8p1
      else
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
  end
end
if L0_1 ~= nil then
  L2_1 = bm
  L2_1 = L2_1.add_related_file
  L3_1 = L0_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.ReportLowfi
  L3_1 = L0_1
  L4_1 = 1690978323
  L2_1(L3_1, L4_1)
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1574"
L5_1 = "DefenseEvasion_HijackExecutionFlow_WWDSuspiciousModuleDrop"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
