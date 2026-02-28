local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 4) then
    goto lbl_24
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_24::
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "outlookaddin"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "msip\\logs\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L3_1 = L0_1
    L2_1 = L0_1.find
    L4_1 = "logs\\debug\\archive\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_48
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
::lbl_48::
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "%.([^%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1.iso = true
L3_1.vhd = true
L3_1.vhdx = true
L3_1.ppkg = true
L3_1.sppkg = true
L3_1.img = true
L4_1 = {}
L4_1.xlsx = true
L4_1.xls = true
L4_1.xlsm = true
L4_1.xlsb = true
L4_1.xltx = true
L4_1.xltm = true
L4_1.xlam = true
L4_1.xla = true
L4_1.xlt = true
L4_1.docx = true
L4_1.doc = true
L4_1.docm = true
L4_1.dotm = true
L4_1.dotx = true
L4_1.ppam = true
L4_1.pptm = true
L4_1.ppsm = true
L4_1.potm = true
L4_1.pptx = true
L4_1.rtf = true
L4_1.one = true
L4_1[".onetoc2"] = true
L5_1 = {}
L5_1.zip = true
L5_1.rar = true
L5_1.r00 = true
L5_1["7z"] = true
L5_1.arj = true
L5_1.gz = true
L5_1.ace = true
L5_1.xz = true
L5_1.cab = true
L6_1 = 0
L7_1 = L3_1[L2_1]
if L7_1 then
  L6_1 = 1
else
  L7_1 = L4_1[L2_1]
  if L7_1 then
    L6_1 = 2
  else
    L7_1 = L5_1[L2_1]
    if L7_1 then
      L6_1 = 3
    else
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  end
end
L7_1 = nil
L8_1 = mp
L8_1 = L8_1.IOAVGetDownloadUrl
L8_1 = L8_1()
L9_1 = nil
L10_1 = nil
L11_1 = mp
L11_1 = L11_1.get_contextdata
L12_1 = mp
L12_1 = L12_1.CONTEXT_DATA_HAS_MOTW_ADS
L11_1 = L11_1(L12_1)
if L11_1 == true then
  L11_1 = pcall
  L12_1 = mp
  L12_1 = L12_1.GetMOTWHostUrl
  L11_1, L12_1 = L11_1(L12_1)
  L9_1 = L12_1
  _ = L11_1
  L11_1 = pcall
  L12_1 = mp
  L12_1 = L12_1.GetMOTWReferrerUrl
  L11_1, L12_1 = L11_1(L12_1)
  L10_1 = L12_1
  _ = L11_1
end
L11_1 = mp
L11_1 = L11_1.get_contextdata
L12_1 = mp
L12_1 = L12_1.CONTEXT_DATA_PROCESSNAME
L11_1 = L11_1(L12_1)
if L11_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L13_1 = L11_1
L12_1 = L11_1.lower
L12_1 = L12_1(L13_1)
L11_1 = L12_1
L12_1 = IsWebmailDownloadURL
L13_1 = L8_1
L12_1 = L12_1(L13_1)
if not L12_1 then
  L12_1 = IsWebmailDownloadURL
  L13_1 = L9_1
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    goto lbl_164
  end
end
L7_1 = "webmail"
goto lbl_206
::lbl_164::
L12_1 = IsCommonFileSharingURL
L13_1 = L8_1
L12_1 = L12_1(L13_1)
if not L12_1 then
  L12_1 = IsCommonFileSharingURL
  L13_1 = L9_1
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    goto lbl_176
  end
end
L7_1 = "linkinemail"
goto lbl_206
::lbl_176::
L12_1 = isOutlookProcess
L13_1 = L11_1
L12_1 = L12_1(L13_1)
if L12_1 then
  L7_1 = "emailclient"
else
  L12_1 = getCachePaths
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if L12_1 == nil then
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    return L13_1
  end
  L13_1 = pairs
  L14_1 = L12_1
  L13_1, L14_1, L15_1 = L13_1(L14_1)
  for L16_1, L17_1 in L13_1, L14_1, L15_1 do
    L19_1 = L0_1
    L18_1 = L0_1.find
    L20_1 = L17_1
    L21_1 = 1
    L22_1 = true
    L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1)
    if L18_1 ~= nil then
      L7_1 = "emailclient"
      break
    end
  end
end
::lbl_206::
if L7_1 == nil then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.get_contextdata
L13_1 = mp
L13_1 = L13_1.CONTEXT_DATA_PROCESSDEVICEPATH
L12_1 = L12_1(L13_1)
L13_1 = mp
L13_1 = L13_1.get_contextdata
L14_1 = mp
L14_1 = L14_1.CONTEXT_DATA_PROCESS_PPID
L13_1 = L13_1(L14_1)
L14_1 = MpCommon
L14_1 = L14_1.PathToWin32Path
L15_1 = L12_1
L14_1 = L14_1(L15_1)
L12_1 = L14_1
if L12_1 == nil or L13_1 == nil then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L15_1 = L12_1
L14_1 = L12_1.lower
L14_1 = L14_1(L15_1)
L12_1 = L14_1
L14_1 = L12_1
L15_1 = "\\"
L16_1 = L11_1
L14_1 = L14_1 .. L15_1 .. L16_1
L15_1 = MpCommon
L15_1 = L15_1.GetCurrentTimeT
L15_1 = L15_1()
L16_1 = 31536000
L17_1 = L0_1
L18_1 = "\\"
L19_1 = L1_1
L17_1 = L17_1 .. L18_1 .. L19_1
L18_1 = mp
L18_1 = L18_1.getfilesize
L18_1 = L18_1()
L19_1 = ""
if L6_1 == 1 then
  L20_1 = mp
  L20_1 = L20_1.set_mpattribute
  L21_1 = "BM_ISOsFromEmailsMotw"
  L20_1(L21_1)
elseif L6_1 == 2 then
  L20_1 = mp
  L20_1 = L20_1.get_mpattribute
  L21_1 = "MHSTR:MacroInside"
  L20_1 = L20_1(L21_1)
  if L20_1 then
    L20_1 = L19_1
    L21_1 = "HasMacros|"
    L19_1 = L20_1 .. L21_1
  end
  L20_1 = mp
  L20_1 = L20_1.set_mpattribute
  L21_1 = "BM_OfficeFromEmailMotw"
  L20_1(L21_1)
else
  L20_1 = mp
  L20_1 = L20_1.get_mpattribute
  L21_1 = "Lua:ZipEncrypted"
  L20_1 = L20_1(L21_1)
  if not L20_1 then
    L20_1 = mp
    L20_1 = L20_1.get_mpattribute
    L21_1 = "Lua:RarHasEncryptedFile"
    L20_1 = L20_1(L21_1)
    if not L20_1 then
      goto lbl_288
    end
  end
  L19_1 = "isEncrypted|"
  ::lbl_288::
  L20_1 = mp
  L20_1 = L20_1.set_mpattribute
  L21_1 = "BM_ArchivesFromEmailsMotw"
  L20_1(L21_1)
end
L20_1 = string
L20_1 = L20_1.format
L21_1 = "WARCH::ProcessImagePath=%s;ProcessPID=%s;timestamp=%s;FileName=%s;FileSize=%s;Source=%s;OriginalArtifactPath=%s;Referrer=%s;extra=%s"
L22_1 = L14_1
L23_1 = L13_1
L24_1 = L15_1
L25_1 = L17_1
L26_1 = L18_1
L27_1 = L7_1
L28_1 = L8_1 or L28_1
if not L8_1 then
  L28_1 = L9_1
end
L29_1 = L10_1
L30_1 = L19_1
L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
L21_1 = IsKeyInRollingQueue
L22_1 = "CC_filelist"
L23_1 = L17_1
L21_1 = L21_1(L22_1, L23_1)
if not L21_1 then
  L21_1 = AppendToRollingQueue
  L22_1 = "CC_filelist"
  L23_1 = L17_1
  L24_1 = L20_1
  L25_1 = L16_1
  L26_1 = 32
  L21_1(L22_1, L23_1, L24_1, L25_1, L26_1)
  L21_1 = mp
  L21_1 = L21_1.set_mpattribute
  L22_1 = string
  L22_1 = L22_1.format
  L23_1 = "MpInternal_researchdata=CC_Research=%s"
  L24_1 = L20_1
  L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L22_1(L23_1, L24_1)
  L21_1(L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
end
L21_1 = mp
L21_1 = L21_1.INFECTED
return L21_1
