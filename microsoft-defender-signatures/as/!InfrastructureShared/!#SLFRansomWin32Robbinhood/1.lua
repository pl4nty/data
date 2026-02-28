local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
L1_1 = L1_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILE_AGE
L0_1 = L0_1(L1_1)
if L0_1 == nil or L0_1 ~= nil and 3600 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 ~= "services.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSDEVICEPATH
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1)
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "\\windows\\system32\\"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
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
L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L3_1
L6_1 = -26
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == "\\windows\\temp\\winlogon.exe" then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
else
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = MpCommon
  L6_1 = L6_1.PathToWin32Path
  L7_1 = mp
  L7_1 = L7_1.get_contextdata
  L8_1 = mp
  L8_1 = L8_1.CONTEXT_DATA_FILEPATH
  L7_1, L8_1 = L7_1(L8_1)
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  L6_1 = "\\windows\\temp\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.ReportLowfi
  L5_1 = L3_1
  L6_1 = 3621311303
  L4_1(L5_1, L6_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
