local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L0_1 = L3_1
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= nil then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.utf8p2
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
    end
  end
end
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 < 500 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = {}
L4_1 = "install_acs_64.js"
L3_1[1] = L4_1
L4_1 = contains
L5_1 = L0_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L0_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L0_1
  L6_1 = "wscript.*%s+%\"?%'?(%w:\\.*%.js)"
  L4_1 = L4_1(L5_1, L6_1)
  L1_1 = L4_1
end
if L1_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.ContextualExpandEnvironmentVariables
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.IsFileExists
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.GetMotwZoneForFile
      L6_1 = L4_1
      L5_1, L6_1 = L5_1(L6_1)
      if L5_1 and L6_1 == 3 then
        L7_1 = bm
        L7_1 = L7_1.add_threat_file
        L8_1 = L4_1
        L7_1(L8_1)
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
