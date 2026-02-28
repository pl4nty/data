local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:Worm:VBS/Jenxcus!CryptRepsRev"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 50000 or 200000 < L0_1 then
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
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "[']([^0-9]-)%s"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = nil
L5_1 = 0
L6_1 = 9
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = string
  L9_1 = L9_1.format
  L10_1 = "[Rr][Ee][Pp][Ll][Aa][Cc][Ee]%%s-%%(%%a-%%s-,%%s-\"([^0-9]-)\"%%s-,%%s-\"[%d]\""
  L11_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1)
  L4_1 = L9_1
  L9_1 = string
  L9_1 = L9_1.match
  L10_1 = L1_1
  L11_1 = L4_1
  L9_1 = L9_1(L10_1, L11_1)
  L3_1 = L9_1
  if L3_1 == nil then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L10_1 = L2_1
  L9_1 = L2_1.gsub
  L11_1 = L3_1
  L12_1 = L8_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L2_1 = L9_1
end
L6_1 = L2_1
L5_1 = L2_1.reverse
L5_1 = L5_1(L6_1)
L2_1 = L5_1
L5_1 = mp
L5_1 = L5_1.vfo_add_buffer
L6_1 = fastHex2Bin
L7_1 = L2_1
L8_1 = "(..)"
L6_1 = L6_1(L7_1, L8_1)
L7_1 = "[CrypterRepsRev]"
L8_1 = mp
L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
