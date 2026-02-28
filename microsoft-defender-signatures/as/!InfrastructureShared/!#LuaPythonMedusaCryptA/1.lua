local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 131072 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "base64.b64decode%(b'([%w%+/]+=-)'%)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "itertools.cycle%(b'(%w+)'%)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.Base64Decode
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = string
L6_1 = L6_1.len
L7_1 = L3_1
L6_1 = L6_1(L7_1)
L5_1 = L5_1 / L6_1
L5_1 = L5_1 / 2
L6_1 = L5_1 / 2
L6_1 = L5_1 + L6_1
L7_1 = string
L7_1 = L7_1.len
L8_1 = L3_1
L7_1 = L7_1(L8_1)
L6_1 = L6_1 * L7_1
L7_1 = string
L7_1 = L7_1.sub
L8_1 = L4_1
L9_1 = L6_1 + 1
L10_1 = string
L10_1 = L10_1.len
L11_1 = L4_1
L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L10_1(L11_1)
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
L4_1 = L7_1
L7_1 = ""
L8_1 = 1
L9_1 = 1
L10_1 = 2500
L12_1 = L4_1
L11_1 = L4_1.gmatch
L13_1 = "."
L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
for L14_1 in L11_1, L12_1, L13_1 do
  L16_1 = L3_1
  L15_1 = L3_1.len
  L15_1 = L15_1(L16_1)
  if L8_1 > L15_1 then
    L8_1 = 1
  end
  L15_1 = L7_1
  L16_1 = string
  L16_1 = L16_1.char
  L17_1 = mp
  L17_1 = L17_1.bitxor
  L19_1 = L14_1
  L18_1 = L14_1.byte
  L18_1 = L18_1(L19_1)
  L20_1 = L3_1
  L19_1 = L3_1.sub
  L21_1 = L8_1
  L22_1 = L8_1
  L19_1 = L19_1(L20_1, L21_1, L22_1)
  L20_1 = L19_1
  L19_1 = L19_1.byte
  L19_1, L20_1, L21_1, L22_1 = L19_1(L20_1)
  L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L17_1(L18_1, L19_1, L20_1, L21_1, L22_1)
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
  L7_1 = L15_1 .. L16_1
  L8_1 = L8_1 + 1
  L9_1 = L9_1 + 1
  if L10_1 < L9_1 then
    break
  end
end
L11_1 = mp
L11_1 = L11_1.vfo_add_buffer
L12_1 = L7_1
L13_1 = "(MedDecrypt)"
L14_1 = mp
L14_1 = L14_1.ADD_VFO_TAKE_ACTION_ON_DAD
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
