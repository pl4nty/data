local L0_1, L1_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2
  L5_2 = 60
  L6_2 = 300
  L7_2 = nil
  L8_2 = 500
  L9_2 = {}
  L10_2 = {}
  L9_2.Processed = L10_2
  L10_2 = {}
  L9_2.FolderEnumeration = L10_2
  L10_2 = {}
  L9_2.ScanPath = L10_2
  L10_2 = {}
  L9_2.FullFilePathScan = L10_2
  L10_2 = {}
  L9_2.RegkeyEnumeration = L10_2
  L10_2 = {}
  L9_2.DeleteRegValue = L10_2
  L10_2 = {}
  L10_2.SIG_CONTEXT = "LUA_GENERIC"
  L10_2.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  L10_2.TAG = "NOLOOKUP"
  L11_2 = {}
  L13_2 = A0_2
  L12_2 = A0_2.gmatch
  L14_2 = "[^%+][^%+]+"
  L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)
  for L15_2 in L12_2, L13_2, L14_2 do
    L17_2 = L15_2
    L16_2 = L15_2.match
    L18_2 = "(.+)::(.+)"
    L16_2, L17_2 = L16_2(L17_2, L18_2)
    if L16_2 and L17_2 then
      L11_2[L16_2] = L17_2
    end
  end
  L12_2 = {}
  L13_2 = L11_2
  L14_2 = pairs
  L15_2 = L13_2
  L14_2, L15_2, L16_2 = L14_2(L15_2)
  for L17_2, L18_2 in L14_2, L15_2, L16_2 do
    L19_2 = L17_2
    L20_2 = L18_2
    L12_2[L19_2] = L20_2
  end
  L14_2 = L12_2.tracking_id
  if L14_2 then
    L7_2 = L12_2.tracking_id
  end
  if L7_2 == nil then
    L7_2 = "10000000-0000-ffff-0000-000000000001"
  end
  L14_2 = table
  L14_2 = L14_2.insert
  L15_2 = L9_2.Processed
  L16_2 = {}
  L16_2.TrackingId = L7_2
  L14_2(L15_2, L16_2)
  L14_2 = L12_2.ttl
  if L14_2 then
    L6_2 = L12_2.ttl
    L14_2 = table
    L14_2 = L14_2.insert
    L15_2 = L9_2.Processed
    L16_2 = {}
    L16_2.Ttl = L6_2
    L14_2(L15_2, L16_2)
  end
  L14_2 = L12_2.suppress_ttl
  if L14_2 then
    L5_2 = L12_2.suppress_ttl
    L14_2 = table
    L14_2 = L14_2.insert
    L15_2 = L9_2.Processed
    L16_2 = {}
    L16_2.suppress_ttl = L5_2
    L14_2(L15_2, L16_2)
  end
  L14_2 = MpCommon
  L14_2 = L14_2.AtomicCounterValueNamespaced
  L15_2 = A3_2
  L16_2 = A2_2
  L14_2 = L14_2(L15_2, L16_2)
  if L14_2 == nil then
    L15_2 = MpCommon
    L15_2 = L15_2.AtomicCounterSetNamespaced
    L16_2 = A3_2
    L17_2 = A2_2
    L18_2 = 0
    L19_2 = L5_2
    L15_2(L16_2, L17_2, L18_2, L19_2)
  end
  L15_2 = L12_2.maxscan
  if L15_2 then
    L15_2 = tonumber
    L16_2 = L12_2.maxscan
    L15_2 = L15_2(L16_2)
    L8_2 = L15_2 or L8_2
    if not L15_2 then
      L8_2 = 500
    end
    L15_2 = MpCommon
    L15_2 = L15_2.AtomicCounterValueNamespaced
    L16_2 = A4_2
    L17_2 = A2_2
    L15_2 = L15_2(L16_2, L17_2)
    if L15_2 == nil then
      L16_2 = MpCommon
      L16_2 = L16_2.AtomicCounterSetNamespaced
      L17_2 = A4_2
      L18_2 = A2_2
      L19_2 = L8_2
      L20_2 = L6_2
      L16_2(L17_2, L18_2, L19_2, L20_2)
    else
      L16_2 = MpCommon
      L16_2 = L16_2.AtomicCounterSubNamespaced
      L17_2 = A4_2
      L18_2 = A2_2
      L19_2 = L15_2
      L16_2(L17_2, L18_2, L19_2)
      L16_2 = MpCommon
      L16_2 = L16_2.AtomicCounterAddNamespaced
      L17_2 = A4_2
      L18_2 = A2_2
      L19_2 = L8_2
      L16_2(L17_2, L18_2, L19_2)
    end
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L9_2.Processed
    L18_2 = {}
    L18_2.max_scan = L8_2
    L16_2(L17_2, L18_2)
  end
  L15_2 = L12_2.scanpath
  if L15_2 then
    L15_2 = L12_2.scanpath
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = string
      L22_2 = L22_2.lower
      L23_2 = MpCommon
      L23_2 = L23_2.Base64Decode
      L24_2 = L21_2
      L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L23_2(L24_2)
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      L23_2 = table
      L23_2 = L23_2.insert
      L24_2 = L9_2.Processed
      L25_2 = {}
      L25_2.scanpath = L22_2
      L23_2(L24_2, L25_2)
      L23_2 = AppendToRollingQueueNamespaced
      L24_2 = "hmdprecisionpulsefolderscan"
      L25_2 = A2_2
      L26_2 = L22_2
      L27_2 = 1
      L28_2 = L6_2
      L29_2 = 500
      L30_2 = 1
      L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
      L23_2 = mp
      L23_2 = L23_2.TriggerScanResource
      L24_2 = "folder"
      L25_2 = L22_2
      L26_2 = 0
      L27_2 = 5000
      L23_2(L24_2, L25_2, L26_2, L27_2)
      L23_2 = L9_2.ScanPath
      L24_2 = {}
      L23_2[L22_2] = L24_2
      L23_2 = table
      L23_2 = L23_2.insert
      L24_2 = L9_2.Processed
      L25_2 = {}
      L25_2.scanpath = L22_2
      L23_2(L24_2, L25_2)
      L23_2 = sysio
      L23_2 = L23_2.IsFolderExists
      L24_2 = L22_2
      L23_2 = L23_2(L24_2)
      if L23_2 then
        L24_2 = L9_2.ScanPath
        L24_2 = L24_2[L22_2]
        L24_2.Exists = true
        L24_2 = L9_2.ScanPath
        L24_2 = L24_2[L22_2]
        L25_2 = sysio
        L25_2 = L25_2.IsPathAVExcluded
        L26_2 = L22_2
        L27_2 = true
        L25_2 = L25_2(L26_2, L27_2)
        L24_2.Excluded = L25_2
      else
        L24_2 = L9_2.ScanPath
        L24_2 = L24_2[L22_2]
        L24_2.Exists = false
      end
    end
  end
  L15_2 = L12_2.fullfilepathscan
  if L15_2 then
    L15_2 = L12_2.fullfilepathscan
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = string
      L22_2 = L22_2.lower
      L23_2 = MpCommon
      L23_2 = L23_2.Base64Decode
      L24_2 = L21_2
      L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L23_2(L24_2)
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      L23_2 = sysio
      L23_2 = L23_2.IsFileExists
      L24_2 = L22_2
      L23_2 = L23_2(L24_2)
      L24_2 = table
      L24_2 = L24_2.insert
      L25_2 = L9_2.Processed
      L26_2 = {}
      L26_2.fullfilepathscan = L22_2
      L24_2(L25_2, L26_2)
      L24_2 = L9_2.FullFilePathScan
      L25_2 = {}
      L24_2[L22_2] = L25_2
      if L23_2 then
        L24_2 = string
        L24_2 = L24_2.match
        L25_2 = L22_2
        L26_2 = "(.-)[\\/][^\\/]*$"
        L24_2 = L24_2(L25_2, L26_2)
        L25_2 = L9_2.FullFilePathScan
        L25_2 = L25_2[L22_2]
        L25_2.Exists = true
        L25_2 = L9_2.FullFilePathScan
        L25_2 = L25_2[L22_2]
        L26_2 = sysio
        L26_2 = L26_2.IsPathAVExcluded
        L27_2 = L24_2
        L28_2 = true
        L26_2 = L26_2(L27_2, L28_2)
        L25_2.Excluded = L26_2
      else
        L24_2 = L9_2.FullFilePathScan
        L24_2 = L24_2[L22_2]
        L24_2.Exists = false
      end
      L24_2 = pcallEx
      L25_2 = "AppendToRollingQueueNamespaced"
      L26_2 = AppendToRollingQueueNamespaced
      L27_2 = "hmdprecisionpulsefullfilepathscan"
      L28_2 = A2_2
      L29_2 = L22_2
      L30_2 = 1
      L31_2 = L6_2
      L32_2 = 500
      L33_2 = 1
      L24_2, L25_2 = L24_2(L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2)
      if not L24_2 then
        L26_2 = GetRollingQueueKeys
        L27_2 = "LuaError"
        L26_2 = L26_2(L27_2)
        if L26_2 then
          L27_2 = type
          L28_2 = L26_2
          L27_2 = L27_2(L28_2)
          if L27_2 == "table" then
            L27_2 = L9_2.FullFilePathScan
            L27_2 = L27_2[L22_2]
            L28_2 = safeJsonSerialize
            L29_2 = L26_2
            L30_2 = 260
            L28_2 = L28_2(L29_2, L30_2)
            L27_2.RQErrors = L28_2
          end
        end
      end
      L26_2 = mp
      L26_2 = L26_2.TriggerScanResource
      L27_2 = "file"
      L28_2 = L22_2
      L29_2 = 0
      L30_2 = 5000
      L26_2(L27_2, L28_2, L29_2, L30_2)
    end
  end
  L15_2 = L12_2.scanfile
  if L15_2 then
    L15_2 = L12_2.scanfile
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = string
      L22_2 = L22_2.lower
      L23_2 = MpCommon
      L23_2 = L23_2.Base64Decode
      L24_2 = L21_2
      L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L23_2(L24_2)
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      L23_2 = table
      L23_2 = L23_2.insert
      L24_2 = L9_2.Processed
      L25_2 = {}
      L25_2.scanfile = L22_2
      L23_2(L24_2, L25_2)
      L23_2 = AppendToRollingQueueNamespaced
      L24_2 = "hmdprecisionpulsescanfile"
      L25_2 = A2_2
      L26_2 = L22_2
      L27_2 = 1
      L28_2 = L6_2
      L29_2 = 500
      L30_2 = 1
      L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
    end
  end
  L15_2 = L12_2.enumeratefolder
  if L15_2 then
    L15_2 = ""
    L16_2 = "*"
    L17_2 = 0
    L18_2 = true
    L19_2 = false
    L20_2 = L12_2.enumeratefolder
    L21_2 = split
    L22_2 = L20_2
    L23_2 = ","
    L21_2 = L21_2(L22_2, L23_2)
    L22_2 = ipairs
    L23_2 = L21_2
    L22_2, L23_2, L24_2 = L22_2(L23_2)
    for L25_2, L26_2 in L22_2, L23_2, L24_2 do
      L27_2 = string
      L27_2 = L27_2.lower
      L28_2 = MpCommon
      L28_2 = L28_2.Base64Decode
      L29_2 = L26_2
      L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L28_2(L29_2)
      L27_2 = L27_2(L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      L28_2 = explode
      L29_2 = L27_2
      L30_2 = "|"
      L28_2 = L28_2(L29_2, L30_2)
      L29_2 = #L28_2
      if L29_2 == 4 then
        L15_2 = L28_2[1]
        L16_2 = L28_2[2]
        L29_2 = tonumber
        L30_2 = L28_2[3]
        L29_2 = L29_2(L30_2)
        L17_2 = L29_2 or L17_2
        if not L29_2 then
          L17_2 = 0
        end
        L29_2 = tonumber
        L30_2 = L28_2[4]
        L29_2 = L29_2(L30_2)
        L18_2 = L29_2 == 1
      else
        L29_2 = #L28_2
        if L29_2 == 5 then
          L15_2 = L28_2[1]
          L16_2 = L28_2[2]
          L29_2 = tonumber
          L30_2 = L28_2[3]
          L29_2 = L29_2(L30_2)
          L17_2 = L29_2 or L17_2
          if not L29_2 then
            L17_2 = 0
          end
          L29_2 = tonumber
          L30_2 = L28_2[4]
          L29_2 = L29_2(L30_2)
          L18_2 = L29_2 == 1
          L29_2 = tonumber
          L30_2 = L28_2[5]
          L29_2 = L29_2(L30_2)
          L19_2 = L29_2 == 1
        else
          L15_2 = L28_2[1]
        end
      end
      if L15_2 ~= nil then
        L29_2 = #L15_2
        L29_2 = L29_2 + 2
        L30_2 = L9_2.FolderEnumeration
        L31_2 = {}
        L30_2[L15_2] = L31_2
        L30_2 = L9_2.FolderEnumeration
        L30_2 = L30_2[L15_2]
        L31_2 = {}
        L30_2.Files = L31_2
        L30_2 = L9_2.FolderEnumeration
        L30_2 = L30_2[L15_2]
        L31_2 = {}
        L30_2.Subfolders = L31_2
        L30_2 = sysio
        L30_2 = L30_2.FindFiles
        L31_2 = L15_2
        L32_2 = L16_2
        L33_2 = L17_2
        L30_2 = L30_2(L31_2, L32_2, L33_2)
        L31_2 = sysio
        L31_2 = L31_2.FindFolders
        L32_2 = L15_2
        L33_2 = "*"
        L34_2 = 0
        L31_2 = L31_2(L32_2, L33_2, L34_2)
        if L30_2 ~= nil then
          L32_2 = pairs
          L33_2 = L30_2
          L32_2, L33_2, L34_2 = L32_2(L33_2)
          for L35_2, L36_2 in L32_2, L33_2, L34_2 do
            L37_2 = string
            L37_2 = L37_2.sub
            L38_2 = L36_2
            L39_2 = L29_2
            L37_2 = L37_2(L38_2, L39_2)
            if L19_2 then
              L38_2 = sysio
              L38_2 = L38_2.GetFileSize
              L39_2 = L36_2
              L38_2 = L38_2(L39_2)
              L39_2 = sysio
              L39_2 = L39_2.GetFileLastWriteTime
              L40_2 = L36_2
              L39_2 = L39_2(L40_2)
              L40_2 = table
              L40_2 = L40_2.insert
              L41_2 = L9_2.FolderEnumeration
              L41_2 = L41_2[L15_2]
              L41_2 = L41_2.Files
              L42_2 = {}
              L42_2.Name = L37_2
              L42_2.Size = L38_2
              L42_2.LastModified = L39_2
              L40_2(L41_2, L42_2)
            end
            if L18_2 then
              L38_2 = L8_2
              L39_2 = MpCommon
              L39_2 = L39_2.AtomicCounterAddNamespaced
              L40_2 = A3_2
              L41_2 = A2_2
              L42_2 = 1
              L39_2 = L39_2(L40_2, L41_2, L42_2)
              if L38_2 <= L39_2 then
                L40_2 = L9_2.FolderEnumeration
                L40_2 = L40_2[L15_2]
                L40_2.ExceededMaxScanCounter = true
                break
              else
                L40_2 = AppendToRollingQueueNamespaced
                L41_2 = "hmdprecisionpulsefullfilepathscan"
                L42_2 = A2_2
                L43_2 = string
                L43_2 = L43_2.lower
                L44_2 = L36_2
                L43_2 = L43_2(L44_2)
                L44_2 = 1
                L45_2 = L6_2
                L46_2 = 500
                L47_2 = 1
                L40_2(L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
                L40_2 = mp
                L40_2 = L40_2.TriggerScanResource
                L41_2 = "file"
                L42_2 = string
                L42_2 = L42_2.lower
                L43_2 = L36_2
                L42_2 = L42_2(L43_2)
                L43_2 = 0
                L40_2(L41_2, L42_2, L43_2)
              end
            end
          end
        end
        L32_2 = table
        L32_2 = L32_2.insert
        L33_2 = L9_2.Processed
        L34_2 = {}
        L34_2.enumeratefolder = L15_2
        L32_2(L33_2, L34_2)
        L32_2 = sysio
        L32_2 = L32_2.IsFolderExists
        L33_2 = L15_2
        L32_2 = L32_2(L33_2)
        if L32_2 then
          L33_2 = L9_2.FolderEnumeration
          L33_2 = L33_2[L15_2]
          L33_2.Exists = true
          L33_2 = L9_2.FolderEnumeration
          L33_2 = L33_2[L15_2]
          L34_2 = sysio
          L34_2 = L34_2.IsPathAVExcluded
          L35_2 = L15_2
          L36_2 = true
          L34_2 = L34_2(L35_2, L36_2)
          L33_2.Excluded = L34_2
        else
          L33_2 = L9_2.FolderEnumeration
          L33_2 = L33_2[L15_2]
          L33_2.Exists = false
        end
        if L19_2 == false then
          L33_2 = table
          L33_2 = L33_2.insert
          L34_2 = L9_2.FolderEnumeration
          L34_2 = L34_2[L15_2]
          L35_2 = {}
          L35_2.Files = L30_2
          L33_2(L34_2, L35_2)
        end
        if L31_2 ~= nil then
          L33_2 = pairs
          L34_2 = L31_2
          L33_2, L34_2, L35_2 = L33_2(L34_2)
          for L36_2, L37_2 in L33_2, L34_2, L35_2 do
            L38_2 = string
            L38_2 = L38_2.sub
            L39_2 = L37_2
            L40_2 = L29_2
            L38_2 = L38_2(L39_2, L40_2)
            L39_2 = table
            L39_2 = L39_2.insert
            L40_2 = L9_2.FolderEnumeration
            L40_2 = L40_2[L15_2]
            L40_2 = L40_2.Subfolders
            L41_2 = L38_2
            L39_2(L40_2, L41_2)
          end
        end
        L33_2 = AppendToRollingQueueNamespaced
        L34_2 = "hmdprecisionpulseenumeratefolder"
        L35_2 = A2_2
        L36_2 = L15_2
        L37_2 = 1
        L38_2 = L6_2
        L39_2 = 500
        L40_2 = 1
        L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2)
      end
    end
  end
  L15_2 = L12_2.enumerateregistrykey
  if L15_2 then
    L15_2 = ""
    L16_2 = L12_2.enumerateregistrykey
    L17_2 = split
    L18_2 = L16_2
    L19_2 = ","
    L17_2 = L17_2(L18_2, L19_2)
    L18_2 = ipairs
    L19_2 = L17_2
    L18_2, L19_2, L20_2 = L18_2(L19_2)
    for L21_2, L22_2 in L18_2, L19_2, L20_2 do
      L23_2 = string
      L23_2 = L23_2.lower
      L24_2 = MpCommon
      L24_2 = L24_2.Base64Decode
      L25_2 = L22_2
      L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L24_2(L25_2)
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      L15_2 = L23_2
      if L15_2 ~= nil then
        L24_2 = sysio
        L24_2 = L24_2.RegOpenKey
        L25_2 = L15_2
        L24_2 = L24_2(L25_2)
        L25_2 = L9_2.RegkeyEnumeration
        L26_2 = {}
        L25_2[L15_2] = L26_2
        L25_2 = L9_2.RegkeyEnumeration
        L25_2 = L25_2[L15_2]
        L26_2 = {}
        L25_2.Keys = L26_2
        L25_2 = L9_2.RegkeyEnumeration
        L25_2 = L25_2[L15_2]
        L26_2 = {}
        L25_2.Values = L26_2
        L25_2 = sysio
        L25_2 = L25_2.RegEnumKeys
        L26_2 = L24_2
        L25_2 = L25_2(L26_2)
        L26_2 = sysio
        L26_2 = L26_2.RegEnumValues
        L27_2 = L24_2
        L26_2 = L26_2(L27_2)
        if L25_2 ~= nil then
          L27_2 = table
          L27_2 = L27_2.insert
          L28_2 = L9_2.RegkeyEnumeration
          L28_2 = L28_2[L15_2]
          L28_2 = L28_2.Keys
          L29_2 = L25_2
          L27_2(L28_2, L29_2)
          if L26_2 ~= nil then
            L27_2 = pairs
            L28_2 = L26_2
            L27_2, L28_2, L29_2 = L27_2(L28_2)
            for L30_2, L31_2 in L27_2, L28_2, L29_2 do
              L32_2 = sysio
              L32_2 = L32_2.GetRegValueType
              L33_2 = L24_2
              L34_2 = L31_2
              L32_2 = L32_2(L33_2, L34_2)
              L33_2 = nil
              if L32_2 == 1 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsString
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (REG_SZ)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              elseif L32_2 == 2 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsString
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (REG_EXPAND_SZ)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              elseif L32_2 == 3 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsBinary
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (REG_BINARY)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              elseif L32_2 == 4 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsDword
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (REG_DWORD)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              elseif L32_2 == 7 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsMultiString
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = ipairs
                L35_2 = L33_2
                L34_2, L35_2, L36_2 = L34_2(L35_2)
                for L37_2, L38_2 in L34_2, L35_2, L36_2 do
                  L39_2 = table
                  L39_2 = L39_2.insert
                  L40_2 = L9_2.RegkeyEnumeration
                  L40_2 = L40_2[L15_2]
                  L40_2 = L40_2.Values
                  L40_2 = L40_2[L31_2]
                  L41_2 = L38_2
                  L42_2 = " (REG_MULTI_SZ)"
                  L41_2 = L41_2 .. L42_2
                  L39_2(L40_2, L41_2)
                end
              elseif L32_2 == 11 then
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsQword
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (REG_QWORD)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              else
                L34_2 = sysio
                L34_2 = L34_2.GetRegValueAsString
                L35_2 = L24_2
                L36_2 = L31_2
                L34_2 = L34_2(L35_2, L36_2)
                L33_2 = L34_2 or L33_2
                if not L34_2 then
                  L33_2 = "Value not set"
                end
                L34_2 = L9_2.RegkeyEnumeration
                L34_2 = L34_2[L15_2]
                L34_2 = L34_2.Values
                L35_2 = {}
                L34_2[L31_2] = L35_2
                L34_2 = table
                L34_2 = L34_2.insert
                L35_2 = L9_2.RegkeyEnumeration
                L35_2 = L35_2[L15_2]
                L35_2 = L35_2.Values
                L35_2 = L35_2[L31_2]
                L36_2 = L33_2
                L37_2 = " (UNKNOWN TYPE)"
                L36_2 = L36_2 .. L37_2
                L34_2(L35_2, L36_2)
              end
            end
          end
        end
        L27_2 = table
        L27_2 = L27_2.insert
        L28_2 = L9_2.Processed
        L29_2 = {}
        L29_2.enumerateregistrykey = L15_2
        L27_2(L28_2, L29_2)
      end
    end
  end
  L15_2 = L12_2.deleteregistryvalue
  if L15_2 then
    L15_2 = ""
    L16_2 = L12_2.deleteregistryvalue
    L17_2 = split
    L18_2 = L16_2
    L19_2 = ","
    L17_2 = L17_2(L18_2, L19_2)
    L18_2 = ipairs
    L19_2 = L17_2
    L18_2, L19_2, L20_2 = L18_2(L19_2)
    for L21_2, L22_2 in L18_2, L19_2, L20_2 do
      L23_2 = string
      L23_2 = L23_2.lower
      L24_2 = MpCommon
      L24_2 = L24_2.Base64Decode
      L25_2 = L22_2
      L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L24_2(L25_2)
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
      if L15_2 ~= nil then
        L24_2 = explode
        L25_2 = L23_2
        L26_2 = "|"
        L24_2 = L24_2(L25_2, L26_2)
        L15_2 = L24_2
        L24_2 = #L15_2
        if L24_2 == 2 then
          L24_2 = L15_2[1]
          L25_2 = L15_2[2]
          L26_2 = L9_2.DeleteRegValue
          L27_2 = {}
          L26_2[L24_2] = L27_2
          L26_2 = sysio
          L26_2 = L26_2.RegOpenKey
          L27_2 = L24_2
          L26_2 = L26_2(L27_2)
          if L26_2 ~= nil then
            L27_2 = mp
            L27_2 = L27_2.set_mpattribute
            L28_2 = "/EnablePrecPulseScanner"
            L27_2(L28_2)
            L27_2 = string
            L27_2 = L27_2.format
            L28_2 = "%s\\\\%s"
            L29_2 = L24_2
            L30_2 = L25_2
            L27_2 = L27_2(L28_2, L29_2, L30_2)
            L28_2 = AppendToRollingQueueNamespaced
            L29_2 = "hmdprecisionpulseregkeyscan"
            L30_2 = A2_2
            L31_2 = L27_2
            L32_2 = 1
            L33_2 = L6_2
            L34_2 = 500
            L35_2 = 1
            L28_2(L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
            L28_2 = pcall
            L29_2 = MpCommon
            L29_2 = L29_2.RollingQueueQueryKeyNamespaced
            L30_2 = "hmdprecisionpulseregkeyscan"
            L31_2 = A2_2
            L32_2 = L27_2
            L28_2, L29_2 = L28_2(L29_2, L30_2, L31_2, L32_2)
            L30_2 = mp
            L30_2 = L30_2.TriggerScanResource
            L31_2 = "regkey"
            L32_2 = L24_2
            L30_2(L31_2, L32_2)
            L30_2 = AppendToRollingQueueNamespaced
            L31_2 = "hmdprecisionpulseregkeyvaluescan"
            L32_2 = A2_2
            L33_2 = L27_2
            L34_2 = 1
            L35_2 = L6_2
            L36_2 = 500
            L37_2 = 1
            L30_2(L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
            L30_2 = pcall
            L31_2 = MpCommon
            L31_2 = L31_2.RollingQueueQueryKeyNamespaced
            L32_2 = "hmdprecisionpulseregkeyvaluescan"
            L33_2 = A2_2
            L34_2 = L27_2
            L30_2, L31_2 = L30_2(L31_2, L32_2, L33_2, L34_2)
            L32_2 = mp
            L32_2 = L32_2.TriggerScanResource
            L33_2 = "regkeyvalue"
            L34_2 = L27_2
            L32_2(L33_2, L34_2)
          else
            L27_2 = L9_2.DeleteRegValue
            L27_2[L24_2] = "Key not present"
          end
          L27_2 = table
          L27_2 = L27_2.insert
          L28_2 = L9_2.Processed
          L29_2 = {}
          L30_2 = L24_2
          L31_2 = " "
          L32_2 = L25_2
          L30_2 = L30_2 .. L31_2 .. L32_2
          L29_2.deleteregistryvalue = L30_2
          L27_2(L28_2, L29_2)
        end
      end
    end
  end
  L15_2 = L12_2.process
  if L15_2 then
    L15_2 = mp
    L15_2 = L15_2.get_contextdata
    L16_2 = mp
    L16_2 = L16_2.CONTEXT_DATA_PROCESS_PPID
    L15_2 = L15_2(L16_2)
    if L15_2 == nil then
      L16_2 = MpCommon
      L16_2 = L16_2.ExpandEnvironmentVariables
      L17_2 = "%windir%"
      L16_2 = L16_2(L17_2)
      L17_2 = L16_2
      L18_2 = "\\system32\\"
      L17_2 = L17_2 .. L18_2
      L18_2 = sysio
      L18_2 = L18_2.GetProcessFromFileName
      L19_2 = L17_2
      L20_2 = "svchost.exe"
      L19_2 = L19_2 .. L20_2
      L18_2 = L18_2(L19_2)
      L19_2 = #L18_2
      if 0 < L19_2 then
        L19_2 = string
        L19_2 = L19_2.format
        L20_2 = "pid:%d,ProcessStart:%u"
        L21_2 = L18_2[1]
        L21_2 = L21_2.pid
        L22_2 = L18_2[1]
        L22_2 = L22_2.starttime
        L19_2 = L19_2(L20_2, L21_2, L22_2)
        L15_2 = L19_2
      end
    end
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L9_2.Processed
    L18_2 = {}
    L19_2 = L12_2.process
    L18_2.process = L19_2
    L16_2(L17_2, L18_2)
    L16_2 = MpCommon
    L16_2 = L16_2.BmTriggerSig
    L17_2 = L15_2
    L18_2 = "Heimdall_ProcessDispatch"
    L19_2 = L12_2.process
    L16_2(L17_2, L18_2, L19_2)
  end
  L15_2 = L12_2.firewall
  if L15_2 then
    L15_2 = L12_2.firewall
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = MpCommon
      L22_2 = L22_2.Base64Decode
      L23_2 = L21_2
      L22_2 = L22_2(L23_2)
      if L22_2 then
        L23_2 = table
        L23_2 = L23_2.insert
        L24_2 = L9_2.Processed
        L25_2 = {}
        L25_2.firewall = L22_2
        L23_2(L24_2, L25_2)
        L23_2 = explode
        L24_2 = L22_2
        L25_2 = "_"
        L23_2 = L23_2(L24_2, L25_2)
        L22_2 = L23_2
        L23_2 = #L22_2
        if L23_2 == 3 then
          L23_2 = tonumber
          L24_2 = L22_2[2]
          L23_2 = L23_2(L24_2)
          L24_2 = MpCommon
          L24_2 = L24_2.AddBlockingFirewallRule
          L25_2 = L22_2[1]
          L26_2 = L22_2[3]
          L27_2 = mp
          L27_2 = L27_2.bitand
          L28_2 = L23_2
          L29_2 = 2
          L27_2 = L27_2(L28_2, L29_2)
          L27_2 = L27_2 == 2
          L28_2 = mp
          L28_2 = L28_2.bitand
          L29_2 = L23_2
          L30_2 = 1
          L28_2 = L28_2(L29_2, L30_2)
          L28_2 = L28_2 == 1
          L24_2(L25_2, L26_2, L27_2, L28_2)
        end
      end
    end
  end
  L15_2 = L12_2.sinkholedns
  if L15_2 then
    L15_2 = L12_2.sinkholedns
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = MpCommon
      L22_2 = L22_2.Base64Decode
      L23_2 = L21_2
      L22_2 = L22_2(L23_2)
      L23_2 = table
      L23_2 = L23_2.insert
      L24_2 = L9_2.Processed
      L25_2 = {}
      L25_2.sinkholeDNS_data = L22_2
      L23_2(L24_2, L25_2)
      if L22_2 then
        L23_2 = explode
        L24_2 = L22_2
        L25_2 = "_"
        L23_2 = L23_2(L24_2, L25_2)
        L22_2 = L23_2
        L23_2 = MpCommon
        L23_2 = L23_2.AddDnsBlockListDomain
        L24_2 = L22_2[1]
        L25_2 = L22_2[2]
        L23_2, L24_2 = L23_2(L24_2, L25_2)
        L25_2 = "sinkholedns"
        L26_2 = "_"
        L27_2 = L22_2[1]
        L28_2 = "_"
        L29_2 = L22_2[2]
        L25_2 = L25_2 .. L26_2 .. L27_2 .. L28_2 .. L29_2
        L26_2 = {}
        L26_2.res = L23_2
        L26_2.isAllowed = L24_2
        L9_2[L25_2] = L26_2
      end
    end
  end
  L15_2 = L12_2.dnscache
  if L15_2 then
    L15_2 = L12_2.dnscache
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = ipairs
    L18_2 = L16_2
    L17_2, L18_2, L19_2 = L17_2(L18_2)
    for L20_2, L21_2 in L17_2, L18_2, L19_2 do
      L22_2 = MpCommon
      L22_2 = L22_2.Base64Decode
      L23_2 = L21_2
      L22_2 = L22_2(L23_2)
      L23_2 = table
      L23_2 = L23_2.insert
      L24_2 = L9_2.Processed
      L25_2 = {}
      L25_2.dnscache = L22_2
      L23_2(L24_2, L25_2)
      if L22_2 then
        L23_2 = explode
        L24_2 = L22_2
        L25_2 = "_"
        L23_2 = L23_2(L24_2, L25_2)
        L22_2 = L23_2
        L23_2 = {}
        L24_2 = ipairs
        L25_2 = L22_2
        L24_2, L25_2, L26_2 = L24_2(L25_2)
        for L27_2, L28_2 in L24_2, L25_2, L26_2 do
          L29_2 = mp
          L29_2 = L29_2.GetDnsCacheRecordsByType
          L30_2 = L28_2
          L29_2 = L29_2(L30_2)
          L23_2[L28_2] = L29_2
          L29_2 = "dnscache"
          L30_2 = "_"
          L31_2 = L28_2
          L29_2 = L29_2 .. L30_2 .. L31_2
          L9_2[L29_2] = L23_2
        end
      end
    end
  end
  L15_2 = L12_2.debug
  if L15_2 then
    L15_2 = L12_2.debug
    L16_2 = split
    L17_2 = L15_2
    L18_2 = ","
    L16_2 = L16_2(L17_2, L18_2)
    L17_2 = {}
    L18_2 = ipairs
    L19_2 = L16_2
    L18_2, L19_2, L20_2 = L18_2(L19_2)
    for L21_2, L22_2 in L18_2, L19_2, L20_2 do
      L23_2 = MpCommon
      L23_2 = L23_2.Base64Decode
      L24_2 = L22_2
      L23_2 = L23_2(L24_2)
      L24_2 = table
      L24_2 = L24_2.insert
      L25_2 = L9_2.Processed
      L26_2 = {}
      L26_2.debug = L23_2
      L24_2(L25_2, L26_2)
      L24_2 = split
      L25_2 = L23_2
      L26_2 = "_"
      L24_2 = L24_2(L25_2, L26_2)
      L25_2 = nil
      L26_2 = nil
      L27_2 = ipairs
      L28_2 = L24_2
      L27_2, L28_2, L29_2 = L27_2(L28_2)
      for L30_2, L31_2 in L27_2, L28_2, L29_2 do
        L32_2 = split
        L33_2 = L31_2
        L34_2 = ":"
        L32_2 = L32_2(L33_2, L34_2)
        L31_2 = L32_2
        L25_2 = L31_2[1]
        L26_2 = L31_2[2]
        if L25_2 == "PC" then
          L32_2 = L25_2
          L33_2 = ":"
          L34_2 = L26_2
          L32_2 = L32_2 .. L33_2 .. L34_2
          L33_2 = table_pack
          L34_2 = pcall
          L35_2 = MpCommon
          L35_2 = L35_2.GetPersistContext
          L36_2 = L26_2
          L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L34_2(L35_2, L36_2)
          L33_2 = L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          L17_2[L32_2] = L33_2
        elseif L25_2 == "PCNP" then
          L32_2 = L25_2
          L33_2 = ":"
          L34_2 = L26_2
          L32_2 = L32_2 .. L33_2 .. L34_2
          L33_2 = table_pack
          L34_2 = pcall
          L35_2 = MpCommon
          L35_2 = L35_2.GetPersistContextNoPath
          L36_2 = L26_2
          L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L34_2(L35_2, L36_2)
          L33_2 = L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          L17_2[L32_2] = L33_2
        elseif L25_2 == "RQ" then
          L32_2 = L25_2
          L33_2 = ":"
          L34_2 = L26_2
          L32_2 = L32_2 .. L33_2 .. L34_2
          L33_2 = table_pack
          L34_2 = pcall
          L35_2 = MpCommon
          L35_2 = L35_2.RollingQueueQuery
          L36_2 = L26_2
          L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L34_2(L35_2, L36_2)
          L33_2 = L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          L17_2[L32_2] = L33_2
        elseif L25_2 == "AC" then
          L32_2 = L25_2
          L33_2 = ":"
          L34_2 = L26_2
          L32_2 = L32_2 .. L33_2 .. L34_2
          L33_2 = table_pack
          L34_2 = pcall
          L35_2 = MpCommon
          L35_2 = L35_2.AtomicCounterValueEx
          L36_2 = L26_2
          L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L34_2(L35_2, L36_2)
          L33_2 = L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          L17_2[L32_2] = L33_2
        end
      end
    end
    L9_2.debug = L17_2
  end
  L15_2 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  L16_2 = {}
  L16_2[1] = L15_2
  L17_2 = safeJsonSerialize
  L18_2 = L9_2
  L19_2 = 260
  L17_2 = L17_2(L18_2, L19_2)
  L10_2.report = L17_2
  L10_2.TAG = "NOLOOKUP"
  L17_2 = pcall
  L18_2 = mp
  L18_2 = L18_2.GetUrlReputation
  L19_2 = L16_2
  L20_2 = L10_2
  L17_2(L18_2, L19_2, L20_2)
end

EnablePrecisionPulse = L0_1
