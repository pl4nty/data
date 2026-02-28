local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == nil or L0_1 < 500 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 1048576
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = math_min
L5_1 = L0_1
L6_1 = L1_1
L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "atob%(%s*[\"']([A-Za-z0-9+%/=]+)"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = #L3_1
if 500 < L4_1 then
  L4_1 = mp
  L4_1 = L4_1.vfo_add_buffer
  L5_1 = MpCommon
  L5_1 = L5_1.Base64Decode
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = "[DocWrite.B64]"
  L7_1 = mp
  L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "//NScript:JSEnableEmulation"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
