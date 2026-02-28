local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p2
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
    end
  end
end
L2_1 = {}
L3_1 = "install_acs_64.js"
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
if L0_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "wscript.*%s+%\"?%'?(%w:\\.*%.js)"
  L3_1 = L3_1(L4_1, L5_1)
  L1_1 = L3_1
end
if L1_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.ContextualExpandEnvironmentVariables
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = sysio
    L4_1 = L4_1.IsFileExists
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.GetMotwZoneForFile
      L5_1 = L3_1
      L4_1, L5_1 = L4_1(L5_1)
      if L4_1 and L5_1 == 3 then
        L6_1 = bm
        L6_1 = L6_1.add_related_file
        L7_1 = L3_1
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
