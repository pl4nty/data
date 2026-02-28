local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == "winrar.exe" then
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if not (L2_1 < 4) then
      goto lbl_34
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_34::
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = "UdfExtractedByWinrar"
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.AppendPersistContext
    L6_1 = L2_1
    L7_1 = L3_1
    L8_1 = 100
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
else
  if L0_1 ~= "7z.exe" and L0_1 ~= "7za.exe" and L0_1 ~= "7zfm.exe" and L0_1 ~= "7zg.exe" then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "7z%d%d%d%d%-x64%.exe"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "7z%d%d%d%d%.exe"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        goto lbl_129
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.getfilename
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
  L1_1 = L1_1(L2_1)
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if not (L2_1 < 4) then
      goto lbl_99
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_99::
  L2_1 = MpCommon
  L2_1 = L2_1.PathToWin32Path
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = "UdfExtractedBy7zip"
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.AppendPersistContext
    L6_1 = L2_1
    L7_1 = L3_1
    L8_1 = 100
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "Lua:Context/UdfExtractedFromArchive"
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_129::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
