local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
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
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
if L1_1 == nil or L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = IsKeyInRollingQueue
  L4_1 = "ArchivesWithMotW"
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_39
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_39::
L3_1 = "FilesFromArchiveswithMotw"
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L0_1
L6_1 = "\\"
L7_1 = L1_1
L5_1 = L5_1 .. L6_1 .. L7_1
L4_1 = L4_1(L5_1)
L5_1 = IsKeyInRollingQueue
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = GetRollingQueueKeyValues
L6_1 = "ArchivesWithMotW"
L7_1 = L2_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = nil
L7_1 = ipairs
L8_1 = L5_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = L11_1.value
  L13_1 = L12_1
  L12_1 = L12_1.match
  L14_1 = "([^\\]+)%."
  L12_1 = L12_1(L13_1, L14_1)
  L14_1 = L0_1
  L13_1 = L0_1.find
  L15_1 = L12_1
  L16_1 = 1
  L17_1 = true
  L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
  if L13_1 ~= nil then
    L6_1 = L11_1.value
    break
  end
end
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = 600
L8_1 = AppendToRollingQueue
L9_1 = L3_1
L10_1 = L4_1
L11_1 = L6_1
L12_1 = L7_1
L13_1 = 32
L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
L8_1 = IsKeyInRollingQueue
L9_1 = "CC_filelist"
L10_1 = L6_1
L8_1 = L8_1(L9_1, L10_1)
if L8_1 then
  L8_1 = pcall
  L9_1 = mp
  L9_1 = L9_1.GetMOTWHostUrl
  L8_1, L9_1 = L8_1(L9_1)
  L10_1 = pcall
  L11_1 = mp
  L11_1 = L11_1.GetMOTWReferrerUrl
  L10_1, L11_1 = L10_1(L11_1)
  L12_1 = mp
  L12_1 = L12_1.get_contextdata
  L13_1 = mp
  L13_1 = L13_1.CONTEXT_DATA_PROCESSDEVICEPATH
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    L12_1 = ""
  end
  L13_1 = mp
  L13_1 = L13_1.get_contextdata
  L14_1 = mp
  L14_1 = L14_1.CONTEXT_DATA_PROCESSNAME
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L13_1 = ""
  end
  L14_1 = MpCommon
  L14_1 = L14_1.PathToWin32Path
  L15_1 = L12_1
  L14_1 = L14_1(L15_1)
  L12_1 = L14_1
  L15_1 = L12_1
  L14_1 = L12_1.lower
  L14_1 = L14_1(L15_1)
  L12_1 = L14_1
  L15_1 = L13_1
  L14_1 = L13_1.lower
  L14_1 = L14_1(L15_1)
  L13_1 = L14_1
  L14_1 = L12_1
  L15_1 = "\\"
  L16_1 = L13_1
  L14_1 = L14_1 .. L15_1 .. L16_1
  L15_1 = MpCommon
  L15_1 = L15_1.GetCurrentTimeT
  L15_1 = L15_1()
  L16_1 = 31536000
  L17_1 = mp
  L17_1 = L17_1.getfilesize
  L17_1 = L17_1()
  L18_1 = {}
  L18_1.type = "EFMRU"
  L18_1.ProcessImagePath = L14_1
  L18_1.ProcessPID = L2_1
  L18_1.timestamp = L15_1
  L18_1.FileName = L4_1
  L18_1.FileSize = L17_1
  L19_1 = L9_1 or L19_1
  if not L9_1 then
    L19_1 = ""
  end
  L18_1.motwhosturl = L19_1
  L18_1.parent = L6_1
  L19_1 = L11_1 or L19_1
  if not L11_1 then
    L19_1 = ""
  end
  L18_1.motwreferrerurl = L19_1
  L18_1.score = 1
  L19_1 = mp
  L19_1 = L19_1.set_mpattribute
  L20_1 = "BM_FilesFromArchivesWithMotw"
  L19_1(L20_1)
  L19_1 = AppendToRollingQueue
  L20_1 = "CC_filelist"
  L21_1 = L4_1
  L22_1 = safeJsonSerialize
  L23_1 = L18_1
  L22_1 = L22_1(L23_1)
  L23_1 = L16_1
  L24_1 = 32
  L19_1(L20_1, L21_1, L22_1, L23_1, L24_1)
end
L8_1 = mp
L8_1 = L8_1.set_mpattribute
L9_1 = "MpDisableCaching"
L8_1(L9_1)
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
