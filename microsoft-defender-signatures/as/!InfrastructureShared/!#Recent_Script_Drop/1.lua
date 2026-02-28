local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
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
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1 or L0_1
if not L1_1 then
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
L2_1 = {}
L2_1.ProcessId = L1_1
L3_1 = MpCommon
L3_1 = L3_1.GetImagePathFromPid
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L2_1.Process_Img = L3_1
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = ""
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if 0 < L4_1 then
    L4_1 = {}
    L5_1 = ipairs
    L6_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = MpCommon
      L10_1 = L10_1.StringRegExpSearch
      L11_1 = "(alf:|slf:|tel:|detection:|scpt:DefenderReg)"
      L12_1 = string
      L12_1 = L12_1.lower
      L13_1 = L9_1
      L12_1, L13_1, L14_1 = L12_1(L13_1)
      L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      if L10_1 then
        L12_1 = #L4_1
        if L12_1 < 15 then
          L12_1 = table
          L12_1 = L12_1.insert
          L13_1 = L4_1
          L14_1 = L9_1
          L12_1(L13_1, L14_1)
        end
      end
    end
    L5_1 = #L4_1
    if 0 < L5_1 then
      L5_1 = table_dedup
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      L4_1 = L5_1
      L5_1 = "["
      L6_1 = table
      L6_1 = L6_1.concat
      L7_1 = L4_1
      L8_1 = "|"
      L6_1 = L6_1(L7_1, L8_1)
      L7_1 = "]"
      L5_1 = L5_1 .. L6_1 .. L7_1
      L2_1.FileAttributes = L5_1
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "RecentScriptDropWithAttrib"
      L5_1(L6_1)
    end
  end
end
L4_1 = mp
L4_1 = L4_1.GetScanSource
L4_1 = L4_1()
if not L4_1 then
  L4_1 = nil
end
L2_1.scan_reason = L4_1
L4_1 = mp
L4_1 = L4_1.IOAVGetDownloadUrl
L4_1 = L4_1()
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.GetMOTWHostUrl
  L4_1 = L4_1()
end
L2_1.URL = L4_1
L4_1 = safeJsonSerialize
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = ""
end
L5_1 = AppendToRollingQueue
L6_1 = "RQ_RecentScriptDropped"
L7_1 = L0_1
L8_1 = L4_1
L9_1 = 31104000
L10_1 = 1000
L11_1 = 1
L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
