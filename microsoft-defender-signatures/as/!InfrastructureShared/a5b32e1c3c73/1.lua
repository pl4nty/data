local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = "remote_file_created_taint"
L1_1 = "queue_pid_taintfactory_a"
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L2_1 = L5_1.ppid
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[3]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[3]
    L2_1 = L5_1.ppid
  else
    L5_1 = this_sigattrlog
    L5_1 = L5_1[4]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L2_1 = L5_1.ppid
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[5]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[5]
  L3_1 = L5_1.utf8p1
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[6]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[6]
    L3_1 = L5_1.utf8p1
  else
    L5_1 = this_sigattrlog
    L5_1 = L5_1[7]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[7]
      L3_1 = L5_1.utf8p1
    end
  end
end
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[8]
  L4_1 = L5_1.utf8p1
end
if L2_1 ~= nil and L3_1 ~= nil and L4_1 ~= nil then
  L5_1 = isParentPackageManager
  L6_1 = L2_1
  L7_1 = true
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = isTainted
    L6_1 = L3_1
    L7_1 = L0_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = AppendToRollingQueue
      L6_1 = L1_1
      L7_1 = L2_1
      L8_1 = 1
      L9_1 = 600
      L5_1(L6_1, L7_1, L8_1, L9_1)
      L5_1 = taint
      L6_1 = L4_1
      L7_1 = L0_1
      L8_1 = 3600
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = bm
      L5_1 = L5_1.get_process_relationships
      L6_1 = L2_1
      L5_1, L6_1 = L5_1(L6_1)
      L7_1 = ipairs
      L8_1 = L5_1
      L7_1, L8_1, L9_1 = L7_1(L8_1)
      for L10_1, L11_1 in L7_1, L8_1, L9_1 do
        L12_1 = bm
        L12_1 = L12_1.add_related_process
        L13_1 = L11_1.ppid
        L12_1(L13_1)
        L12_1 = TrackPidAndTechniqueBM
        L13_1 = L11_1.ppid
        L14_1 = "T1105"
        L15_1 = "CommandAndControl"
        L12_1(L13_1, L14_1, L15_1)
      end
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
