local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L0_1 = L1_1.utf8p1
  end
end
if not L0_1 or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "[%a]:\\[^\"%>%s]*%.dll"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsFileRecentlyDropped
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
if L2_1 and L3_1 and L4_1 then
  L5_1 = safeJsonDeserialize
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L6_1 = L5_1.UnsignedFile
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.INFECTED
      return L6_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
