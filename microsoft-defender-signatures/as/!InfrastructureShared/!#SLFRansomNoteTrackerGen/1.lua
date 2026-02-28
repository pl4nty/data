local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 == "" then
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
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FNAME
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_PATH
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L3_1(L4_1, L5_1)
L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L2_1 == nil or L2_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.sub
L6_1 = 1
L7_1 = 8
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 == "\\device\\" then
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
end
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if L4_1 < 256 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "RansomNoteTracker"
L6_1 = 3600
L7_1 = 100
L8_1 = "|"
L9_1 = L1_1
L10_1 = L8_1
L11_1 = L0_1
L12_1 = L8_1
L13_1 = L3_1
L14_1 = L8_1
L15_1 = L4_1
L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1 .. L14_1 .. L15_1
L10_1 = GetRollingQueueKeyValues
L11_1 = L5_1
L12_1 = L9_1
L10_1 = L10_1(L11_1, L12_1)
if L10_1 then
  L11_1 = ipairs
  L12_1 = L10_1
  L11_1, L12_1, L13_1 = L11_1(L12_1)
  for L14_1, L15_1 in L11_1, L12_1, L13_1 do
    if L15_1 then
      L16_1 = L15_1.value
      if L16_1 == L2_1 then
        L16_1 = mp
        L16_1 = L16_1.CLEAN
        return L16_1
      end
    end
  end
  L11_1 = AppendToRollingQueue
  L12_1 = L5_1
  L13_1 = L9_1
  L14_1 = L2_1
  L15_1 = L6_1
  L16_1 = L7_1
  L17_1 = 0
  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
  L11_1 = #L10_1
  if L11_1 == 5 then
    L11_1 = MpCommon
    L11_1 = L11_1.BmTriggerSig
    L12_1 = L1_1
    L13_1 = "BM_GenRansomNoteTrackerGenC"
    L14_1 = safeJsonSerialize
    L15_1 = L10_1
    L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1)
    L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    L11_1 = mp
    L11_1 = L11_1.set_mpattribute
    L12_1 = "Lua:RansomNoteTracker.Gen"
    L11_1(L12_1)
    L11_1 = extractRansomNote
    L12_1 = L2_1
    L13_1 = "\\"
    L14_1 = L3_1
    L12_1 = L12_1 .. L13_1 .. L14_1
    L11_1(L12_1)
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
else
  L11_1 = AppendToRollingQueue
  L12_1 = L5_1
  L13_1 = L9_1
  L14_1 = L2_1
  L15_1 = L6_1
  L16_1 = L7_1
  L17_1 = 0
  L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
