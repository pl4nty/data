local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 102400 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = mp
L2_1 = L2_1.HEADERPAGE_SZ
if L0_1 <= L2_1 then
  L2_1 = tostring
  L3_1 = headerpage
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
else
  L2_1 = mp
  L2_1 = L2_1.readprotection
  L3_1 = false
  L2_1(L3_1)
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 0
  L5_1 = L0_1
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.gmatch
L3_1 = L1_1
L4_1 = "var_shellcode%s*=%s*\"(4d5a%x+)\""
L2_1 = L2_1(L3_1, L4_1)
L3_1 = 0
L4_1 = L2_1
L5_1 = nil
L6_1 = nil
for L7_1 in L4_1, L5_1, L6_1 do
  if L7_1 ~= nil and L7_1 ~= "" then
    L8_1 = mp
    L8_1 = L8_1.vfo_add_buffer
    L9_1 = fastHex2Bin
    L10_1 = L7_1
    L11_1 = "[0-9A-Fa-f][0-9A-Fa-f]"
    L9_1 = L9_1(L10_1, L11_1)
    L10_1 = string
    L10_1 = L10_1.format
    L11_1 = "[Hexify][%02X]"
    L12_1 = L3_1
    L10_1 = L10_1(L11_1, L12_1)
    L11_1 = mp
    L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L8_1(L9_1, L10_1, L11_1)
    L3_1 = L3_1 + 1
  end
end
if 0 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
