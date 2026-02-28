local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:LNK_Settings!RunMinimized"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:LastFolderCount!0"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "InArchiveFile"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "Lua:LNK_Settings!HasArguments"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.get_mpattribute
        L1_1 = "Lua:LNK_Settings!HasIconLocation"
        L0_1 = L0_1(L1_1)
        if not L0_1 then
          goto lbl_119
        end
      end
    end
  end
  L0_1 = mp
  L0_1 = L0_1.getfilename
  L1_1 = mp
  L1_1 = L1_1.bitor
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_FULL
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
  L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L1_1(L2_1, L3_1)
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
  if L0_1 == nil then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.GetLnkInfo
  L1_1, L2_1 = L1_1(L2_1)
  if L1_1 == false or L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = L2_1.Arguments
  if not L3_1 then
    L3_1 = ""
  end
  L4_1 = L2_1.BasePath
  if not L4_1 then
    L4_1 = ""
  end
  L5_1 = L2_1.RelativePath
  if not L5_1 then
    L5_1 = ""
  end
  L6_1 = L2_1.IconLocation
  if not L6_1 then
    L6_1 = ""
  end
  L7_1 = L2_1.IconIndex
  if not L7_1 then
    L7_1 = ""
  end
  L8_1 = L2_1.IDLISTTarget
  if not L8_1 then
    L8_1 = ""
  end
  if (L3_1 ~= "" or L5_1 ~= "") and (L7_1 ~= "" or L6_1 ~= "") then
    L9_1 = MpCommon
    L9_1 = L9_1.GetMountedFileBackingFilePath
    L10_1 = L0_1
    L9_1 = L9_1(L10_1)
    if not L9_1 then
      L9_1 = ""
    end
    L10_1 = string
    L10_1 = L10_1.format
    L11_1 = "path=%s;iconIndex=%s;iconLocation=%s;args=%s;relativePath=%s;absolutePath=%s;backing=%s;idtarget=%s"
    L12_1 = L0_1
    L13_1 = L7_1
    L14_1 = L6_1
    L15_1 = L3_1
    L16_1 = L5_1
    L17_1 = L4_1
    L18_1 = L9_1
    L19_1 = L8_1
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = string
    L12_1 = L12_1.format
    L13_1 = "MpInternal_researchdata=LnkData=%s"
    L14_1 = L10_1
    L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L12_1(L13_1, L14_1)
    L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
::lbl_119::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
