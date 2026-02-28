local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.bitand
  L8_1 = L6_1.reason_ex
  L9_1 = bm
  L9_1 = L9_1.RELATIONSHIP_CREATED
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = bm
  L8_1 = L8_1.RELATIONSHIP_CREATED
  if L7_1 == L8_1 then
    L8_1 = bm
    L8_1 = L8_1.trigger_sig
    L9_1 = "StartedViaRUNMRU.gen!child"
    L10_1 = "StartedViaRUNMRU.gen!child"
    L11_1 = L6_1.ppid
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = AppendToRollingQueue
    L9_1 = "IsProcessChainViaRUNMRU"
    L10_1 = L6_1.ppid
    L11_1 = 1
    L12_1 = 30
    L8_1(L9_1, L10_1, L11_1, L12_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
