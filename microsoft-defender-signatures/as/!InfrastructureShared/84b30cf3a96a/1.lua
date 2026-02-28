local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = AddResearchData
L1_1 = "BM"
L2_1 = true
L0_1(L1_1, L2_1)
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = addRelatedProcess
L0_1()
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = bm
  L7_1 = L7_1.trigger_sig
  L8_1 = "BmTraverseTreeBlock"
  L9_1 = "Detected"
  L10_1 = L6_1.ppid
  L7_1(L8_1, L9_1, L10_1)
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 ~= "" and L2_1 ~= nil then
  L3_1 = check_common_process_linux
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == false then
    L3_1 = bm
    L3_1 = L3_1.add_threat_file
    L4_1 = L2_1
    L3_1(L4_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
