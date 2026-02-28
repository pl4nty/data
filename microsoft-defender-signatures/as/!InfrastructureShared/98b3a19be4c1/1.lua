local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
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
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L1_1 = L2_1.utf8p2
    end
  end
end
if L1_1 == nil or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 ~= nil then
  L2_1 = extractDllForRegproc
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L3_1 = contains
    L4_1 = L1_1
    L5_1 = L2_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = checkFileLastWriteTime
    L4_1 = L2_1
    L5_1 = 600
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == false then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L2_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 == false then
        L3_1 = bm
        L3_1 = L3_1.add_related_file
        L4_1 = L2_1
        L3_1(L4_1)
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
