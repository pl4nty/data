local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L0_1 = mp
L0_1 = L0_1.GetCertificateInfo
L0_1 = L0_1()
L1_1 = pairs
L2_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.Signers
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L1_1 = pcall
L2_1 = mp
L2_1 = L2_1.get_parent_filehandle
L1_1, L2_1 = L1_1(L2_1)
if L1_1 then
  L3_1 = pcall
  L4_1 = mp
  L4_1 = L4_1.get_filesize_by_handle
  L5_1 = L2_1
  L3_1, L4_1 = L3_1(L4_1, L5_1)
  _ = L4_1
  L1_1 = L3_1
  if L1_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L3_1
L6_1 = 1
L7_1 = 1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 ~= "c" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "program files"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == nil then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "c:\\windows\\system32\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "c:\\windows\\syswow64\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "windows\\winsxs"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 == nil then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = "c:\\$windows.~bt\\"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 == nil then
          goto lbl_152
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_152::
L4_1 = string
L4_1 = L4_1.lower
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
if L4_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not (23 < L5_1) then
    goto lbl_171
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_171::
L5_1 = isFilenameInSideLoadIndicators
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 and L3_1 then
  L6_1 = mp
  L6_1 = L6_1.set_mpattribute
  L7_1 = "BM_IsPotentialSideLoad"
  L6_1(L7_1)
  L6_1 = MpCommon
  L6_1 = L6_1.SetOriginalFileName
  L7_1 = L3_1
  L8_1 = "BM_IsPotentialSideLoad"
  L6_1(L7_1, L8_1)
  L6_1 = "IsPotentialSideLoad"
  L7_1 = AppendToRollingQueue
  L8_1 = L6_1
  L9_1 = L3_1
  L7_1(L8_1, L9_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
if L5_1 == L6_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
else
  L6_1 = mp
  L6_1 = L6_1.LOWFI
  if L5_1 == L6_1 then
    L6_1 = mp
    L6_1 = L6_1.LOWFI
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
