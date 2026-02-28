local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "^%S+%s+%S+%s+(%S+)"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "^(%d+)%.(%d+)%.(%d+)%.(%d+)$"
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = ipairs
L8_1 = {}
L9_1 = L3_1
L10_1 = L4_1
L11_1 = L5_1
L12_1 = L6_1
L8_1[1] = L9_1
L8_1[2] = L10_1
L8_1[3] = L11_1
L8_1[4] = L12_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = tonumber
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if not L12_1 or L12_1 < 0 or 255 < L12_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L8_1 = L1_1
L7_1 = L1_1.match
L9_1 = "^%S+%s+%S+%s+%S+%s+(%S+)"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = tonumber
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L7_1 = L8_1
if L7_1 < 0 or 65535 < L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
