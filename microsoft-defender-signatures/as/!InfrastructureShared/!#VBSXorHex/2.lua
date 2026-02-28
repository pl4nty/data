local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 524288 then
  L0_1 = mp
  L0_1 = L0_1.readprotection
  L1_1 = false
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.readfile
  L1_1 = 0
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = ",[%s]+%)(%d)(%d)%([Ww][Rr][Hh][Cc][%s]+%("
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L2_1 == nil or L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = tonumber
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L4_1 = tonumber
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L4_1 = 10 * L4_1
  L3_1 = L3_1 + L4_1
  L5_1 = L0_1
  L4_1 = L0_1.find
  L6_1 = "&\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L6_1 = L0_1
  L5_1 = L0_1.match
  L7_1 = "[%x]+"
  L8_1 = L4_1 + 2
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = nil
  L8_1 = L0_1
  L7_1 = L0_1.find
  L9_1 = "&\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
  L10_1 = #L5_1
  L10_1 = L4_1 + L10_1
  L10_1 = L10_1 + 3
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L4_1 = L7_1
  while L4_1 ~= nil do
    L8_1 = L0_1
    L7_1 = L0_1.match
    L9_1 = "[%x]+"
    L10_1 = L4_1 + 2
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L6_1 = L7_1
    L7_1 = L5_1
    L8_1 = L6_1
    L5_1 = L7_1 .. L8_1
    L8_1 = L0_1
    L7_1 = L0_1.find
    L9_1 = "&\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
    L10_1 = #L6_1
    L10_1 = L4_1 + L10_1
    L10_1 = L10_1 + 3
    L7_1 = L7_1(L8_1, L9_1, L10_1)
    L4_1 = L7_1
  end
  L7_1 = string
  L7_1 = L7_1.reverse
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  L8_1 = {}
  L9_1 = nil
  L10_1 = nil
  L11_1 = 0
  L12_1 = 255
  L13_1 = 1
  for L14_1 = L11_1, L12_1, L13_1 do
    L15_1 = string
    L15_1 = L15_1.format
    L16_1 = "%02X"
    L17_1 = L14_1
    L15_1 = L15_1(L16_1, L17_1)
    L9_1 = L15_1
    L15_1 = mp
    L15_1 = L15_1.bitxor
    L16_1 = L14_1
    L17_1 = L3_1
    L15_1 = L15_1(L16_1, L17_1)
    L10_1 = L15_1
    L15_1 = string
    L15_1 = L15_1.format
    L16_1 = "%c"
    L17_1 = L10_1
    L15_1 = L15_1(L16_1, L17_1)
    L8_1[L9_1] = L15_1
  end
  L11_1 = string
  L11_1 = L11_1.gsub
  L12_1 = L7_1
  L13_1 = "(%x%x)"
  L14_1 = L8_1
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = mp
  L12_1 = L12_1.vfo_add_buffer
  L13_1 = L11_1
  L14_1 = "[Vbs]"
  L15_1 = mp
  L15_1 = L15_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L12_1(L13_1, L14_1, L15_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
