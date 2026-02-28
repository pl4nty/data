local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 2097152 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "^%s-'"
L2_1 = L2_1(L3_1, L4_1)
if nil == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = 1
L3_1 = #L1_1
L3_1 = L1_1[L3_1]
if L3_1 ~= "\n" then
  L3_1 = L1_1
  L4_1 = "\n"
  L1_1 = L3_1 .. L4_1
  L2_1 = 0
end
L4_1 = L1_1
L3_1 = L1_1.gsub
L5_1 = "'.-\n"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = L3_1
L3_1 = L3_1.gsub
L5_1 = "%s+"
L6_1 = ""
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L5_1 = #L3_1
if 0 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = false
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = mp
L6_1 = L6_1.FOOTERPAGE_SZ
L7_1 = mp
L7_1 = L7_1.FOOTERPAGE_SZ
L7_1 = L0_1 - L7_1
L5_1 = L5_1(L6_1, L7_1)
if L2_1 == 0 then
  L6_1 = "'"
  L7_1 = L5_1
  L5_1 = L6_1 .. L7_1
end
L6_1 = L5_1[L5_1]
if L6_1 ~= "\n" then
  L6_1 = L5_1
  L7_1 = "\n"
  L5_1 = L6_1 .. L7_1
end
L7_1 = L5_1
L6_1 = L5_1.gsub
L8_1 = "'.-\n"
L9_1 = ""
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L6_1
L10_1 = "[JXSStrip]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
