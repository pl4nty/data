local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = this_sigattrlog
L2_1 = L2_1[8]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L1_1 = L2_1.utf8p2
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "node%.exe\"?%s+\"?([^\"]+%.js)\"?"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = checkFileLastWriteTime
L4_1 = L2_1
L5_1 = 3600
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= false then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = checkFileLastWriteTime
L4_1 = L1_1
L5_1 = 3600
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= false then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.add_related_file
L4_1 = L2_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
