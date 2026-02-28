local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
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
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = "winrar.exe"
L3_1 = "7zg.exe"
L4_1 = "7za.exe"
L5_1 = "7z.exe"
L6_1 = "winzip64.exe"
L7_1 = "winzip32.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESS_PPID
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsKeyValuePairInRollingQueue
L5_1 = "CC_filelist"
L6_1 = L3_1
L7_1 = L2_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not L4_1 then
  L4_1 = pcall
  L5_1 = mp
  L5_1 = L5_1.GetMOTWHostUrl
  L4_1, L5_1 = L4_1(L5_1)
  L6_1 = pcall
  L7_1 = mp
  L7_1 = L7_1.GetMOTWReferrerUrl
  L6_1, L7_1 = L6_1(L7_1)
  L8_1 = IsCommonFileSharingURL
  L9_1 = L5_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = IsWebmailDownloadURL
    L9_1 = L5_1
    L8_1 = L8_1(L9_1)
    if not L8_1 then
      L8_1 = IsWebmailDownloadURL
      L9_1 = L7_1
      L8_1 = L8_1(L9_1)
      if not L8_1 then
        goto lbl_89
      end
    end
  end
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  do return L8_1 end
  ::lbl_89::
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = ""
  end
  L9_1 = MpCommon
  L9_1 = L9_1.PathToWin32Path
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  L10_1 = L8_1
  L9_1 = L8_1.lower
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
  L9_1 = L8_1
  L10_1 = "\\"
  L11_1 = L0_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L10_1 = MpCommon
  L10_1 = L10_1.GetCurrentTimeT
  L10_1 = L10_1()
  L11_1 = 31536000
  L12_1 = mp
  L12_1 = L12_1.getfilesize
  L12_1 = L12_1()
  L13_1 = {}
  L13_1.type = "WARCH"
  L13_1.ProcessImagePath = L9_1
  L13_1.ProcessPID = L3_1
  L13_1.timestamp = L10_1
  L13_1.FileName = L2_1
  L13_1.FileSize = L12_1
  L14_1 = L5_1 or L14_1
  if not L5_1 then
    L14_1 = ""
  end
  L13_1.motwhosturl = L14_1
  L13_1.parent = ""
  L13_1.motwreferrerurl = ""
  L13_1.score = 1
  L14_1 = AppendToRollingQueue
  L15_1 = "CC_filelist"
  L16_1 = L2_1
  L17_1 = safeJsonSerialize
  L18_1 = L13_1
  L17_1 = L17_1(L18_1)
  L18_1 = L11_1
  L19_1 = 32
  L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
end
L4_1 = "ArchivesWithMotW"
L5_1 = IsKeyValuePairInRollingQueue
L6_1 = L4_1
L7_1 = L3_1
L8_1 = L2_1
L5_1 = L5_1(L6_1, L7_1, L8_1)
if not L5_1 then
  L5_1 = 600
  L6_1 = 32
  L7_1 = AppendToRollingQueue
  L8_1 = L4_1
  L9_1 = L3_1
  L10_1 = L2_1
  L11_1 = L5_1
  L12_1 = L6_1
  L13_1 = 0
  L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpDisableCaching"
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
