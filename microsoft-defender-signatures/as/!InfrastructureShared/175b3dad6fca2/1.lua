local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[5]
    L0_1 = L1_1.utf8p1
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[6]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[6]
      L0_1 = L1_1.utf8p1
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[7]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[7]
      L1_1 = L1_1.utf8p1
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[7]
        L0_1 = L1_1.utf8p1
      end
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ".tmp"
L3_1 = ".txt"
L4_1 = ".doc"
L5_1 = ".cfg"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "Office_SusCreate_C"
L4_1 = L0_1
L5_1 = bm
L5_1 = L5_1.RelatedStringBMReport
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
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
