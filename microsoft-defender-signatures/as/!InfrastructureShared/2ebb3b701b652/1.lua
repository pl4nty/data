local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
L2_1 = bm
L2_1 = L2_1.add_related_string
L3_1 = "Office_SusCreate_B"
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
