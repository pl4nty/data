local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L1_1 = isnull
L2_1 = this_sigattrlog
L2_1 = L2_1[14]
L2_1 = L2_1.utf8p1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[14]
  L0_1 = L1_1.utf8p1
else
  L1_1 = isnull
  L2_1 = this_sigattrlog
  L2_1 = L2_1[15]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[15]
    L0_1 = L1_1.utf8p1
  else
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L4_1 = "c:"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    goto lbl_50
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_50::
L2_1 = GetRollingQueueKeyValue
L3_1 = "PotentialSideLoadExports"
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L1_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L4_1(L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "ExpCount=(%d+)__FwdExpCount=(%d+)__LocalExpCount=(%d+)__ExpType=(.-)%.(.-)=(.-)__FwdExpNames=(.-)__LocalExpNames=(.-)__Size=(%d+)"
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1, L5_1)
L12_1 = isnull
L13_1 = L8_1
L12_1 = L12_1(L13_1)
if L12_1 or L8_1 == "FailedExtraction" then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = {}
L12_1["msvcp140.dll"] = true
L12_1["msvcrt.dll"] = true
L12_1["ucrtbase.dll"] = true
L12_1["vcruntime140.dll"] = true
L12_1["vcruntime140_1.dll"] = true
L13_1 = string
L13_1 = L13_1.lower
L14_1 = L8_1
L13_1 = L13_1(L14_1)
L13_1 = L12_1[L13_1]
if L13_1 then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = string
L13_1 = L13_1.lower
L14_1 = L8_1
L13_1 = L13_1(L14_1)
if L13_1 == "libomp.dll" then
  L13_1 = string
  L13_1 = L13_1.find
  L14_1 = string
  L14_1 = L14_1.lower
  L15_1 = L1_1
  L14_1 = L14_1(L15_1)
  L15_1 = "libiomp5md.dll$"
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
end
L13_1 = bm
L13_1 = L13_1.get_imagepath
L13_1 = L13_1()
L14_1 = isnull
L15_1 = L13_1
L14_1 = L14_1(L15_1)
if L14_1 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = MpCommon
L14_1 = L14_1.PathToWin32Path
L15_1 = L13_1
L14_1 = L14_1(L15_1)
L13_1 = L14_1
L14_1 = isnull
L15_1 = L13_1
L14_1 = L14_1(L15_1)
if L14_1 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = mp
L14_1 = L14_1.ContextualExpandEnvironmentVariables
L15_1 = L13_1
L14_1 = L14_1(L15_1)
L13_1 = L14_1
L14_1 = isnull
L15_1 = L13_1
L14_1 = L14_1(L15_1)
if not L14_1 then
  L14_1 = mp
  L14_1 = L14_1.IsKnownFriendlyFile
  L15_1 = L13_1
  L16_1 = true
  L17_1 = false
  L14_1 = L14_1(L15_1, L16_1, L17_1)
  if L14_1 then
    goto lbl_158
  end
end
L14_1 = mp
L14_1 = L14_1.CLEAN
do return L14_1 end
::lbl_158::
L15_1 = L1_1
L14_1 = L1_1.match
L16_1 = "^(.+)\\"
L14_1 = L14_1(L15_1, L16_1)
L16_1 = L13_1
L15_1 = L13_1.match
L17_1 = "^(.+)\\"
L15_1 = L15_1(L16_1, L17_1)
if L14_1 and L15_1 then
  L16_1 = string
  L16_1 = L16_1.find
  L17_1 = string
  L17_1 = L17_1.lower
  L18_1 = L14_1
  L17_1 = L17_1(L18_1)
  L18_1 = string
  L18_1 = L18_1.lower
  L19_1 = L15_1
  L18_1 = L18_1(L19_1)
  L19_1 = 1
  L20_1 = true
  L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
  if L16_1 then
    goto lbl_186
  end
end
L16_1 = mp
L16_1 = L16_1.CLEAN
do return L16_1 end
::lbl_186::
L16_1 = nil
L17_1 = string
L17_1 = L17_1.find
L18_1 = L8_1
L19_1 = ":"
L20_1 = 1
L21_1 = true
L17_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
if L17_1 then
  L17_1 = MpCommon
  L17_1 = L17_1.PathToWin32Path
  L18_1 = L8_1
  L17_1 = L17_1(L18_1)
  L16_1 = L17_1
else
  L17_1 = L14_1
  L18_1 = "\\"
  L19_1 = L8_1
  L16_1 = L17_1 .. L18_1 .. L19_1
end
L17_1 = isnull
L18_1 = L16_1
L17_1 = L17_1(L18_1)
if not L17_1 then
  L17_1 = sysio
  L17_1 = L17_1.IsFileExists
  L18_1 = L16_1
  L17_1 = L17_1(L18_1)
  if L17_1 then
    goto lbl_220
  end
end
L17_1 = mp
L17_1 = L17_1.CLEAN
do return L17_1 end
::lbl_220::
L17_1 = 900
L18_1 = MpCommon
L18_1 = L18_1.GetCurrentTimeT
L18_1 = L18_1()
L19_1 = isnull
L20_1 = L18_1
L19_1 = L19_1(L20_1)
if L19_1 or L18_1 == 0 then
  L19_1 = mp
  L19_1 = L19_1.CLEAN
  return L19_1
end
L19_1 = sysio
L19_1 = L19_1.GetFileLastWriteTime
L20_1 = L13_1
L19_1 = L19_1(L20_1)
L20_1 = isnull
L21_1 = L19_1
L20_1 = L20_1(L21_1)
if L20_1 or L19_1 == 0 then
  L20_1 = mp
  L20_1 = L20_1.CLEAN
  return L20_1
end
L20_1 = sysio
L20_1 = L20_1.GetFileLastWriteTime
L21_1 = L1_1
L20_1 = L20_1(L21_1)
L21_1 = isnull
L22_1 = L20_1
L21_1 = L21_1(L22_1)
if L21_1 or L20_1 == 0 then
  L21_1 = mp
  L21_1 = L21_1.CLEAN
  return L21_1
end
L21_1 = L20_1 / 10000000
L21_1 = L18_1 - L21_1
L21_1 = L21_1 - 11644473600
if L17_1 < L21_1 then
  L21_1 = mp
  L21_1 = L21_1.CLEAN
  return L21_1
end
L21_1 = sysio
L21_1 = L21_1.GetFileAttributes
L22_1 = L1_1
L21_1 = L21_1(L22_1)
L22_1 = L21_1 ~= 4294967295
L23_1 = bm
L23_1 = L23_1.add_related_file
L24_1 = L1_1
L23_1(L24_1)
L23_1 = bm
L23_1 = L23_1.add_related_file
L24_1 = L16_1
L23_1(L24_1)
L23_1 = safeJsonSerialize
L24_1 = {}
L24_1.Process = L13_1
L24_1.DLL = L1_1
L24_1.DLLHidden = L22_1
L24_1.ProcessCreateTime = L19_1
L24_1.DLLCreateTime = L20_1
L24_1.CurrentTime = L18_1
L24_1.DLLSize = L11_1
L24_1.FwdDLL = L16_1
L24_1.ExpCount = L3_1
L24_1.FwdExpCount = L4_1
L24_1.LocalExpCount = L5_1
L24_1.FwdType = L6_1
L24_1.FwdStatus = L7_1
L24_1.FwdExp = L9_1
L24_1.LocalExp = L10_1
L23_1 = L23_1(L24_1)
L24_1 = bm
L24_1 = L24_1.add_related_string
L25_1 = "PotentialSideload_Metadata"
L26_1 = L23_1
L27_1 = bm
L27_1 = L27_1.RelatedStringBMReport
L24_1(L25_1, L26_1, L27_1)
L24_1 = mp
L24_1 = L24_1.INFECTED
return L24_1
