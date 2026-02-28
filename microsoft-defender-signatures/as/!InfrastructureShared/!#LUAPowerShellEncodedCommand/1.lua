local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 1280 or 65536 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "encodedcommand"
L5_1 = 1
L6_1 = true
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "([%w/+=]+)"
  L8_1 = L3_1 + 1
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L7_1
  L3_1 = L6_1
  L2_1 = L5_1
  if L2_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "//MpBase64DecodeLongLines"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "FromEncodedCommand"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L6_1 = L4_1
    L7_1 = "[PSEncodedCommand]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
  end
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L1_1
L7_1 = "%:%:FromBase64String%(%'"
L5_1, L6_1 = L5_1(L6_1, L7_1)
L3_1 = L6_1
L2_1 = L5_1
if L2_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "([%w/+=]+)"
  L8_1 = L3_1 + 1
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L7_1
  L3_1 = L6_1
  L2_1 = L5_1
  if L2_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "//MpBase64DecodeLongLines"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "FromBase64String"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L6_1 = L4_1
    L7_1 = "[PSBase64String]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
