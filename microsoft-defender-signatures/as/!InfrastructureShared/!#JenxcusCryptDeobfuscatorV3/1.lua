local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
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
while true do
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not (L5_1 < 800) then
    break
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "= ?\"(.-)\""
  L8_1 = L3_1 + 2
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L7_1
  L3_1 = L6_1
  L2_1 = L5_1
end
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
L7_1 = "= ?%(?\"(.-)\""
L8_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
L8_1 = #L7_1
if not (L8_1 < 1) then
  L8_1 = #L7_1
  L9_1 = #L4_1
  if not (L8_1 >= L9_1) then
    goto lbl_71
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_71::
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
L12_1 = "= ?%(?\"(.-)\""
L13_1 = L6_1
L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1, L13_1)
L13_1 = #L12_1
if not (L13_1 < 1) then
  L13_1 = #L12_1
  L14_1 = #L4_1
  if not (L13_1 >= L14_1) then
    goto lbl_101
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
do return L13_1 end
::lbl_101::

function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = 0
  L7_2 = A1_2
  L6_2 = A1_2.rep
  L8_2 = #A1_2
  L8_2 = 256 / L8_2
  L8_2 = L8_2 + 1
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L6_2
  L6_2 = L6_2.sub
  L8_2 = 1
  L9_2 = 256
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = string
  L7_2 = L7_2.gmatch
  L8_2 = L6_2
  L9_2 = "."
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
  for L10_2 in L7_2, L8_2, L9_2 do
    L2_2[L5_2] = L5_2
    L12_2 = L10_2
    L11_2 = L10_2.byte
    L11_2 = L11_2(L12_2)
    L3_2[L5_2] = L11_2
    L5_2 = L5_2 + 1
  end
  L7_2 = 0
  L8_2 = 0
  L9_2 = 255
  L10_2 = 1
  for L11_2 = L8_2, L9_2, L10_2 do
    L12_2 = L2_2[L11_2]
    L12_2 = L7_2 + L12_2
    L13_2 = L3_2[L11_2]
    L12_2 = L12_2 + L13_2
    L7_2 = L12_2 % 255
    L12_2 = L2_2[L7_2]
    L13_2 = L2_2[L11_2]
    L2_2[L7_2] = L13_2
    L2_2[L11_2] = L12_2
  end
  L8_2 = 0
  L9_2 = 0
  L10_2 = 1
  L11_2 = 3072
  L12_2 = 1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = L8_2 + 1
    L8_2 = L14_2 % 255
    L14_2 = L2_2[L8_2]
    L14_2 = L9_2 + L14_2
    L9_2 = L14_2 % 255
    L14_2 = L2_2[L9_2]
    L15_2 = L2_2[L8_2]
    L2_2[L9_2] = L15_2
    L2_2[L8_2] = L14_2
  end
  L10_2 = string
  L10_2 = L10_2.char
  L11_2 = 1
  L12_2 = #A0_2
  L13_2 = 1
  for L14_2 = L11_2, L12_2, L13_2 do
    L15_2 = L8_2 + 1
    L8_2 = L15_2 % 255
    L15_2 = L2_2[L8_2]
    L15_2 = L9_2 + L15_2
    L9_2 = L15_2 % 255
    L15_2 = L2_2[L9_2]
    L16_2 = L2_2[L8_2]
    L2_2[L9_2] = L16_2
    L2_2[L8_2] = L15_2
    L15_2 = #L4_2
    L15_2 = L15_2 + 1
    L16_2 = L10_2
    L17_2 = mp
    L17_2 = L17_2.bitxor
    L18_2 = L2_2[L8_2]
    L19_2 = L2_2[L9_2]
    L18_2 = L18_2 + L19_2
    L18_2 = L18_2 % 255
    L18_2 = L2_2[L18_2]
    L20_2 = A0_2
    L19_2 = A0_2.sub
    L21_2 = L14_2
    L22_2 = L14_2
    L19_2 = L19_2(L20_2, L21_2, L22_2)
    L20_2 = L19_2
    L19_2 = L19_2.byte
    L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2)
    L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    L4_2[L15_2] = L16_2
  end
  L11_2 = table
  L11_2 = L11_2.concat
  L12_2 = L4_2
  L13_2 = ""
  return L11_2(L12_2, L13_2)
end

L14_1 = mp
L14_1 = L14_1.bitxor
L15_1 = L13_1
L16_1 = "0"
L17_1 = L12_1
L15_1 = L15_1(L16_1, L17_1)
L16_1 = L15_1
L15_1 = L15_1.byte
L15_1 = L15_1(L16_1)
L16_1 = 48
L14_1 = L14_1(L15_1, L16_1)
L15_1 = mp
L15_1 = L15_1.vfo_add_buffer
L16_1 = fastDec2BinWithKey
L17_1 = L4_1
L18_1 = "(%d-)"
L19_1 = L8_1
L18_1 = L18_1 .. L19_1
L19_1 = L14_1
L20_1 = mp
L20_1 = L20_1.bitxor
L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
L17_1 = "[JXSC3]"
L18_1 = mp
L18_1 = L18_1.ADD_VFO_TAKE_ACTION_ON_DAD
L15_1(L16_1, L17_1, L18_1)
L15_1 = mp
L15_1 = L15_1.CLEAN
return L15_1
