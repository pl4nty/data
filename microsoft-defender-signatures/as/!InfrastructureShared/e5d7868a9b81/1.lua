local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
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
L2_1 = L1_1
L1_1 = L1_1.lower
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.gmatch
L4_1 = "(%d+%.%d+%.%d+%.%d+)"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L6_1 = {}
  L8_1 = L5_1
  L7_1 = L5_1.gmatch
  L9_1 = "(%d+)"
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  for L10_1 in L7_1, L8_1, L9_1 do
    L11_1 = table
    L11_1 = L11_1.insert
    L12_1 = L6_1
    L13_1 = L10_1
    L11_1(L12_1, L13_1)
  end
  L7_1 = #L6_1
  if L7_1 == 4 then
    L7_1 = ipairs
    L8_1 = L6_1
    L7_1, L8_1, L9_1 = L7_1(L8_1)
    for L10_1, L11_1 in L7_1, L8_1, L9_1 do
      L12_1 = tonumber
      L13_1 = L11_1
      L12_1 = L12_1(L13_1)
      L13_1 = #L11_1
      if 1 < L13_1 then
        L14_1 = L11_1
        L13_1 = L11_1.match
        L15_1 = "^0%d"
        L13_1 = L13_1(L14_1, L15_1)
      end
      if L13_1 or 255 < L12_1 then
        L13_1 = mp
        L13_1 = L13_1.INFECTED
        return L13_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
