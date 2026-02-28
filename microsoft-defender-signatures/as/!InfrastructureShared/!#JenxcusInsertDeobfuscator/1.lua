local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1024 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 2097152 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = tostring
L3_1 = footerpage
L2_1 = L2_1(L3_1)
L3_1 = "\".+[Ss][Pp][Ll][Ii][Tt]%([a-zA-Z0-9_]+,\"(.+)\"%)"
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L3_1
L6_1 = "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])"
L7_1 = "%%%1"
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
L6_1 = string
L6_1 = L6_1.find
L7_1 = tostring
L8_1 = headerpage
L7_1 = L7_1(L8_1)
L8_1 = "\".*"
L9_1 = L4_1
L8_1 = L8_1 .. L9_1
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L9_1 = mp
L9_1 = L9_1.readprotection
L10_1 = false
L9_1(L10_1)
L9_1 = mp
L9_1 = L9_1.getfilesize
L9_1 = L9_1()
L10_1 = mp
L10_1 = L10_1.FOOTERPAGE_SZ
L9_1 = L9_1 - L10_1
L9_1 = L9_1 + L1_1
L9_1 = L9_1 - L6_1
L9_1 = L9_1 - 1
L10_1 = mp
L10_1 = L10_1.readfile
L11_1 = L6_1
L12_1 = L9_1
L10_1 = L10_1(L11_1, L12_1)
L11_1 = mp
L11_1 = L11_1.vfo_add_buffer
L12_1 = fastDec2Bin
L13_1 = L10_1
L14_1 = "(%d-)"
L15_1 = L4_1
L14_1 = L14_1 .. L15_1
L12_1 = L12_1(L13_1, L14_1)
L13_1 = "[JXS]"
L14_1 = mp
L14_1 = L14_1.ADD_VFO_TAKE_ACTION_ON_DAD
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
