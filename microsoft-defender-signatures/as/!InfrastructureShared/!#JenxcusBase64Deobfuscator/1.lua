local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.FOOTERPAGE_SZ
L1_1 = L1_1 * 3
if L0_1 < L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.find
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = "\"[A-Za-z0-9%+/][A-Za-z0-9%+/]=(=?)(..-)[A-Za-z0-9%+/][A-Za-z0-9%+/]="
L0_1, L1_1, L2_1, L3_1 = L0_1(L1_1, L2_1)
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L3_1
L6_1 = "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])"
L7_1 = "%%%1"
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.getfilesize
L6_1 = L6_1()
L6_1 = L6_1 - L0_1
if 2097152 < L6_1 then
  L6_1 = 2097152
end
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = L0_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = nil
if L2_1 == "=" then
  L10_1 = L7_1
  L9_1 = L7_1.gsub
  L11_1 = L4_1
  L12_1 = ""
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = L9_1
  L9_1 = L9_1.gsub
  L11_1 = "\".+"
  L12_1 = ""
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
  L5_1 = L10_1
  L8_1 = L9_1
else
  L10_1 = L7_1
  L9_1 = L7_1.gsub
  L11_1 = L4_1
  L12_1 = "="
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = L9_1
  L9_1 = L9_1.gsub
  L11_1 = "\".+"
  L12_1 = ""
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
  L5_1 = L10_1
  L8_1 = L9_1
end
L9_1 = mp
L9_1 = L9_1.set_mpattribute
L10_1 = "//MpBase64DecodeLongLines"
L9_1(L10_1)
L9_1 = mp
L9_1 = L9_1.vfo_add_buffer
L10_1 = L8_1
L11_1 = "[JXS64]"
L12_1 = mp
L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
