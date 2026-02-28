local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:Worm:VBS/Jenxcus!Crypt39"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 30000 or 300000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "%a-%s-=%s-split%(%a-%(0%),\"(.)\"%)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "&%s-chr%(%a-%(%a-%)%+(%d)%)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 0
L6_1 = L0_1
L4_1 = L4_1(L5_1, L6_1)
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "'(.-)\r\n"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.vfo_add_buffer
L7_1 = fastDec2BinWithKey
L8_1 = L5_1
L9_1 = "(%d+)[^%d]+"
L10_1 = L3_1

function L11_1(A0_2, A1_2)
  local L2_2
  L2_2 = A1_2 - A0_2
  return L2_2
end

L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
L8_1 = "[Crypt39]"
L9_1 = mp
L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
