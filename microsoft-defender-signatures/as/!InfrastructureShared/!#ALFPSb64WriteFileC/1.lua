local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
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
  L2_1 = nil
  L3_1 = nil
  L4_1 = nil
  L5_1 = 1
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L1_1
  L8_1 = "%:%:FromBase64String%("
  L6_1, L7_1 = L6_1(L7_1, L8_1)
  L3_1 = L7_1
  L2_1 = L6_1
  if L2_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L1_1
    L8_1 = "([%w/+=]+)"
    L9_1 = L3_1 + 1
    L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1, L9_1)
    L4_1 = L8_1
    L3_1 = L7_1
    L2_1 = L6_1
    if L2_1 ~= nil then
      L6_1 = nil
      L7_1 = MpCommon
      L7_1 = L7_1.Base64Decode
      L8_1 = L4_1
      L7_1 = L7_1(L8_1)
      L6_1 = L7_1
      if L6_1 ~= nil and L6_1 ~= "" then
        L7_1 = mp
        L7_1 = L7_1.vfo_add_buffer
        L8_1 = L6_1
        L9_1 = string
        L9_1 = L9_1.format
        L10_1 = "[PSBase64][%02X]"
        L11_1 = L5_1
        L9_1 = L9_1(L10_1, L11_1)
        L10_1 = mp
        L10_1 = L10_1.ADD_VFO_TAKE_ACTION_ON_DAD
        L7_1(L8_1, L9_1, L10_1)
        L5_1 = L5_1 + 1
      end
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
