local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = {}
L0_1[8957006] = true
L0_1[2262201400] = true
L1_1 = true
L2_1 = sysio
L2_1 = L2_1.GetLogicalDrivesMask
L2_1 = L2_1()
L3_1 = {}
L4_1 = "A:"
L5_1 = "B:"
L6_1 = "C:"
L7_1 = "D:"
L8_1 = "E:"
L9_1 = "F:"
L10_1 = "G:"
L11_1 = "H:"
L12_1 = "I:"
L13_1 = "J:"
L14_1 = "K:"
L15_1 = "L:"
L16_1 = "M:"
L17_1 = "N:"
L18_1 = "O:"
L19_1 = "P:"
L20_1 = "Q:"
L21_1 = "R:"
L22_1 = "S:"
L23_1 = "T:"
L24_1 = "U:"
L25_1 = "V:"
L26_1 = "W:"
L27_1 = "X:"
L28_1 = "Y:"
L29_1 = "Z:"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L3_1[18] = L21_1
L3_1[19] = L22_1
L3_1[20] = L23_1
L3_1[21] = L24_1
L3_1[22] = L25_1
L3_1[23] = L26_1
L3_1[24] = L27_1
L3_1[25] = L28_1
L3_1[26] = L29_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = mp
  L9_1 = L9_1.bitand
  L10_1 = mp
  L10_1 = L10_1.shl32
  L11_1 = 1
  L12_1 = L7_1 - 1
  L10_1 = L10_1(L11_1, L12_1)
  L11_1 = L2_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= 0 then
    L9_1 = sysio
    L9_1 = L9_1.GetFileFsVolumeInformation
    L10_1 = L8_1
    L9_1 = L9_1(L10_1)
    if L9_1 ~= nil then
      L10_1 = L9_1.VolumeSerialNumber
      if L10_1 ~= nil then
        L10_1 = L9_1.VolumeSerialNumber
        L10_1 = L0_1[L10_1]
        if L10_1 then
          L1_1 = false
        end
      end
    end
  end
end
if L1_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
