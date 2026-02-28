local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == nil or 100000 < L0_1 or L0_1 < 100 then
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
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "src=\"data:text/javascript;base64,(.-)\">"

function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = ">"
  L2_2 = MpCommon
  L2_2 = L2_2.Base64Decode
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 .. L2_2
  return L1_2
end

L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = #L2_1
if 0 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.vfo_add_buffer
  L4_1 = L2_1
  L5_1 = "[B64JavaScript]"
  L6_1 = mp
  L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "//NScript:JSEnableEmulation"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
