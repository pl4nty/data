local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 65536 or 983040 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "const%s%a%a%a%a-%s=%s1.-=%s-createobject%((.-)%)%s-%a%a%a%a-.type"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "A"
L5_1 = "D"
L6_1 = "O"
L7_1 = "D"
L8_1 = "B"
L9_1 = "."
L10_1 = "S"
L11_1 = "t"
L12_1 = "r"
L13_1 = "e"
L14_1 = "a"
L15_1 = "m"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1

function L4_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 + A1_2
  return L2_2
end

L5_1 = {}
L6_1 = 1
L7_1 = string
L7_1 = L7_1.gmatch
L8_1 = L2_1
L9_1 = "chrw%((%d-)+(%d-)%)"
L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = L4_1
  L13_1 = L10_1
  L14_1 = L11_1
  L12_1 = L12_1(L13_1, L14_1)
  L13_1 = string
  L13_1 = L13_1.char
  L14_1 = L12_1
  L13_1 = L13_1(L14_1)
  L5_1[L6_1] = L13_1
  L13_1 = L5_1[L6_1]
  L14_1 = L3_1[L6_1]
  if L13_1 ~= L14_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L6_1 = L6_1 + 1
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
