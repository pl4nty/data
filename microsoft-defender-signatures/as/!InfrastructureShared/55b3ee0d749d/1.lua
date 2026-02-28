local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = bm_AddRelatedFileFromCommandLine
  L2_1 = L0_1
  L3_1 = nil
  L1_1(L2_1, L3_1)
  L1_1 = bm
  L1_1 = L1_1.get_process_relationships
  L1_1, L2_1 = L1_1()
  L3_1 = ipairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = TrackPidAndTechniqueBM
    L9_1 = L7_1.ppid
    L10_1 = "T1105"
    L11_1 = "remotedropexe_childproc"
    L8_1(L9_1, L10_1, L11_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
