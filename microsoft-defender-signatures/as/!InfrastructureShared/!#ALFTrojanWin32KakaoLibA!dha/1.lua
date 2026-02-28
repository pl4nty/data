local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = {}
L1_1 = "listcmdreplyfiles"
L2_1 = "deletecmdreplyfile"
L3_1 = "listcmdsendfiles"
L4_1 = "listdatafiles"
L5_1 = "deletedatafile"
L6_1 = "downloadloginbuffer"
L7_1 = "downloaddatafile"
L8_1 = "downloadcmdreplybuffer"
L9_1 = "initcloudcredential"
L10_1 = "getclouderrasstring"
L11_1 = "deletecmdfile"
L12_1 = "initdirsforlogin"
L13_1 = "listloginfiles"
L14_1 = "deleteloginfile"
L15_1 = "downloadcmdreplyfile"
L16_1 = "uploadcmdbuffer"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L0_1[6] = L6_1
L0_1[7] = L7_1
L0_1[8] = L8_1
L0_1[9] = L9_1
L0_1[10] = L10_1
L0_1[11] = L11_1
L0_1[12] = L12_1
L0_1[13] = L13_1
L0_1[14] = L14_1
L0_1[15] = L15_1
L0_1[16] = L16_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 512000 or 2097152 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = pe
L2_1 = L2_1.get_exports
L2_1, L3_1 = L2_1()
L4_1 = 0
if L2_1 < 50 or 80 < L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 1
L6_1 = L2_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = pe
  L9_1 = L9_1.mmap_string_rva
  L10_1 = L3_1[L8_1]
  L10_1 = L10_1.namerva
  L11_1 = 64
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= nil then
    L10_1 = ipairs
    L11_1 = L0_1
    L10_1, L11_1, L12_1 = L10_1(L11_1)
    for L13_1, L14_1 in L10_1, L11_1, L12_1 do
      L15_1 = string
      L15_1 = L15_1.match
      L16_1 = string
      L16_1 = L16_1.lower
      L17_1 = L9_1
      L16_1 = L16_1(L17_1)
      L17_1 = L14_1
      L15_1 = L15_1(L16_1, L17_1)
      if L15_1 then
        L4_1 = L4_1 + 1
      end
      if 10 < L4_1 then
        L15_1 = mp
        L15_1 = L15_1.INFECTED
        return L15_1
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
