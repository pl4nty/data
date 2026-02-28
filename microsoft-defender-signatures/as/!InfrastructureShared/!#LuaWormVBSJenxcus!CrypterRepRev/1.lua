local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:Worm:VBS/Jenxcus!CryptRepRev"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 9000 or 300000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "=%s-replace%s-%(%a-%s-,%s-\"..?.?.?.?.?\"%s-,%s-\"(%d-)\"%)%s"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = 0
L5_1 = L0_1
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "'(.-)%s"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L6_1 = L4_1
L5_1 = L4_1.gsub
L7_1 = "[^0-9A-F][^0-9A-F]?[^0-9A-F]?[^0-9A-F]?[^0-9A-F]?[^0-9A-F]?"
L8_1 = L2_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
L4_1 = L5_1
L6_1 = L4_1
L5_1 = L4_1.reverse
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = fastHex2Bin
L7_1 = L4_1
L8_1 = "(..)"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = "[CrypterRepRev]"
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
