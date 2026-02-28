local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = GetRollingQueue
L1_1 = "big_reg_write"
L0_1 = L0_1(L1_1)
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L1_1 = L3_1.utf8p2
  L3_1 = this_sigattrlog
  L3_1 = L3_1[1]
  L2_1 = L3_1.utf8p1
end
if L0_1 ~= nil then
  L3_1 = pairs
  L4_1 = L0_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1 in L3_1, L4_1, L5_1 do
    if L2_1 then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = L2_1
      L7_1 = L7_1(L8_1)
      L2_1 = L7_1
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L2_1
      L9_1 = tostring
      L10_1 = L0_1[L6_1]
      L10_1 = L10_1.key
      L9_1, L10_1 = L9_1(L10_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 then
        L7_1 = #L1_1
        if 1000 <= L7_1 then
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
