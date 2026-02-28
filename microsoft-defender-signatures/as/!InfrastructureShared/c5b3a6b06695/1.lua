local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = "remote_file_created_taint"
L1_1 = "queue_pid_taintfactory_a"
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = this_sigattrlog
L6_1 = L6_1[2]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L2_1 = L6_1.ppid
  L6_1 = this_sigattrlog
  L6_1 = L6_1[2]
  L3_1 = L6_1.utf8p2
else
  L6_1 = this_sigattrlog
  L6_1 = L6_1[3]
  L6_1 = L6_1.matched
  if L6_1 then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L2_1 = L6_1.ppid
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L3_1 = L6_1.utf8p2
  else
    L6_1 = this_sigattrlog
    L6_1 = L6_1[4]
    L6_1 = L6_1.matched
    if L6_1 then
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L2_1 = L6_1.ppid
      L6_1 = this_sigattrlog
      L6_1 = L6_1[4]
      L3_1 = L6_1.utf8p2
    end
  end
end
if not L3_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.GetExecutablesFromCommandLine
L7_1 = L3_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L7_1 = ipairs
  L8_1 = L6_1
  L7_1, L8_1, L9_1 = L7_1(L8_1)
  for L10_1, L11_1 in L7_1, L8_1, L9_1 do
    L12_1 = sysio
    L12_1 = L12_1.IsFileExists
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    if L12_1 then
      L4_1 = L11_1
      break
    end
  end
end
L7_1 = this_sigattrlog
L7_1 = L7_1[5]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[5]
  L5_1 = L7_1.utf8p1
end
if L2_1 ~= nil and L4_1 ~= nil and L5_1 ~= nil then
  L7_1 = isParentPackageManager
  L8_1 = L2_1
  L9_1 = true
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = isTainted
    L8_1 = L4_1
    L9_1 = L0_1
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      L7_1 = AppendToRollingQueue
      L8_1 = L1_1
      L9_1 = L2_1
      L10_1 = 1
      L11_1 = 600
      L7_1(L8_1, L9_1, L10_1, L11_1)
      L7_1 = taint
      L8_1 = L5_1
      L9_1 = L0_1
      L10_1 = 3600
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = bm
      L7_1 = L7_1.get_process_relationships
      L8_1 = L2_1
      L7_1, L8_1 = L7_1(L8_1)
      L9_1 = ipairs
      L10_1 = L7_1
      L9_1, L10_1, L11_1 = L9_1(L10_1)
      for L12_1, L13_1 in L9_1, L10_1, L11_1 do
        L14_1 = bm
        L14_1 = L14_1.add_related_process
        L15_1 = L13_1.ppid
        L14_1(L15_1)
        L14_1 = TrackPidAndTechniqueBM
        L15_1 = L13_1.ppid
        L16_1 = "T1105"
        L17_1 = "CommandAndControl"
        L14_1(L15_1, L16_1, L17_1)
      end
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
