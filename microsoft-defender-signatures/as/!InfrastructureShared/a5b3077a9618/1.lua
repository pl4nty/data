local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = GetTechniquesTableForPid
L1_1 = "BM"
L0_1 = L0_1(L1_1)
L1_1 = GetTacticsTableForPid
L2_1 = "BM"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil and L0_1 ~= nil then
  L2_1 = bm
  L2_1 = L2_1.get_process_relationships
  L2_1, L3_1 = L2_1()
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = pairs
    L10_1 = L1_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    for L12_1, L13_1 in L9_1, L10_1, L11_1 do
      L14_1 = AddTacticForPid
      L15_1 = L8_1.ppid
      L16_1 = L12_1
      L14_1(L15_1, L16_1)
    end
    L9_1 = pairs
    L10_1 = L0_1
    L9_1, L10_1, L11_1 = L9_1(L10_1)
    for L12_1, L13_1 in L9_1, L10_1, L11_1 do
      L14_1 = AddTechniqueForPid
      L15_1 = L8_1.ppid
      L16_1 = L12_1
      L14_1(L15_1, L16_1)
    end
    L9_1 = TrackPidAndTechniqueBM
    L10_1 = L8_1.ppid
    L11_1 = "tt_to_child"
    L12_1 = "tt_to_child"
    L9_1(L10_1, L11_1, L12_1)
  end
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
