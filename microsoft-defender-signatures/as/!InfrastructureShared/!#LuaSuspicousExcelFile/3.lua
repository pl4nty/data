local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = ""
L1_1 = ""
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 20481 or 69632 < L2_1 then
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
L4_1 = L2_1 - 8192
L5_1 = 4096
L3_1 = L3_1(L4_1, L5_1)
L4_1 = tostring
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "Excel 4"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Excel40"
  L5_1(L6_1)
  L0_1 = "Found"
end
if L0_1 ~= "Found" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = L2_1 - 12288
L7_1 = 4096
L5_1 = L5_1(L6_1, L7_1)
L6_1 = tostring
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "win10\000\000\000\030\000\000\000\016\000\000\000Micr"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 ~= nil then
  L1_1 = "Found"
end
if L1_1 ~= "Found" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = 12288
L9_1 = 8192
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L7_1
L10_1 = "[Testing]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
