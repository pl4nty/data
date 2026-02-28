local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 250 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = "[eE][xX][eE][cC][uU][tT][eE]%s-%(+%s-[cC][hH][rR]%(+"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if L2_1 == nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = tostring
  L5_1 = headerpage
  L4_1 = L4_1(L5_1)
  L5_1 = "[eE][xX][eE][cC][uU][tT][eE][gG][lL][oO][bB][aA][lL]%([cC][hH][rR]%("
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  L2_1 = L4_1
  L1_1 = L3_1
end
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = "%)+ -& -_?%s-vbcrlf -%)+"
L6_1 = mp
L6_1 = L6_1.HEADERPAGE_SZ
if L0_1 > L6_1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = tostring
  L8_1 = footerpage
  L7_1 = L7_1(L8_1)
  L8_1 = L5_1
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  L1_1 = L7_1
  L3_1 = L6_1
  L6_1 = mp
  L6_1 = L6_1.readprotection
  L7_1 = false
  L6_1(L7_1)
  L6_1 = mp
  L6_1 = L6_1.readfile
  L7_1 = L2_1 - 1
  L8_1 = mp
  L8_1 = L8_1.FOOTERPAGE_SZ
  L8_1 = L0_1 - L8_1
  L8_1 = L8_1 + L3_1
  L8_1 = L8_1 - L2_1
  L8_1 = L8_1 + 1
  L6_1 = L6_1(L7_1, L8_1)
  L4_1 = L6_1
else
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = tostring
  L8_1 = headerpage
  L7_1 = L7_1(L8_1)
  L8_1 = L5_1
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  L1_1 = L7_1
  L3_1 = L6_1
  L6_1 = tostring
  L7_1 = headerpage
  L6_1 = L6_1(L7_1)
  L7_1 = L6_1
  L6_1 = L6_1.sub
  L8_1 = L2_1
  L9_1 = L3_1
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L4_1 = L6_1
end
L7_1 = L4_1
L6_1 = L4_1.gsub
L8_1 = "%)+ ?& ?_?%s-[cC][hH][rR]%(+"
L9_1 = ","
L6_1 = L6_1(L7_1, L8_1, L9_1)
L4_1 = L6_1
L6_1 = "(%d+)^%(-(%d+%/%d+)"
L7_1 = string
L7_1 = L7_1.find
L8_1 = L4_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
if L7_1 ~= nil then
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L4_1
  L10_1 = L6_1
  L11_1 = "Math.pow%(%1,%(%2%)%)%+0.5"
  L12_1 = 3000
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  L4_1 = L8_1
  L9_1 = L4_1
  L8_1 = L4_1.sub
  L10_1 = 1
  L12_1 = L4_1
  L11_1 = L4_1.find
  L13_1 = "%^%("
  L11_1 = L11_1(L12_1, L13_1)
  L11_1 = L11_1 - 1
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L9_1 = "%1)"
  L4_1 = L8_1 .. L9_1
end
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = "eval(String.fromCharCode"
L10_1 = L4_1
L11_1 = ")"
L9_1 = L9_1 .. L10_1 .. L11_1
L10_1 = "[toJS]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
