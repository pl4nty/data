local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == nil then
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
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = " scrobj.dll"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.LOWFI
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "^(.*%S)%s*$"
L2_1 = L2_1(L3_1, L4_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "i:http.*%s+(.*)$"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L1_1
  L5_1 = "i:ftp.*%s+(.*)$"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
end
L3_1 = IsKeyInRollingQueue
L4_1 = "scrobj.dll"
L5_1 = L2_1
L6_1 = true
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L5_1 = mp
  L5_1 = L5_1.LOWFI
  return L5_1
end
L5_1 = GetRollingQueue
L6_1 = "scrobj.dll"
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = type
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 == "table" then
    L6_1 = pairs
    L7_1 = L5_1
    L6_1, L7_1, L8_1 = L6_1(L7_1)
    for L9_1 in L6_1, L7_1, L8_1 do
      L10_1 = string
      L10_1 = L10_1.find
      L11_1 = L1_1
      L12_1 = L5_1[L9_1]
      L12_1 = L12_1.key
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.LOWFI
        return L10_1
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
