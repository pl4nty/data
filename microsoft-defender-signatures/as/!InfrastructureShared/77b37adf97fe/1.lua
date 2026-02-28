local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\windows\\explorer.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = mp
  L8_1 = L8_1.bitand
  L9_1 = L7_1.reason_ex
  L10_1 = bm
  L10_1 = L10_1.RELATIONSHIP_CREATED
  L8_1 = L8_1(L9_1, L10_1)
  L9_1 = bm
  L9_1 = L9_1.RELATIONSHIP_CREATED
  if L8_1 == L9_1 then
    L9_1 = IsKeyInRollingQueue
    L10_1 = "IsProcessChainViaRUNMRU"
    L11_1 = L7_1.ppid
    L12_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1)
    if not L9_1 then
      L9_1 = bm
      L9_1 = L9_1.trigger_sig
      L10_1 = "StartedViaRUNMRU.gen!ggchild"
      L11_1 = "StartedViaRUNMRU.gen!ggchild"
      L12_1 = L7_1.ppid
      L9_1(L10_1, L11_1, L12_1)
      L9_1 = AppendToRollingQueue
      L10_1 = "IsProcessChainViaRUNMRU"
      L11_1 = L7_1.ppid
      L12_1 = 1
      L13_1 = 30
      L9_1(L10_1, L11_1, L12_1, L13_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
