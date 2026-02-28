local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[11]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[11]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[12]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[12]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[12]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "_exec:(.+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= nil then
      L4_1 = L0_1
      L3_1 = L0_1.find
      L5_1 = L2_1
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
