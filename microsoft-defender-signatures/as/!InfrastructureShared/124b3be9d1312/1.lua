local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.reason
  L8_1 = bm
  L8_1 = L8_1.RELATIONSHIP_INJECTION
  if L7_1 == L8_1 then
    L7_1 = bm
    L7_1 = L7_1.add_threat_process
    L8_1 = L6_1.ppid
    L7_1(L8_1)
  end
end
L2_1 = AddResearchData
L3_1 = "BM"
L4_1 = true
L2_1(L3_1, L4_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
