local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pesecs
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
L0_1 = L0_1[L1_1]
L0_1 = L0_1.PointerToRawData
L1_1 = pesecs
L2_1 = pehdr
L2_1 = L2_1.NumberOfSections
L1_1 = L1_1[L2_1]
L1_1 = L1_1.SizeOfRawData
L0_1 = L0_1 + L1_1
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = L0_1
L3_1 = 19
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L3_1 = 82
L4_1 = 97
L5_1 = 117
L6_1 = 109
L7_1 = 32
L8_1 = 69
L9_1 = 120
L10_1 = 116
L11_1 = 114
L12_1 = 97
L13_1 = 99
L14_1 = 116
L15_1 = 32
L16_1 = 76
L17_1 = 97
L18_1 = 98
L19_1 = 101
L20_1 = 108
L21_1 = 0
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L3_1 = 1
L4_1 = 19
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = string
  L7_1 = L7_1.byte
  L8_1 = L1_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  L8_1 = L2_1[L6_1]
  if L7_1 ~= L8_1 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "HSTR:TrojanDropper:Win32/Bindmaener_Lowfi"
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L3_1 = mp
L3_1 = L3_1.HSTR_WEIGHT
if 10 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "HSTR:TrojanDropper:Win32/Bindmaener_Lowfi"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
