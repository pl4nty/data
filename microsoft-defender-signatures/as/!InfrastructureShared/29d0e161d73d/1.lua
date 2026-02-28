local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 268435456 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "cache"
L3_1 = "-wal"
L4_1 = "\\temp\\"
L5_1 = ".tmp"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
if L2_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = contains
  L4_1 = L2_1
  L5_1 = L1_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = 16777216
if L0_1 < L3_1 then
  L3_1 = L0_1
end
L4_1 = mp
L4_1 = L4_1.BMSearchFile
L5_1 = 0
L6_1 = L3_1
L7_1 = "\243\160\129\168\243\160\129\180\243\160\129\180\243\160\129\176\243\160\129\179\243\160\128\175\243\160\128\175\144\000"
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 < 0 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = L4_1 - 80
if L5_1 < 0 then
  L5_1 = 0
end
L6_1 = 512
L7_1 = mp
L7_1 = L7_1.readprotection
L8_1 = false
L7_1(L8_1)
L7_1 = mp
L7_1 = L7_1.readfile
L8_1 = L5_1
L9_1 = L6_1
L7_1 = L7_1(L8_1, L9_1)
L8_1 = mp
L8_1 = L8_1.readprotection
L9_1 = true
L8_1(L9_1)
L8_1 = MpCommon
L8_1 = L8_1.Base64Encode
L9_1 = L7_1
L8_1 = L8_1(L9_1)
L9_1 = set_research_data
L10_1 = "EncodedBytes"
L11_1 = L8_1
L12_1 = false
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
