local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L0_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = pcall
L3_1 = mp
L3_1 = L3_1.GetInlineScriptsFromCommandLine
L5_1 = L0_1
L4_1 = L0_1.lower
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L4_1(L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L2_1 and L3_1 then
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = pcall
    L10_1 = mp
    L10_1 = L10_1.ContextualExpandEnvironmentVariables
    L11_1 = L8_1
    L9_1, L10_1 = L9_1(L10_1, L11_1)
    if L9_1 and L10_1 then
      L11_1 = bm
      L11_1 = L11_1.add_related_file
      L12_1 = L10_1
      L11_1(L12_1)
    end
  end
end
L4_1 = pcall
L5_1 = mp
L5_1 = L5_1.GetInlineScriptsFromCommandLine
L7_1 = L1_1
L6_1 = L1_1.lower
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L6_1(L7_1)
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L4_1 and L5_1 then
  L6_1 = ipairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = pcall
    L12_1 = mp
    L12_1 = L12_1.ContextualExpandEnvironmentVariables
    L13_1 = L10_1
    L11_1, L12_1 = L11_1(L12_1, L13_1)
    if L11_1 and L12_1 then
      L13_1 = bm
      L13_1 = L13_1.add_related_file
      L14_1 = L12_1
      L13_1(L14_1)
    end
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
