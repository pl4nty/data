local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exclusion:IsPotentialSideLoad.A"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isdll
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.isappcontainer
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.resource_only_dll
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.no_ep
    if not L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.dmg_entrypoint
      if not L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.dmg_not_executable_image
        if not L0_1 then
          L0_1 = peattributes
          L0_1 = L0_1.dmg_truncated
          if not L0_1 then
            goto lbl_44
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_44::
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_parent_filehandle
L0_1, L1_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = pcall
  L3_1 = mp
  L3_1 = L3_1.get_filesize_by_handle
  L4_1 = L1_1
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  _ = L3_1
  L0_1 = L2_1
  if L0_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = mp
L3_1 = L3_1.getfilename
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1()
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 1
L6_1 = 1
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= "c" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "program files"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "c:\\windows\\system32\\"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "c:\\windows\\syswow64\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "windows\\winsxs"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "c:\\$windows.~bt\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          goto lbl_137
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_137::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.len
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not (20 < L4_1) then
    goto lbl_156
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_156::
L4_1 = isFilenameInSideLoadIndicators
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 and L2_1 then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "BM_IsPotentialSideLoad_InvalidSigned"
  L5_1(L6_1)
  L5_1 = MpCommon
  L5_1 = L5_1.SetOriginalFileName
  L6_1 = L2_1
  L7_1 = "BM_IsPotentialSideLoad_InvalidSigned"
  L5_1(L6_1, L7_1)
  L5_1 = "IsPotentialSideLoad_InvalidSigned"
  L6_1 = AppendToRollingQueue
  L7_1 = L5_1
  L8_1 = L2_1
  L6_1(L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.INFECTED
if L4_1 == L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
else
  L5_1 = mp
  L5_1 = L5_1.LOWFI
  if L4_1 == L5_1 then
    L5_1 = mp
    L5_1 = L5_1.LOWFI
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
