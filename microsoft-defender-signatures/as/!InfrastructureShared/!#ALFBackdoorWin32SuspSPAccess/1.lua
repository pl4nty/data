local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L0_1 = L2_1
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "([^:]+:)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = #L2_1
L4_1 = #L0_1
if not (L3_1 < L4_1) then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "post(/.*.aspx)"
L3_1 = L3_1(L4_1, L5_1)
L1_1 = L3_1
if not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "SuspSPAccess"
L4_1 = 3600
L5_1 = 10
L6_1 = AppendToRollingQueue
L7_1 = L3_1
L8_1 = L1_1
L9_1 = 1
L10_1 = L4_1
L11_1 = L5_1
L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
