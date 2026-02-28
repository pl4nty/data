local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 20000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 300000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1 - 8192
L2_1 = L0_1 - L1_1
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "(%l-)%s-=%s-%l-%(strreverse%((%l-)%)"
L4_1, L5_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L7_1 = L3_1
L6_1 = L3_1.match
L8_1 = "(%l-)%s-=%s-%l-%(0%)"
L6_1 = L6_1(L7_1, L8_1)
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L5_1 ~= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L3_1
L7_1 = L3_1.match
L9_1 = "execute%s(%l-)%s"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 == nil then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if L4_1 ~= L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
