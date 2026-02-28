local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:KiraAsciiObfuscator"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = 1
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "SCPT:KiraDecryptKira"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = 2
  else
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "SCPT:KiraDecryptXor"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L0_1 = 3
    else
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 1024 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if 2097152 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ""
L3_1 = ""

function L4_1(A0_2)
  local L1_2
  return A0_2
end

L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "SCPT:KiraStrReverse"
L5_1 = L5_1(L6_1)
if L5_1 then
  L2_1 = "[a-zA-Z_][0-9a-zA-Z_]-%("
  L3_1 = "%)"
  L5_1 = string
  L4_1 = L5_1.reverse
end
L5_1 = nil
L6_1 = nil
if L0_1 == 1 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = tostring
  L9_1 = headerpage
  L8_1 = L8_1(L9_1)
  L9_1 = "= ?Chr%(%d-%) ?& ?[cC][hH][rR]%(%d-%)"
  L7_1, L8_1 = L7_1(L8_1, L9_1)
  _ = L8_1
  L5_1 = L7_1
  L5_1 = L5_1 + 1
elseif L0_1 == 2 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = tostring
  L9_1 = headerpage
  L8_1 = L8_1(L9_1)
  L9_1 = "= ?[a-zA-Z_][0-9a-zA-Z_]-%("
  L10_1 = L2_1
  L11_1 = "\".....%d-\""
  L12_1 = L3_1
  L13_1 = ",(%d-)%) ?&"
  L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  L6_1 = L9_1
  _ = L8_1
  L5_1 = L7_1
  L5_1 = L5_1 + 1
elseif L0_1 == 3 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = tostring
  L9_1 = headerpage
  L8_1 = L8_1(L9_1)
  L9_1 = "= ?[a-zA-Z_][0-9a-zA-Z_]-%("
  L10_1 = L2_1
  L11_1 = "\""
  L9_1 = L9_1 .. L10_1 .. L11_1
  L7_1, L8_1 = L7_1(L8_1, L9_1)
  L5_1 = L8_1
  _ = L7_1
else
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = L5_1
L9_1 = L1_1 - L5_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = nil
L9_1 = nil
if L0_1 == 1 then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L7_1
  L12_1 = [=[

[eE][xX][eE][cC][uU][tT][eE]]=]
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  _ = L11_1
  L8_1 = L10_1
  L10_1 = fastDec2Bin
  L12_1 = L7_1
  L11_1 = L7_1.sub
  L13_1 = 1
  L14_1 = L8_1
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = "&? ?[cC][hH][rR]%((%d-)%) ?"
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  _ = L11_1
  L9_1 = L10_1
elseif L0_1 == 2 then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L7_1
  L12_1 = [=[

[eE][xX][eE][cC][uU][tT][eE]]=]
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  _ = L11_1
  L8_1 = L10_1
  L10_1 = fastDec2BinWithKey
  L12_1 = L7_1
  L11_1 = L7_1.sub
  L13_1 = 1
  L14_1 = L8_1
  L11_1 = L11_1(L12_1, L13_1, L14_1)
  L12_1 = "&? ?[a-zA-Z_][0-9a-zA-Z_]-%("
  L13_1 = L2_1
  L14_1 = "\".....(%d-)\""
  L15_1 = L3_1
  L16_1 = ",%d-%) ?"
  L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1
  L13_1 = L6_1
  
  function L14_1(A0_2, A1_2)
    local L2_2, L3_2
    L2_2 = L4_1
    L3_2 = A0_2 + A1_2
    return L2_2(L3_2)
  end
  
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  _ = L11_1
  L9_1 = L10_1
elseif L0_1 == 3 then
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L7_1
  L12_1 = "\",(%d-)%)"
  L13_1 = L3_1
  L14_1 = "%s-[eE][xX][eE][cC][uU][tT][eE]"
  L12_1 = L12_1 .. L13_1 .. L14_1
  L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
  L6_1 = L12_1
  _ = L11_1
  L8_1 = L10_1
  L8_1 = L8_1 - 1
  L10_1 = fastBinaryTransform
  L11_1 = L4_1
  L13_1 = L7_1
  L12_1 = L7_1.sub
  L14_1 = 1
  L15_1 = L8_1
  L12_1, L13_1, L14_1, L15_1, L16_1 = L12_1(L13_1, L14_1, L15_1)
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1)
  L12_1 = "(.)"
  L13_1 = L6_1
  L14_1 = mp
  L14_1 = L14_1.bitxor
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  _ = L11_1
  L9_1 = L10_1
else
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = mp
L10_1 = L10_1.vfo_add_buffer
L11_1 = L9_1
L12_1 = "[JXSK"
L13_1 = L0_1
L14_1 = "]"
L12_1 = L12_1 .. L13_1 .. L14_1
L13_1 = mp
L13_1 = L13_1.ADD_VFO_TAKE_ACTION_ON_DAD
L10_1(L11_1, L12_1, L13_1)
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
