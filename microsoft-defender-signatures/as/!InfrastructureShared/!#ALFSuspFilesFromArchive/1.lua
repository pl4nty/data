local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.GetMOTWReferrerUrl
L0_1, L1_1 = L0_1(L1_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L1_1
L2_1 = L1_1.lower
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = StringStartsWith
L3_1 = L1_1
L4_1 = "http"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = StringStartsWith
  L3_1 = L1_1
  L4_1 = "www"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    goto lbl_32
  end
end
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "FileHasMotwReferrerUrl_web"
L2_1(L3_1)
goto lbl_149
::lbl_32::
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "FileHasMotwReferrerUrl_file"
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.get_mpattribute
L3_1 = "LUA:FileSizeGT500M.A"
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.getfilesize
    L2_1 = L2_1()
    L3_1 = sysio
    L3_1 = L3_1.GetFileSize
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L4_1 = 80
    if 0 < L3_1 then
      L5_1 = L2_1 / L3_1
      if L4_1 < L5_1 then
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:HighlyCompressedFileFromArchiveWithMotw"
        L5_1(L6_1)
        L5_1 = mp
        L5_1 = L5_1.get_contextdata
        L6_1 = mp
        L6_1 = L6_1.CONTEXT_DATA_PROCESSDEVICEPATH
        L5_1 = L5_1(L6_1)
        L6_1 = mp
        L6_1 = L6_1.get_contextdata
        L7_1 = mp
        L7_1 = L7_1.CONTEXT_DATA_PROCESS_PPID
        L6_1 = L6_1(L7_1)
        L7_1 = mp
        L7_1 = L7_1.get_contextdata
        L8_1 = mp
        L8_1 = L8_1.CONTEXT_DATA_PROCESSNAME
        L7_1 = L7_1(L8_1)
        L8_1 = mp
        L8_1 = L8_1.getfilename
        L9_1 = mp
        L9_1 = L9_1.bitor
        L10_1 = mp
        L10_1 = L10_1.FILEPATH_QUERY_FULL
        L11_1 = mp
        L11_1 = L11_1.FILEPATH_QUERY_LOWERCASE
        L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L9_1(L10_1, L11_1)
        L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
        if L5_1 ~= nil and L7_1 ~= nil and L6_1 ~= nil and L8_1 ~= nil then
          L9_1 = MpCommon
          L9_1 = L9_1.PathToWin32Path
          L10_1 = L5_1
          L9_1 = L9_1(L10_1)
          L10_1 = L9_1
          L9_1 = L9_1.lower
          L9_1 = L9_1(L10_1)
          L5_1 = L9_1
          L9_1 = MpCommon
          L9_1 = L9_1.GetCurrentTimeT
          L9_1 = L9_1()
          L10_1 = "EFMRU::ProcessImagePath="
          L11_1 = L5_1
          L12_1 = "\\"
          L14_1 = L7_1
          L13_1 = L7_1.lower
          L13_1 = L13_1(L14_1)
          L14_1 = ";pid="
          L15_1 = L6_1
          L16_1 = ";timestamp="
          L17_1 = L9_1
          L18_1 = ";FilePath="
          L19_1 = L8_1
          L20_1 = ";motwReferrerURL="
          L21_1 = L1_1
          L22_1 = ";ParentSize="
          L23_1 = L3_1
          L10_1 = L10_1 .. L11_1 .. L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1 .. L23_1
          L11_1 = mp
          L11_1 = L11_1.set_mpattribute
          L12_1 = string
          L12_1 = L12_1.format
          L13_1 = "MpInternal_researchdata=LargeFileData=%s"
          L14_1 = L10_1
          L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1 = L12_1(L13_1, L14_1)
          L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1)
          L11_1 = IsKeyInRollingQueue
          L12_1 = "CC_filelist"
          L13_1 = L1_1
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 then
            L11_1 = 31536000
            L12_1 = AppendToRollingQueue
            L13_1 = "CC_filelist"
            L14_1 = L8_1
            L15_1 = L10_1
            L16_1 = L11_1
            L17_1 = 32
            L12_1(L13_1, L14_1, L15_1, L16_1, L17_1)
          end
        end
        L9_1 = mp
        L9_1 = L9_1.INFECTED
        return L9_1
      end
    end
  end
end
::lbl_149::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
