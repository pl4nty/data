local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 1048576 < L0_1 then
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
L2_1 = "base64.+Content%-Type:.+application/x%-mso([%s%w+/]+=?=?)"
L3_1 = 0
L4_1 = 1
while L3_1 <= 10 do
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L1_1
  L7_1 = L2_1
  L8_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1, L8_1)
  if not L5_1 then
    break
  end
  L8_1 = #L7_1
  if 100 < L8_1 then
    L3_1 = L3_1 + 1
    L8_1 = mp
    L8_1 = L8_1.vfo_add_buffer
    L9_1 = MpCommon
    L9_1 = L9_1.Base64Decode
    L10_1 = L7_1
    L9_1 = L9_1(L10_1)
    L10_1 = "[RtfMso]"
    L11_1 = mp
    L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L8_1(L9_1, L10_1, L11_1)
  end
  L4_1 = L6_1 + 1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
