local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCRIPT:Worm:JS/Bondat!Crypt3"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 85000 or 95000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = ".slice%(%w+, %w+ %+= (%d+)%)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "return parseInt%(%w+, (%d+)%)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tonumber
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = 255
L6_1 = 0
L7_1 = nil
repeat
  L7_1 = L5_1 % L4_1
  L5_1 = L5_1 / L4_1
  L6_1 = L6_1 + 1
until L7_1 == L5_1 and L7_1 == 0
L8_1 = tonumber
L9_1 = L2_1
L8_1 = L8_1(L9_1)
L9_1 = L6_1 - 1
if L8_1 < L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = string
L9_1 = L9_1.find
L10_1 = tostring
L11_1 = headerpage
L10_1 = L10_1(L11_1)
L11_1 = "(fromCharCode.-\")%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w"
L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
if L9_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.readprotection
L13_1 = false
L12_1(L13_1)
L12_1 = 4500
L13_1 = mp
L13_1 = L13_1.readfile
L14_1 = #L11_1
L14_1 = L9_1 + L14_1
L14_1 = L14_1 - 1
L15_1 = L12_1 * L8_1
L15_1 = L15_1 * 2
L13_1 = L13_1(L14_1, L15_1)
if L13_1 == nil then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = "."
L15_1 = fastBase2Dec
L16_1 = L13_1
L18_1 = L14_1
L17_1 = L14_1.rep
L19_1 = L8_1
L17_1 = L17_1(L18_1, L19_1)
L18_1 = L4_1
L15_1 = L15_1(L16_1, L17_1, L18_1)
if L15_1 == nil then
  L16_1 = mp
  L16_1 = L16_1.CLEAN
  return L16_1
end
L16_1 = string
L16_1 = L16_1.char
L17_1 = string
L17_1 = L17_1.byte

function L18_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L16_1
  L3_2 = mp
  L3_2 = L3_2.bitxor
  L4_2 = L17_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L17_1
  L6_2 = A1_2
  L5_2, L6_2 = L5_2(L6_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end

L19_1 = mp
L19_1 = L19_1.vfo_add_buffer
L21_1 = L15_1
L20_1 = L15_1.gsub
L22_1 = "(.)(.)"
L23_1 = L18_1
L24_1 = L12_1
L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
L21_1 = "[BondatCrypt3]"
L22_1 = mp
L22_1 = L22_1.ADD_VFO_TAKE_ACTION_ON_DAD
L19_1(L20_1, L21_1, L22_1)
L19_1 = mp
L19_1 = L19_1.CLEAN
return L19_1
