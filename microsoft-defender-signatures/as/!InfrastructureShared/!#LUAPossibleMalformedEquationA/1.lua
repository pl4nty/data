local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 100000 or 3500000 < L0_1 then
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
L4_1 = 2049
L5_1 = 2049
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "[\026\028]"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.sub
L4_1 = 2048
L5_1 = 2054
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = L2_1
L2_1 = L2_1.find
L4_1 = "([\026\028]...)"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = tostring
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = 2064
L8_1 = 26624
L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
L1_1 = L5_1
L6_1 = L1_1
L5_1 = L1_1.find
L7_1 = "\255\255\255\255\255\255\255\255"
L8_1 = L4_1
L7_1 = L7_1 .. L8_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
_ = L7_1
L3_1 = L6_1
L2_1 = L5_1
L3_1 = L3_1 + 128
if L2_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.find
  L7_1 = L1_1
  L6_1 = L1_1.sub
  L8_1 = L2_1
  L9_1 = L3_1
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L7_1 = "\255.\005....[-\005]....\255"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "LUA:Malformed.Equation.A"
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
