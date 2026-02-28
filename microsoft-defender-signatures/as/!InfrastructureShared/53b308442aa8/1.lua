local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.ppid
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L0_1 = L1_1.ppid
    L1_1 = GetRealPidForScenario
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = IsPidObservedGlobal
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
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
        L10_1 = "iis_exch_childproc"
        L11_1 = "iis_exch_childproc"
        L12_1 = 28800
        L8_1(L9_1, L10_1, L11_1, L12_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
