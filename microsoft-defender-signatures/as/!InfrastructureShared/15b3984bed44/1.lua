local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = GetRollingQueueKeys
L1_1 = "SuspTransportAgent"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = type
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == "table" then
    L1_1 = "["
    L2_1 = ipairs
    L3_1 = L0_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L1_1
      L8_1 = L6_1
      L9_1 = "|"
      L1_1 = L7_1 .. L8_1 .. L9_1
    end
    L2_1 = L1_1
    L3_1 = "]"
    L1_1 = L2_1 .. L3_1
    L2_1 = #L0_1
    L2_1 = L0_1[L2_1]
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "agent_list"
    L5_1 = L1_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = bm
    L3_1 = L3_1.add_related_string
    L4_1 = "agentpath"
    L5_1 = L2_1
    L6_1 = bm
    L6_1 = L6_1.RelatedStringBMReport
    L3_1(L4_1, L5_1, L6_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
