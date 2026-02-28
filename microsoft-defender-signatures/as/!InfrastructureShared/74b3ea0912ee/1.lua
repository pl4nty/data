local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "/tmp/.+%.sh$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "process_cmdline"
L5_1 = L1_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "filemetadata"
L5_1 = L2_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.add_related_file
L4_1 = L2_1
L3_1(L4_1)
L3_1 = bm
L3_1 = L3_1.get_process_relationships
L3_1, L4_1 = L3_1()
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = bm
  L10_1 = L10_1.trigger_sig
  L11_1 = "BmTraverseTreeBlock"
  L12_1 = "Detected"
  L13_1 = L9_1.ppid
  L10_1(L11_1, L12_1, L13_1)
end
L5_1 = addRelatedProcess
L5_1()
L5_1 = reportRelatedBmHits
L5_1()
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
