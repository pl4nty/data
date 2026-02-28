local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HEADERPAGE_SZ
if L0_1 > L1_1 then
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
L4_1 = "\"(.-)\".-\"(.-)\".-%-.-%-%s-0-([1-9]%d-)%)"
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
if L4_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.gsub
L8_1 = L5_1
L9_1 = "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])"
L10_1 = "%%%1"
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
L9_1 = string
L9_1 = L9_1.format

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L9_1
  L2_2 = "%c"
  L3_2 = tonumber
  L4_2 = A0_2
  L5_2 = 10
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L6_1
  L3_2 = L3_2 - L4_2
  return L1_2(L2_2, L3_2)
end

L11_1 = string
L11_1 = L11_1.gsub
L12_1 = L4_1
L13_1 = "(%d-)"
L14_1 = L7_1
L13_1 = L13_1 .. L14_1
L14_1 = L10_1
L15_1 = 6144
L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
L13_1 = mp
L13_1 = L13_1.vfo_add_buffer
L15_1 = L11_1
L14_1 = L11_1.sub
L16_1 = 1
L17_1 = L12_1
L14_1 = L14_1(L15_1, L16_1, L17_1)
L15_1 = "[DeBLAD]"
L16_1 = mp
L16_1 = L16_1.ADD_VFO_TAKE_ACTION_ON_DAD
L13_1(L14_1, L15_1, L16_1)
L13_1 = mp
L13_1 = L13_1.set_mpattribute
L14_1 = "//LOWFI:LUA:Bladabindi"
L13_1(L14_1)
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
