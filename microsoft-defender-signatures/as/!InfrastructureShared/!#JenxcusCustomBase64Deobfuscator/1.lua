local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
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
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = "\"[A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/]"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
L3_1 = L3_1 - L1_1
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L1_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = L4_1
L4_1 = L4_1.gsub
L6_1 = "\"%).+"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
L6_1 = {}
L7_1 = string
L7_1 = L7_1.char
L9_1 = L5_1
L8_1 = L5_1.len
L8_1 = L8_1(L9_1)
L9_1 = 1
L10_1 = L8_1
L11_1 = 1
for L12_1 = L9_1, L10_1, L11_1 do
  L14_1 = L5_1
  L13_1 = L5_1.byte
  L15_1 = L12_1
  L13_1 = L13_1(L14_1, L15_1)
  L14_1 = 10 + L12_1
  if L8_1 < L14_1 then
    L15_1 = L14_1 - 1
    L15_1 = L15_1 - L8_1
    L14_1 = 1 + L15_1
  end
  L16_1 = L5_1
  L15_1 = L5_1.byte
  L17_1 = L14_1
  L15_1 = L15_1(L16_1, L17_1)
  L16_1 = L7_1
  L17_1 = L13_1
  L16_1 = L16_1(L17_1)
  L13_1 = L16_1
  L16_1 = L7_1
  L17_1 = L15_1
  L16_1 = L16_1(L17_1)
  L15_1 = L16_1
  L6_1[L13_1] = L15_1
end
L10_1 = L4_1
L9_1 = L4_1.gsub
L11_1 = "[0-9a-zA-Z]"
L12_1 = L6_1
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
L11_1 = mp
L11_1 = L11_1.set_mpattribute
L12_1 = "//MpBase64DecodeLongLines"
L11_1(L12_1)
L11_1 = mp
L11_1 = L11_1.vfo_add_buffer
L12_1 = L9_1
L13_1 = "[JXSC64]"
L14_1 = mp
L14_1 = L14_1.ADD_VFO_TAKE_ACTION_ON_DAD
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
