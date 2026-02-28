local L0_1, L1_1, L2_1, L3_1, L4_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
if L0_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L0_1
  L4_1 = "wscript.*%s+%\"?%'?(%w:\\.*%.js)"
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
end
if L1_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.ContextualExpandEnvironmentVariables
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L2_1
    L3_1(L4_1)
    L3_1 = bm
    L3_1 = L3_1.add_threat_file
    L4_1 = L2_1
    L3_1(L4_1)
  end
end
L2_1 = IsProcNameInParentProcessTree
L3_1 = "BM"
L4_1 = "explorer.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
