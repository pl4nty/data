local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
if not L0_1 then
  L0_1 = ""
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+)%.([^.]+)$"
L1_1, L2_1 = L1_1(L2_1, L3_1)
if nil ~= L2_1 and nil ~= L1_1 then
  L3_1 = {}
  L3_1.doc = true
  L3_1.docm = true
  L3_1.xls = true
  L3_1.xlsm = true
  L3_1.pdf = true
  L4_1 = L3_1[L2_1]
  if true == L4_1 then
    L4_1 = {}
    L5_1 = "untitled"
    L6_1 = "img"
    L7_1 = "receipt"
    L8_1 = "invoice"
    L9_1 = "steam"
    L10_1 = "min"
    L11_1 = "nuevo"
    L12_1 = "pic"
    L13_1 = "jpg"
    L14_1 = "inc"
    L15_1 = "crack"
    L16_1 = "files"
    L17_1 = "backup"
    L18_1 = "plugin"
    L19_1 = "setup"
    L20_1 = "pdf"
    L21_1 = "acc"
    L22_1 = "cracked"
    L23_1 = "dhl"
    L24_1 = "instr"
    L4_1[1] = L5_1
    L4_1[2] = L6_1
    L4_1[3] = L7_1
    L4_1[4] = L8_1
    L4_1[5] = L9_1
    L4_1[6] = L10_1
    L4_1[7] = L11_1
    L4_1[8] = L12_1
    L4_1[9] = L13_1
    L4_1[10] = L14_1
    L4_1[11] = L15_1
    L4_1[12] = L16_1
    L4_1[13] = L17_1
    L4_1[14] = L18_1
    L4_1[15] = L19_1
    L4_1[16] = L20_1
    L4_1[17] = L21_1
    L4_1[18] = L22_1
    L4_1[19] = L23_1
    L4_1[20] = L24_1
    L5_1 = pairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L11_1 = L1_1
      L10_1 = L1_1.sub
      L12_1 = L9_1
      L13_1 = 1
      L14_1 = "true"
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 then
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
