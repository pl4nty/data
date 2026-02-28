local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = sysio
L0_1 = L0_1.IsFileExists
L1_1 = "/run/yum.pid"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[13]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[13]
  L1_1 = L3_1.utf8p1
  L3_1 = this_sigattrlog
  L3_1 = L3_1[13]
  L2_1 = L3_1.ppid
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[14]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[14]
    L1_1 = L3_1.utf8p1
    L3_1 = this_sigattrlog
    L3_1 = L3_1[14]
    L2_1 = L3_1.ppid
  end
end
if L1_1 ~= nil then
  L3_1 = isParentPackageManager
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = taint
  L4_1 = L1_1
  L5_1 = L0_1
  L6_1 = 3600
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.get_current_process_startup_info
  L3_1 = L3_1()
  L4_1 = bm
  L4_1 = L4_1.get_process_relationships
  L5_1 = L3_1.ppid
  L4_1, L5_1 = L4_1(L5_1)
  L6_1 = ipairs
  L7_1 = L4_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = bm
    L11_1 = L11_1.add_related_process
    L12_1 = L10_1.ppid
    L11_1(L12_1)
    L11_1 = TrackPidAndTechniqueBM
    L12_1 = L10_1.ppid
    L13_1 = "T1105"
    L14_1 = "CommandAndControl"
    L11_1(L12_1, L13_1, L14_1)
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
