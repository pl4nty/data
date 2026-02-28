local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.ppid
    L1_1 = IsTacticObservedForPid
    L2_1 = L0_1
    L3_1 = "webshell_parent"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.get_process_relationships
      L1_1, L2_1 = L1_1()
      L3_1 = ipairs
      L4_1 = L2_1
      L3_1, L4_1, L5_1 = L3_1(L4_1)
      for L6_1, L7_1 in L3_1, L4_1, L5_1 do
        L8_1 = TrackPidAndTechniqueBM
        L9_1 = L7_1.ppid
        L10_1 = "T1505.003"
        L11_1 = "webshell_childproc"
        L12_1 = 28800
        L8_1(L9_1, L10_1, L11_1, L12_1)
        L8_1 = bm
        L8_1 = L8_1.add_threat_process
        L9_1 = L7_1.ppid
        L8_1(L9_1)
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
