local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1000 or 5000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = 1024
L5_1 = 1056
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "R%zo%zo%zt%z %zE%zn%zt%zr%zy%z"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = 1056
L5_1 = 3072
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
if L3_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L3_1 + 1056
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = L5_1
L9_1 = 3328
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = L6_1
L6_1 = L6_1.find
L8_1 = "%z%z%z%z%z%z%z%z\028%z%z%z"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L4_1 = L8_1
L3_1 = L7_1
L2_1 = L6_1
if L3_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L2_1 = L3_1 + L5_1
L3_1 = L2_1 + 128
L7_1 = L1_1
L6_1 = L1_1.sub
L8_1 = L2_1
L9_1 = L3_1
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = L6_1
L6_1 = L6_1.find
L8_1 = "\193..f...\139.\139.\139.1.\176.\001.\255"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= nil then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "LUA:Malformed.Equation.B"
  L6_1(L7_1)
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
