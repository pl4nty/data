local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_UEFISTREAM
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = true
L3_1(L4_1)
L3_1 = crypto
L3_1 = L3_1.Sha256Buffer
L4_1 = L2_1
L5_1 = 0
L6_1 = #L2_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = GetRollingQueueKeyValue
L5_1 = "UEFIFirmwareHashList"
L6_1 = L0_1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = GetRollingQueueCount
L6_1 = "UEFIFirmwareHashList"
L5_1 = L5_1(L6_1)
L6_1 = GetAtomicCounter
L7_1 = "UEFICloudCalls"
L6_1 = L6_1(L7_1)
if L4_1 ~= nil and L4_1 ~= L3_1 then
  L7_1 = {}
  L7_1.CONTENT_SOURCE = "UEFI_HASH_TRACKER"
  L7_1.TAG = "NOLOOKUP"
  L7_1.FilePath = L0_1
  L7_1.OldHash = L4_1
  L7_1.NewHash = L3_1
  L7_1.UEFIFirmwareHashListLength = L5_1
  L7_1.CloudCallCounter = L6_1
  if L6_1 == nil or L6_1 < 20 then
    L8_1 = AddToAtomicCounter
    L9_1 = "UEFICloudCalls"
    L10_1 = 1
    L11_1 = 86400
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = SafeGetUrlReputation
    L9_1 = {}
    L10_1 = "http://4205df77-0bd1-468b-8de8-dad939e44439.report"
    L9_1[1] = L10_1
    L10_1 = L7_1
    L11_1 = true
    L12_1 = 4000
    L13_1 = false
    L8_1(L9_1, L10_1, L11_1, L12_1, L13_1)
  end
end
L7_1 = AppendToRollingQueue
L8_1 = "UEFIFirmwareHashList"
L9_1 = L0_1
L10_1 = L3_1
L11_1 = 31104000
L12_1 = 1000
L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
L7_1 = GetRollingQueueKeyValue
L8_1 = "UEFIFirmwareHashListCachedData"
L9_1 = "ReportUEFIData"
L7_1 = L7_1(L8_1, L9_1)
if L7_1 ~= nil then
  L8_1 = {}
  L8_1.CONTENT_SOURCE = "UEFI_STATUS_REPORT"
  L8_1.TAG = "NOLOOKUP"
  L8_1.HashList = L7_1
  L8_1.UEFIFirmwareHashListLength = L5_1
  L8_1.CloudCallCounter = L6_1
  if L6_1 == nil or L6_1 < 20 then
    L9_1 = AppendToRollingQueue
    L10_1 = "UEFIFirmwareHashListCachedData"
    L11_1 = "ReportUEFIData"
    L12_1 = 0
    L13_1 = 1
    L14_1 = 10
    L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
    L9_1 = AddToAtomicCounter
    L10_1 = "UEFICloudCalls"
    L11_1 = 1
    L12_1 = 86400
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = SafeGetUrlReputation
    L10_1 = {}
    L11_1 = "http://4205df77-0bd1-468b-8de8-dad939e44439.report"
    L10_1[1] = L11_1
    L11_1 = L8_1
    L12_1 = true
    L13_1 = 4000
    L14_1 = false
    L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
