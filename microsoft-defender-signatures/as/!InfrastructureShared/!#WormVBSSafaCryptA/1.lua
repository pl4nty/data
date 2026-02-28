local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1792 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.readfile
  L1_1 = 0
  L2_1 = 1792
  L0_1 = L0_1(L1_1, L2_1)
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "[dD][eE][cC][rR][yY][pP][tT]"
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  L3_1 = false
  L4_1 = nil
  if L1_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.readfile
    L6_1 = L1_1 + 8
    L7_1 = mp
    L7_1 = L7_1.getfilesize
    L7_1 = L7_1()
    L7_1 = L7_1 - L1_1
    L7_1 = L7_1 - 8
    L5_1 = L5_1(L6_1, L7_1)
    L4_1 = L5_1
    L3_1 = true
  else
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L0_1
    L7_1 = "\"[A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/][A-Za-z0-9%+/]"
    L5_1, L6_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= nil then
      L7_1 = mp
      L7_1 = L7_1.readfile
      L8_1 = L5_1
      L9_1 = mp
      L9_1 = L9_1.getfilesize
      L9_1 = L9_1()
      L9_1 = L9_1 - L5_1
      L7_1 = L7_1(L8_1, L9_1)
      L4_1 = L7_1
      L3_1 = true
    end
  end
  if L3_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "//MpBase64DecodeLongLines"
    L5_1(L6_1)
    L6_1 = L4_1
    L5_1 = L4_1.gsub
    L7_1 = "\"%).+"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L7_1 = L5_1
    L6_1 = L5_1.len
    L6_1 = L6_1(L7_1)
    L7_1 = L6_1 / 4
    L7_1 = L7_1 * 4
    L7_1 = L6_1 - L7_1
    L8_1 = mp
    L8_1 = L8_1.vfo_add_buffer
    L9_1 = L5_1
    L10_1 = string
    L10_1 = L10_1.rep
    L11_1 = "="
    L12_1 = L7_1
    L10_1 = L10_1(L11_1, L12_1)
    L9_1 = L9_1 .. L10_1
    L10_1 = "[Safa_Crypt]"
    L11_1 = mp
    L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L8_1(L9_1, L10_1, L11_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
