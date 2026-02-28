local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\""
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "'"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = 0
L3_1 = str_count_match
L4_1 = L1_1
L5_1 = {}
L6_1 = "mshta"
L7_1 = "http"
L8_1 = " \226[\128-\191][\128-\191] "
L9_1 = " \240[\128-\191][\128-\191][\128-\191] "
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L3_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1 + L3_1
if L2_1 < 2 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsKeyInRollingQueue
L4_1 = "IsProcessChainViaRUNMRU"
L5_1 = L0_1
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.ppid
if L4_1 then
  L4_1 = IsKeyInRollingQueue
  L5_1 = "IsProcessChainViaRUNMRU"
  L6_1 = L3_1.ppid
  L7_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
