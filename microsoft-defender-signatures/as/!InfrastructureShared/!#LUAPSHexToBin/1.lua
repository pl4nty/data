local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 8192 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = " "
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = ""
L3_1 = 0
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L1_1
L6_1 = "%(?(0x[0-9A-Fa-f]+,0x[0-9A-Fa-f]+,0x[0-9A-Fa-f]+,.-)%)?;"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1 in L4_1, L5_1, L6_1 do
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L7_1
  L10_1 = "0x"
  L11_1 = ""
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1 = L8_1
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L7_1
  L10_1 = ","
  L11_1 = ""
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L7_1 = L8_1
  L8_1 = L2_1
  L9_1 = L7_1
  L2_1 = L8_1 .. L9_1
  L3_1 = L3_1 + 1
end
if not (1 < L3_1) then
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  if not (256 < L4_1) then
    goto lbl_68
  end
end
L4_1 = mp
L4_1 = L4_1.vfo_add_buffer
L5_1 = fastHex2Bin
L6_1 = L2_1
L7_1 = "([0-9A-Fa-f][0-9A-Fa-f])"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = "[hextobin]"
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L4_1(L5_1, L6_1, L7_1)
::lbl_68::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
