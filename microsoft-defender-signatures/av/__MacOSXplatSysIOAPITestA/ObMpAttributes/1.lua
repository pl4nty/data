local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= "/private/tmp/0c02a078-ea6f-4635-b4c5-be81241d7bb9-sysiotestfile-1.txt" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.IsFileExists
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.IsFolderExists
L2_1 = "/tmp"
L1_1 = L1_1(L2_1)
if L1_1 ~= true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = sysio
L1_1 = L1_1.GetFileSize
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 < 10 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.ReadFile
L3_1 = L0_1
L4_1 = 0
L5_1 = L1_1
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "0123456789"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 ~= nil then
    goto lbl_58
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_58::
L3_1 = sysio
L3_1 = L3_1.GetFileAttributes
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.bitand
  L5_1 = L3_1
  L6_1 = 61440
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == 32768 then
    goto lbl_74
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_74::
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
