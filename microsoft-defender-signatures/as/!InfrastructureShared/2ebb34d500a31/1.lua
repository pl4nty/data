local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[8]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[11]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[8]
        L0_1 = L2_1.utf8p1
        L2_1 = this_sigattrlog
        L2_1 = L2_1[11]
        L1_1 = L2_1.utf8p1
    end
  end
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[12]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[12]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[9]
          L0_1 = L2_1.utf8p1
          L2_1 = this_sigattrlog
          L2_1 = L2_1[12]
          L1_1 = L2_1.utf8p1
      end
    end
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[10]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[13]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[13]
          L2_1 = L2_1.utf8p1
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[10]
            L0_1 = L2_1.utf8p1
            L2_1 = this_sigattrlog
            L2_1 = L2_1[13]
            L1_1 = L2_1.utf8p1
          end
        end
      end
    end
  end
end
if L0_1 and L1_1 then
  L3_1 = L0_1
  L2_1 = L0_1.lower
  L2_1 = L2_1(L3_1)
  L4_1 = L1_1
  L3_1 = L1_1.lower
  L3_1 = L3_1(L4_1)
  if L2_1 ~= L3_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = {}
L3_1 = "cnmss"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = sysio
L3_1 = L3_1.IsFileExists
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L0_1
  L3_1(L4_1)
end
L3_1 = bm
L3_1 = L3_1.add_related_string
L4_1 = "Office_SusCreate_A"
L5_1 = L0_1
L6_1 = bm
L6_1 = L6_1.RelatedStringBMReport
L3_1(L4_1, L5_1, L6_1)
L3_1 = {}
L4_1 = "winword.exe"
L5_1 = "excel.exe"
L6_1 = "powerpnt.exe"
L7_1 = "mspub.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = IsProcNameInParentProcessTree
L5_1 = "BM"
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
