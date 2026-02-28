local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L2_1 = false
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.utf8p1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.utf8p1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
if L0_1 ~= nil and L1_1 ~= nil then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.IsKnownFriendlyFile
    L4_1 = L0_1
    L5_1 = false
    L6_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == false then
      L3_1 = bm
      L3_1 = L3_1.add_related_file
      L4_1 = L0_1
      L3_1(L4_1)
      L2_1 = true
    end
  end
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.IsKnownFriendlyFile
    L4_1 = L1_1
    L5_1 = false
    L6_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == false then
      L3_1 = bm
      L3_1 = L3_1.add_related_file
      L4_1 = L1_1
      L3_1(L4_1)
      L2_1 = true
    end
  end
  if L2_1 == true then
    L3_1 = add_parents
    L3_1()
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
