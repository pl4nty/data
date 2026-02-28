local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 4) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.GetMountedFileBackingFilePath
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.ReportLowfi
L4_1 = L2_1
L5_1 = 2536803289
L3_1(L4_1, L5_1)
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILE_ATTRIBUTES
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.bitand
L5_1 = L3_1
L6_1 = 2
L4_1 = L4_1(L5_1, L6_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_PROCESSDEVICEPATH
L6_1, L7_1, L8_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L4_1 == 0 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Context/DllOnFileBackedMountedDrive"
  L6_1(L7_1)
  L7_1 = L5_1
  L6_1 = L5_1.find
  L8_1 = "^\\device\\cdrom"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/MaybeDllSideLoadingOnFileBackedMountedDrive"
    L6_1(L7_1)
  end
else
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "Lua:Context/HiddenDllOnFileBackedMountedDrive"
  L6_1(L7_1)
  L7_1 = L5_1
  L6_1 = L5_1.find
  L8_1 = "^\\device\\cdrom"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = "Lua:Context/MaybeHiddenDllSideLoadingOnFileBackedMountedDrive"
    L6_1(L7_1)
  end
end
L6_1 = MpCommon
L6_1 = L6_1.QueryPersistContext
L7_1 = L2_1
L8_1 = "UdfExtractedBy7zip"
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContext
  L7_1 = L2_1
  L8_1 = "UdfExtractedByWinrar"
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    goto lbl_105
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "Lua:Context/DllonFileBackedMountedDriveFromArchive"
L6_1(L7_1)
::lbl_105::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
