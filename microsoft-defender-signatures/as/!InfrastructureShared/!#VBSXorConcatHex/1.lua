local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
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
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "=[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "[%x]+"
  L5_1 = L1_1 + 2
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = nil
  L4_1 = #L2_1
  L4_1 = L1_1 + L4_1
  L4_1 = L4_1 + 3
  L6_1 = L0_1
  L5_1 = L0_1.find
  L7_1 = "&[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
  L8_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L1_1 = L5_1
  while L1_1 ~= nil do
    L6_1 = L0_1
    L5_1 = L0_1.match
    L7_1 = "[%x]+"
    L8_1 = L1_1 + 2
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L5_1 = L2_1
    L6_1 = L3_1
    L2_1 = L5_1 .. L6_1
    L5_1 = #L3_1
    L5_1 = L1_1 + L5_1
    L4_1 = L5_1 + 3
    L6_1 = L0_1
    L5_1 = L0_1.find
    L7_1 = "&[%s]*\"[%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x][%x]"
    L8_1 = L4_1
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L1_1 = L5_1
  end
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = L0_1
  L7_1 = "[Ee][Xx][Ee][Cc][Uu][Tt][Ee][%s]*%([%a]+[%s]*%([%s]*[Cc][Hh][Rr][Ww][%s]*%([%s]*([%d]+)%.?0?[%s]*%)[%s]*,"
  L8_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 == nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = tonumber
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L7_1 = {}
  L8_1 = nil
  L9_1 = nil
  L10_1 = 0
  L11_1 = 255
  L12_1 = 1
  for L13_1 = L10_1, L11_1, L12_1 do
    L14_1 = string
    L14_1 = L14_1.format
    L15_1 = "%02x"
    L16_1 = L13_1
    L14_1 = L14_1(L15_1, L16_1)
    L8_1 = L14_1
    L14_1 = mp
    L14_1 = L14_1.bitxor
    L15_1 = L13_1
    L16_1 = L6_1
    L14_1 = L14_1(L15_1, L16_1)
    L9_1 = L14_1
    L14_1 = string
    L14_1 = L14_1.format
    L15_1 = "%c"
    L16_1 = L9_1
    L14_1 = L14_1(L15_1, L16_1)
    L7_1[L8_1] = L14_1
  end
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L2_1
  L10_1 = L10_1(L11_1)
  L11_1 = string
  L11_1 = L11_1.gsub
  L12_1 = L10_1
  L13_1 = "(%x%x)"
  L14_1 = L7_1
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
