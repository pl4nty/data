local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "AGGR:PYC.B64decoder!filter"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:[PyInsObj]"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "PACKED_WITH:[py2exebin]"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 227 then
  L0_1 = mp
  L0_1 = L0_1.readu_u16
  L1_1 = headerpage
  L2_1 = 1
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 ~= 13330 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096 < L0_1 then
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
L2_1 = 0
L4_1 = L1_1
L3_1 = L1_1.gmatch
L5_1 = "%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w%w+"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L7_1 = string
  L7_1 = L7_1.len
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if 128 <= L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.Base64Decode
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 ~= nil and L7_1 ~= "" then
      L8_1 = mp
      L8_1 = L8_1.vfo_add_buffer
      L9_1 = L7_1
      L10_1 = string
      L10_1 = L10_1.format
      L11_1 = "[PythonBase64][%02X]"
      L12_1 = L2_1
      L10_1 = L10_1(L11_1, L12_1)
      L11_1 = mp
      L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
      L8_1(L9_1, L10_1, L11_1)
      L2_1 = L2_1 + 1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
