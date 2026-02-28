local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = 0
  if not A0_2 then
    return L1_2
  end
  L2_2 = A0_2
  L3_2 = nil
  L4_2 = nil
  for L5_2 in L2_2, L3_2, L4_2 do
    L1_2 = L1_2 + 1
  end
  return L1_2
end

L1_1 = nil
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "PACKED_WITH:[CMDEmbedded]"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = L0_1
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "||"
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L3_1 = L0_1
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L1_1
L6_1 = "&"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1)
if 3 <= L2_1 or 3 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
