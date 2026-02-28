local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = this_sigattrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.utf8p2
        L0_1 = L0_1(L1_1)
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p2
        L1_1 = L1_1(L2_1)
        L2_1 = string
        L2_1 = L2_1.match
        L3_1 = L0_1
        L4_1 = "([^\\]+%.exe)"
        L2_1 = L2_1(L3_1, L4_1)
        L3_1 = contains
        L4_1 = L2_1
        L5_1 = L1_1
        L3_1 = L3_1(L4_1, L5_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
