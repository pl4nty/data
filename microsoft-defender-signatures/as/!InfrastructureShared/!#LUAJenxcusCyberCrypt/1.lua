local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
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
L4_1 = "\"(.-)\""
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
while true do
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not (L5_1 < 5000) then
    break
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = "\"(.-)\""
  L8_1 = L3_1 + 2
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L7_1
  L3_1 = L6_1
  L2_1 = L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "^%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = fastHex2Bin
  L6_1 = L4_1
  L7_1 = "%%"
  L8_1 = "(..)"
  L7_1 = L7_1 .. L8_1
  L5_1, L6_1 = L5_1(L6_1, L7_1)
  L8_1 = L5_1
  L7_1 = L5_1.sub
  L9_1 = 1
  L10_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  L4_1 = L7_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 < 5000 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if 2097152 < L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "SCPT:ReverseBase64"
L5_1 = L5_1(L6_1)
if L5_1 then
  L6_1 = L4_1
  L5_1 = L4_1.reverse
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
end
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "^=="
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L6_1 = L4_1
  L5_1 = L4_1.reverse
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
end
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = "//MpBase64DecodeLongLines"
L5_1(L6_1)
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = L4_1
L7_1 = "[Jenxcus]"
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
