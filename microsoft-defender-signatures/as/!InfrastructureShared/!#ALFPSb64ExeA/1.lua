local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 5000000 then
  L1_1 = mp
  L1_1 = L1_1.readprotection
  L2_1 = false
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.readfile
  L2_1 = 0
  L3_1 = L0_1
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = 1
  L3_1 = string
  L3_1 = L3_1.gmatch
  L4_1 = L1_1
  L5_1 = "TV[%w+/]+=?=?"
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  for L6_1 in L3_1, L4_1, L5_1 do
    L7_1 = nil
    L8_1 = MpCommon
    L8_1 = L8_1.Base64Decode
    L9_1 = L6_1
    L8_1 = L8_1(L9_1)
    L7_1 = L8_1
    if L7_1 ~= nil and L7_1 ~= "" then
      L8_1 = mp
      L8_1 = L8_1.vfo_add_buffer
      L9_1 = L7_1
      L10_1 = string
      L10_1 = L10_1.format
      L11_1 = "[PSBase64][%02X]"
      L12_1 = L2_1
      L10_1 = L10_1(L11_1, L12_1)
      L11_1 = mp
      L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
      L8_1(L9_1, L10_1, L11_1)
      L2_1 = L2_1 + 1
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
else
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Lua:Psb64ExeBSizeAms"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
