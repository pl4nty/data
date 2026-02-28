local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.crc32
L1_1 = -1
L2_1 = "4afa309c-a1b3-455b-ab91-da731ec077c4"
L3_1 = 1
L4_1 = 36
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = headerpage
L4_1 = 1
L5_1 = 36
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3
    if A0_3 == 1 then
      L1_3 = {}
      L1_3.value = "some_value"
      return L1_3
    else
      L1_3 = {}
      L2_3 = L2_2
      L3_3 = A0_3 - 1
      L2_3 = L2_3(L3_3)
      L1_3.key1 = L2_3
      return L1_3
    end
  end
  
  L3_2 = {}
  L4_2 = 1
  L5_2 = A0_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = "key"
    L9_2 = L7_2
    L8_2 = L8_2 .. L9_2
    L9_2 = L2_2
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    L3_2[L8_2] = L9_2
  end
  return L3_2
end

L3_1 = 260
L4_1 = 30
L5_1 = L2_1
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = pcall
L7_1 = MpCommon
L7_1 = L7_1.JsonSerialize
L8_1 = L5_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
