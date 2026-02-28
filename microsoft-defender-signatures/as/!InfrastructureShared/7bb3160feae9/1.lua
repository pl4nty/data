local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
    end
  end
end
L1_1 = {}
L2_1 = "OFFICE"
L3_1 = "WABMIG"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = {}
L2_1.min = 1
L2_1.max = 5
L3_1 = QueryProcContext
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
if L0_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.GetExecutablesFromCommandLine
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = ipairs
  L5_1 = L3_1
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  for L7_1, L8_1 in L4_1, L5_1, L6_1 do
    L9_1 = mp
    L9_1 = L9_1.ContextualExpandEnvironmentVariables
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    L8_1 = L9_1
    L9_1 = sysio
    L9_1 = L9_1.IsFileExists
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L9_1 = bm
      L9_1 = L9_1.add_related_file
      L10_1 = L8_1
      L9_1(L10_1)
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
