local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_98
  end
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\windows\\temp\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
L3_1 = {}
L4_1 = {}
L5_1 = "powershell.exe"
L6_1 = "\\programdata\\microsoft\\windows defender advanced threat protection\\"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "powershell.exe"
L7_1 = "\\program files\\windows defender advanced threat protection\\"
L5_1[1] = L6_1
L5_1[2] = L7_1
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = checkParentCmdlineCaseInsensitive
L5_1 = L2_1
L6_1 = L3_1
L7_1 = 5
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = "senseir.exe"
L5_1 = checkParentProcessNameFromListByPPIDRecursive
L6_1 = L2_1
L7_1 = L4_1
L8_1 = 5
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 and L6_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
::lbl_98::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
