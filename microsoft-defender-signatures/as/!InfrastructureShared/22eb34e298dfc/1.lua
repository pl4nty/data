local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = L0_1.ppid
  L3_1 = "T1003.003"
  L4_1 = "SystemSCCopy"
  L5_1 = 60
  L1_1(L2_1, L3_1, L4_1, L5_1)
else
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1003.003"
  L4_1 = "SystemSCCopy"
  L5_1 = 60
  L1_1(L2_1, L3_1, L4_1, L5_1)
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.utf8p2
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.GetExecutablesFromCommandLine
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = bm
      L8_1 = L8_1.add_related_file
      L9_1 = L7_1
      L8_1(L9_1)
      L8_1 = mp
      L8_1 = L8_1.ReportLowfi
      L9_1 = L7_1
      L10_1 = 3593361689
      L8_1(L9_1, L10_1)
    end
  end
end
L2_1 = ""
L3_1 = ""
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L3_1 = L4_1.utf8p2
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L2_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[6]
  L3_1 = L4_1.utf8p2
end
if L2_1 ~= nil and L2_1 ~= "" and L3_1 ~= nil and L3_1 ~= "" then
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "SystemDump_"
  L6_1 = L2_1
  L5_1 = L5_1 .. L6_1
  L6_1 = L3_1
  L4_1(L5_1, L6_1)
end
L4_1 = add_parents
L4_1()
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
