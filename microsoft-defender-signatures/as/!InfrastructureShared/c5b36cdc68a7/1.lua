local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
L1_1 = mp
L1_1 = L1_1.ContextualExpandEnvironmentVariables
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.IsKnownFriendlyFile
L2_1 = L0_1
L3_1 = true
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == nil or L1_1 == false then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L0_1
    L2_1(L3_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
