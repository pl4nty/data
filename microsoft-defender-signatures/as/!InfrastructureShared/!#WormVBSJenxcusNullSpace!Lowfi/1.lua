local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 30000000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = [[

.
.
.
.
.
.
.
.
.
]]
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L5_1 = 1
L6_1 = 100
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L1_1
  L11_1 = [[

.
.
.
.
.
.
.
.
.
]]
  L12_1 = L3_1
  L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1, L12_1)
  L8_1 = L11_1
  L3_1 = L10_1
  L8_1 = L9_1
end
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L0_1 / 10
L7_1 = 50000
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L3_1 = 1
L6_1 = 1
L7_1 = 1000
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L5_1
  L12_1 = [[

.
.
.
.
.
.
.
.
.
]]
  L13_1 = L3_1
  L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1, L13_1)
  L9_1 = L12_1
  L3_1 = L11_1
  L9_1 = L10_1
end
if 10000 < L3_1 then
  L6_1 = mp
  L6_1 = L6_1.LOWFI
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
