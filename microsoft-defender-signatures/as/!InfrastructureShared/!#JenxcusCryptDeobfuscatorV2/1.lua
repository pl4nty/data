local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.FOOTERPAGE_SZ
L1_1 = L1_1 * 3
if L0_1 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 2097152 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "= ?\"(.-)\""
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
L5_1 = #L4_1
L6_1 = mp
L6_1 = L6_1.FOOTERPAGE_SZ
if L5_1 < L6_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "= ?\"(.-)\""
L8_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
L8_1 = #L7_1
if not (L8_1 < 1) then
  L8_1 = #L7_1
  L9_1 = #L4_1
  if not (L8_1 >= L9_1) then
    goto lbl_55
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_55::
L8_1 = string
L8_1 = L8_1.gsub
L9_1 = L7_1
L10_1 = "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])"
L11_1 = "%%%1"
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
L11_1 = L4_1
L10_1 = L4_1.match
L12_1 = L8_1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 == nil then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = string
L10_1 = L10_1.find
L11_1 = L1_1
L12_1 = "= ?\"(.-)\""
L13_1 = L6_1
L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1, L13_1)
L13_1 = #L12_1
if not (L13_1 < 1) then
  L13_1 = #L12_1
  L14_1 = #L4_1
  if not (L13_1 >= L14_1) then
    goto lbl_85
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
do return L13_1 end
::lbl_85::
L13_1 = string
L13_1 = L13_1.find
L14_1 = L1_1
L15_1 = "=%s-0-([1-9]%d-)%s-[^0-9]"
L16_1 = L11_1
L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1, L16_1)
L16_1 = tonumber
L17_1 = L15_1
L18_1 = 10
L16_1 = L16_1(L17_1, L18_1)
L17_1 = #L12_1
if L16_1 ~= L17_1 or 40 < L16_1 then
  L17_1 = mp
  L17_1 = L17_1.CLEAN
  return L17_1
end
L17_1 = "1,2,3,4,5,6,1,1,6,2,8,3,10,4,12,6,11,16,3,8,14,21,5,11,19,26,7,15,23,2,10,19,3,29,13,4,23,15,35,26"
L18_1 = {}
L19_1 = string
L19_1 = L19_1.gmatch
L20_1 = L17_1
L21_1 = "[0-9]+"
L19_1, L20_1, L21_1 = L19_1(L20_1, L21_1)
for L22_1 in L19_1, L20_1, L21_1 do
  L23_1 = table
  L23_1 = L23_1.insert
  L24_1 = L18_1
  L25_1 = L22_1
  L23_1(L24_1, L25_1)
end
L19_1 = string
L19_1 = L19_1.byte
L20_1 = L12_1
L21_1 = L18_1[L16_1]
L21_1 = L21_1 + 1
L19_1 = L19_1(L20_1, L21_1)
L20_1 = mp
L20_1 = L20_1.vfo_add_buffer
L21_1 = fastDec2BinWithKey
L22_1 = L4_1
L23_1 = "(%d-)"
L24_1 = L8_1
L23_1 = L23_1 .. L24_1
L24_1 = L19_1

function L25_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 + A1_2
  return L2_2
end

L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
L22_1 = "[JXSC2]"
L23_1 = mp
L23_1 = L23_1.ADD_VFO_TAKE_ACTION_ON_DAD
L20_1(L21_1, L22_1, L23_1)
L20_1 = mp
L20_1 = L20_1.CLEAN
return L20_1
