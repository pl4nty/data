local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 33554432 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "(nsis-instdata)"
L5_1 = -15
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = 0
  L3_1 = 64
  L4_1 = mp
  L4_1 = L4_1.readprotection
  L5_1 = false
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.readfile
  L5_1 = L2_1
  L6_1 = 8
  L4_1 = L4_1(L5_1, L6_1)
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = L4_1
  L7_1 = 1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == L0_1 then
    L6_1 = mp
    L6_1 = L6_1.readu_u32
    L7_1 = L4_1
    L8_1 = 5
    L6_1 = L6_1(L7_1, L8_1)
    L5_1 = L6_1
    L2_1 = 4
  end
  if 512 < L5_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = mp
  L6_1 = L6_1.readfile
  L7_1 = L2_1 + 4
  L8_1 = L3_1
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = 1
  L8_1 = L3_1
  L9_1 = 8
  for L10_1 = L7_1, L8_1, L9_1 do
    L11_1 = mp
    L11_1 = L11_1.readu_u32
    L12_1 = L6_1
    L13_1 = L10_1
    L11_1 = L11_1(L12_1, L13_1)
    if L0_1 < L11_1 then
      L11_1 = mp
      L11_1 = L11_1.CLEAN
      return L11_1
    end
  end
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpIsExhaustiveScriptScan"
  L7_1(L8_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
