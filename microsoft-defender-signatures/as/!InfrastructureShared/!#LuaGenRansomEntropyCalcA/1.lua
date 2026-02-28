local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Lua:EntropyCalculated"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_PPID
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
if L1_1 == nil or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L3_1 == nil or 16777216 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L1_1
L5_1 = "\\"
L6_1 = L2_1
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = GetFileEntropy
L7_1 = L5_1
L8_1 = L3_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= nil then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:EntropyCalculated"
  L7_1(L8_1)
  if 6 < L6_1 then
    L7_1 = mp
    L7_1 = L7_1.get_mpattribute
    L8_1 = "BM_UNKNOWN_FILE"
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = MpCommon
      L7_1 = L7_1.BmTriggerSig
      L8_1 = L0_1
      L9_1 = "FileEntropy"
      L10_1 = string
      L10_1 = L10_1.format
      L11_1 = "filepath:%s;entropy:%s;filetype:unknown"
      L12_1 = L5_1
      L13_1 = tostring
      L14_1 = L6_1
      L13_1, L14_1 = L13_1(L14_1)
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
    else
      L7_1 = MpCommon
      L7_1 = L7_1.BmTriggerSig
      L8_1 = L0_1
      L9_1 = "FileEntropy"
      L10_1 = string
      L10_1 = L10_1.format
      L11_1 = "filepath:%s;entropy:%s"
      L12_1 = L5_1
      L13_1 = tostring
      L14_1 = L6_1
      L13_1, L14_1 = L13_1(L14_1)
      L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
    end
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
