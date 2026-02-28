local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = #L1_1
if L2_1 < 5000 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.UfsGetMetadataStringA
L3_1 = "dkey"
L4_1 = true
L2_1, L3_1 = L2_1(L3_1, L4_1)
L5_1 = L1_1
L4_1 = L1_1.sub
L6_1 = 1
L7_1 = #L1_1
L7_1 = L7_1 - 44
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)

function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = table
  L2_2 = L2_2.insert
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = {}
  L6_2 = A1_2
  L5_2 = A1_2.gmatch
  L7_2 = "(.)"
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  for L8_2 in L5_2, L6_2, L7_2 do
    L9_2 = L2_2
    L10_2 = L4_2
    L12_2 = L8_2
    L11_2 = L8_2.byte
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2(L12_2)
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
  L5_2 = #L4_2
  L5_2 = L5_2 + 1
  L4_2[L5_2] = 0
  L5_2 = {}
  L6_2 = string
  L6_2 = L6_2.gmatch
  L7_2 = A0_2
  L8_2 = "(.)"
  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)
  for L9_2 in L6_2, L7_2, L8_2 do
    L10_2 = L2_2
    L11_2 = L5_2
    L13_2 = L9_2
    L12_2 = L9_2.byte
    L12_2, L13_2, L14_2, L15_2, L16_2 = L12_2(L13_2)
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L10_2 = #L5_2
    if 3900 < L10_2 then
      break
    end
  end
  L6_2 = 2
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = {}
  L9_2 = L10_2
  L10_2 = 1
  L11_2 = 1500
  L12_2 = 1
  for L13_2 = L10_2, L11_2, L12_2 do
    L14_2 = L5_2[L13_2]
    L15_2 = L4_2[L6_2]
    L8_2 = L14_2 - L15_2
    if L8_2 < 0 then
      L8_2 = L8_2 + 256
    end
    L14_2 = L2_2
    L15_2 = L9_2
    L16_2 = L8_2
    L14_2(L15_2, L16_2)
    L6_2 = L6_2 + 1
    L14_2 = #L4_2
    if L6_2 > L14_2 then
      L6_2 = 1
    end
  end
  L10_2 = fastDec2Bin
  L11_2 = L3_2
  L12_2 = L9_2
  L13_2 = ","
  L11_2 = L11_2(L12_2, L13_2)
  L12_2 = ","
  L11_2 = L11_2 .. L12_2
  L12_2 = "(%d-),"
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = L10_2
  L10_2 = L10_2.sub
  L12_2 = 1
  L13_2 = L7_2
  L10_2, L11_2 = L10_2(L11_2, L12_2, L13_2)
  L5_1 = L11_2
  A0_2 = L10_2
  return A0_2
end

L7_1 = L6_1
L8_1 = L4_1
L9_1 = L3_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.crc32
L9_1 = -1
L10_1 = L7_1
L11_1 = 1
L12_1 = 1500
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if L8_1 == 3787559893 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L7_1
L10_1 = "[JenxcusToStrV3]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
