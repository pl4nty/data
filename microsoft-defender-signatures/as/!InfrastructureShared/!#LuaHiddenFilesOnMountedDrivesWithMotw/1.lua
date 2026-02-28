local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L2_1 = #L0_1
  if not (2 < L2_1) and L1_1 ~= nil then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = L0_1
L3_1 = "\\"
L4_1 = L1_1
L2_1 = L2_1 .. L3_1 .. L4_1
L3_1 = MpCommon
L3_1 = L3_1.GetMountedFileBackingFilePath
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsKeyInRollingQueue
L5_1 = "CC_filelist"
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = sysio
  L4_1 = L4_1.GetFileAttributes
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L5_1 = mp
  L5_1 = L5_1.bitand
  L6_1 = L4_1
  L7_1 = 2
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == 2 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
