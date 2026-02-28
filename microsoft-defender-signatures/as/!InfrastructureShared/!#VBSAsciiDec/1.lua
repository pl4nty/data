local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "=\""
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "[%d,]+"
  L5_1 = L1_1 + 2
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = {}
  L4_1 = 0
  L5_1 = 255
  L6_1 = 1
  for L7_1 = L4_1, L5_1, L6_1 do
    L8_1 = string
    L8_1 = L8_1.format
    L9_1 = "%d"
    L10_1 = L7_1
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = string
    L9_1 = L9_1.format
    L10_1 = "%c"
    L11_1 = L7_1
    L9_1 = L9_1(L10_1, L11_1)
    L3_1[L8_1] = L9_1
  end
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L2_1
  L6_1 = "(%d+),"
  L7_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.vfo_add_buffer
  L6_1 = L4_1
  L7_1 = "[Ascii]"
  L8_1 = mp
  L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L5_1(L6_1, L7_1, L8_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
