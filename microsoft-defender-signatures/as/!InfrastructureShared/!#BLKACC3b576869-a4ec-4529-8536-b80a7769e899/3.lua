local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "3b576869-a4ec-4529-8536-b80a7769e899"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if not L0_1 or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = {}
L2_1["explorer.exe"] = true
L2_1["unzip.exe"] = true
L2_1["rar.exe"] = true
L2_1["winrar.exe"] = true
L2_1["winzip.exe"] = true
L2_1["winzip32.exe"] = true
L2_1["winzip64.exe"] = true
L2_1["7z.exe"] = true
L2_1["7zfm.exe"] = true
L2_1["7zg.exe"] = true
L2_1["irsetup.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 ~= true then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L3_1 = L4_1
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L3_1
L6_1 = "DroppedByOfficeProc"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.GetProcessCommandLine
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 == "" or L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = string
L6_1 = L6_1.find
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L5_1
L7_1 = L7_1(L8_1)
L8_1 = L3_1
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L1_1
L7_1 = "+"
L8_1 = L4_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = MpCommon
L7_1 = L7_1.GetPersistContextCountNoPath
L8_1 = "BlockOfficeCreateExecContentProcs"
L7_1 = L7_1(L8_1)
if L7_1 == 0 then
  L7_1 = {}
  L8_1 = table
  L8_1 = L8_1.insert
  L9_1 = L7_1
  L10_1 = L6_1
  L8_1(L9_1, L10_1)
  L8_1 = MpCommon
  L8_1 = L8_1.SetPersistContextNoPath
  L9_1 = "BlockOfficeCreateExecContentProcs"
  L10_1 = L7_1
  L11_1 = 0
  L8_1(L9_1, L10_1, L11_1)
else
  L7_1 = MpCommon
  L7_1 = L7_1.QueryPersistContextNoPath
  L8_1 = "BlockOfficeCreateExecContentProcs"
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if not L7_1 then
    L7_1 = MpCommon
    L7_1 = L7_1.AppendPersistContextNoPath
    L8_1 = "BlockOfficeCreateExecContentProcs"
    L9_1 = L6_1
    L10_1 = 0
    L7_1(L8_1, L9_1, L10_1)
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
