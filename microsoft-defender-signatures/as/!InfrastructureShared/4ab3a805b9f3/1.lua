local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = "remote_file_created_taint"
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L2_1 = L3_1.utf8p2
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L1_1 = L3_1.utf8p1
end
if not L2_1 or not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = mp
L4_1 = L4_1.GetExecutablesFromCommandLine
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L9_1
  L12_1 = "/([^/]+)$"
  L10_1 = L10_1(L11_1, L12_1)
  L3_1 = L10_1
  if not L3_1 then
    L3_1 = L9_1
  end
  L10_1 = IsKeyInRollingQueue
  L11_1 = L0_1
  L12_1 = L3_1
  L13_1 = false
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 then
    L10_1 = isTainted
    L11_1 = L1_1
    L12_1 = L0_1
    L10_1 = L10_1(L11_1, L12_1)
    if not L10_1 then
      L10_1 = taint
      L11_1 = L1_1
      L12_1 = L0_1
      L13_1 = 3600
      L10_1(L11_1, L12_1, L13_1)
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
