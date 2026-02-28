local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 15000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if 500000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = footerpage
L1_1 = L1_1(L2_1)
L2_1 = nil
L3_1 = nil
L4_1 = {}
L5_1 = {}
L6_1 = 0
L7_1 = 9
L8_1 = 1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = string
  L10_1 = L10_1.format
  L11_1 = "[Rr][Ee][Pp][Ll][Aa][Cc][Ee]%%s-%%(%%a-,\"(.)\",\"[%d]\""
  L12_1 = L9_1
  L10_1 = L10_1(L11_1, L12_1)
  L3_1 = L10_1
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L1_1
  L12_1 = L3_1
  L10_1 = L10_1(L11_1, L12_1)
  L2_1 = L10_1
  if L2_1 == nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L2_1
  L10_1(L11_1, L12_1)
  L5_1[L2_1] = L9_1
end
L6_1 = string
L6_1 = L6_1.format
L7_1 = "[%s]"
L8_1 = table
L8_1 = L8_1.concat
L9_1 = L4_1
L10_1 = ""
L8_1, L9_1, L10_1, L11_1, L12_1 = L8_1(L9_1, L10_1)
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = 0
L9_1 = L0_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = string
L8_1 = L8_1.match
L9_1 = L7_1
L10_1 = "=%s-\"(%c-)\""
L8_1 = L8_1(L9_1, L10_1)
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L10_1 = L8_1
L9_1 = L8_1.gsub
L11_1 = L6_1
L12_1 = L5_1
L9_1 = L9_1(L10_1, L11_1, L12_1)
L8_1 = L9_1
L9_1 = mp
L9_1 = L9_1.vfo_add_buffer
L10_1 = fastDec2Bin
L11_1 = L8_1
L12_1 = "(%d+)[^%d]?"
L10_1 = L10_1(L11_1, L12_1)
L11_1 = "[Jenxcus]"
L12_1 = mp
L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
