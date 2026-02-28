local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 10000 or 50000 < L0_1 then
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
L4_1 = "Received: from.*%(HELO.*Message%-ID%:.*Content%-Type%:  multipart/x%-zip.*Content%-Transfer%-Encoding%: base64.*Content%-Disposition%: attachment"
L2_1 = L2_1(L3_1, L4_1)
if nil == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "//LUA:Base64InEmail"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "Content%-Type%:  multipart/x%-zip.*Content%-Transfer%-Encoding%: base64.*Content%-Disposition%: attachment\r\n\r\n(.*)\r\n\r\n%-%-%-%-boundary"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
L6_1 = mp
L6_1 = L6_1.vfo_add_buffer
L7_1 = L5_1
L8_1 = "[MSG_Base64]"
L9_1 = mp
L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
