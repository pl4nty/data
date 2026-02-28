local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.ContextualExpandEnvironmentVariables
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.ContextualExpandEnvironmentVariables
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.ContextualExpandEnvironmentVariables
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.utf8p1
      L1_1 = L1_1(L2_1)
      L0_1 = L1_1
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.ContextualExpandEnvironmentVariables
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L0_1 = L1_1
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = mp
          L1_1 = L1_1.ContextualExpandEnvironmentVariables
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.utf8p1
          L1_1 = L1_1(L2_1)
          L0_1 = L1_1
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[7]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = mp
            L1_1 = L1_1.ContextualExpandEnvironmentVariables
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L2_1 = L2_1.utf8p1
            L1_1 = L1_1(L2_1)
            L0_1 = L1_1
          end
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = sysio
  L1_1 = L1_1.IsFileExists
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.IsKnownFriendlyFile
    L2_1 = L0_1
    L3_1 = false
    L4_1 = false
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 == false then
      L1_1 = bm
      L1_1 = L1_1.add_related_file
      L2_1 = L0_1
      L1_1(L2_1)
      L1_1 = add_parents
      L1_1()
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
