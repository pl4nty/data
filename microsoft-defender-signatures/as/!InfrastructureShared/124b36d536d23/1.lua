local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p1
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[6]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L2_1 = L2_1.utf8p2
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
  end
end
if L1_1 == nil or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "Office_SusCreate_D"
L4_1 = L0_1
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = GetFileName
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L0_1 = L3_1
L3_1 = sysio
L3_1 = L3_1.IsFileExists
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L0_1
  L3_1(L4_1)
  L3_1 = bm
  L3_1 = L3_1.add_threat_file
  L4_1 = L0_1
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
