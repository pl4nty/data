local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 then
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
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = true
L2_1(L3_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "</rsp:Command><rsp:Arguments>(.*)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil and L2_1 ~= "" then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "</rsp:Arguments>"
  L6_1 = 1
  L7_1 = true
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  _ = L4_1
  _start = L3_1
  L3_1 = _start
  if L3_1 then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = 1
    L6_1 = _start
    L6_1 = L6_1 - 1
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    L2_1 = L3_1
  end
  L3_1 = #L2_1
  L3_1 = L3_1 % 4
  if 1 <= L3_1 then
    L3_1 = L2_1
    L4_1 = string
    L4_1 = L4_1.rep
    L5_1 = "="
    L6_1 = #L2_1
    L6_1 = L6_1 % 4
    L6_1 = 4 - L6_1
    L4_1 = L4_1(L5_1, L6_1)
    L2_1 = L3_1 .. L4_1
  end
  L3_1 = MpCommon
  L3_1 = L3_1.Base64Decode
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = mp
  L3_1 = L3_1.vfo_add_buffer
  L4_1 = L2_1
  L5_1 = "[ExchgArgs]"
  L6_1 = mp
  L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L3_1(L4_1, L5_1, L6_1)
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "<BA N=\"[^\"]+\">(.*)</BA>"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil and L3_1 ~= "" then
    L4_1 = MpCommon
    L4_1 = L4_1.Base64Decode
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L4_1 = mp
    L4_1 = L4_1.vfo_add_buffer
    L5_1 = L3_1
    L6_1 = "[ExchgByteArray]"
    L7_1 = mp
    L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L4_1(L5_1, L6_1, L7_1)
  end
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "<t:BinaryData>(.*)</t:BinaryData>"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil and L4_1 ~= "" then
    L5_1 = MpCommon
    L5_1 = L5_1.Base64Decode
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L6_1 = L4_1
    L7_1 = "[ExchgbinData]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
