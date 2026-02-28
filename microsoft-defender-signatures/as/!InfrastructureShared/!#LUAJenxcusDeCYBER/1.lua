local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 2097152 < L0_1 then
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
L4_1 = "^%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]%%[0-9A-Za-z][0-9A-Za-z]"
L2_1 = L2_1(L3_1, L4_1)
if nil == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L0_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = fastHex2Bin
L5_1 = L2_1
L6_1 = "%%([0-9A-Za-z][0-9A-Za-z])"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = "[JenxcusDeHex]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
