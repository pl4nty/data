local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[5]
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L0_1 = L1_1[6]
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[7]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L0_1 = L1_1[7]
    end
  end
end
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = isParentPackageManager
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.GetExecutablesFromCommandLine
    L2_1 = L0_1.utf8p2
    L1_1 = L1_1(L2_1)
    L2_1 = ipairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = sysio
      L7_1 = L7_1.IsFileExists
      L8_1 = L6_1
      L7_1 = L7_1(L8_1)
      if L7_1 then
        L7_1 = bm
        L7_1 = L7_1.add_related_file
        L8_1 = L6_1
        L7_1(L8_1)
      end
    end
    L2_1 = TrackPidAndTechniqueBM
    L3_1 = L0_1.ppid
    L4_1 = "T1053.003"
    L5_1 = "Persistence"
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = reportRelatedBmHits
    L2_1()
    L2_1 = addRelatedProcess
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
