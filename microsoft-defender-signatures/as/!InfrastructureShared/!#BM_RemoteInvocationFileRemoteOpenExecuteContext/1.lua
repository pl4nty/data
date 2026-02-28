local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if not L0_1 then
  L0_1 = ""
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = ""
end
if L0_1 == "" or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.Base64Encode
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = GetRollingQueueKeyValue
L4_1 = "rq_fileremotedrop"
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = "|psexesvc.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|winrshost.exe|wsmprovhost.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|services.exe|explorer.exe|svchost.exe|"
L5_1 = checkParentProcessNameFromListByPPIDRecursive
L6_1 = L1_1
L7_1 = L4_1
L8_1 = 5
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if not L5_1 or not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.QuerySessionInformation
L9_1 = L1_1
L10_1 = MpCommon
L10_1 = L10_1.WTSIsRemoteSession
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
if not L7_1 or not L8_1 then
  L8_1 = "FALSE"
end
L9_1 = L6_1
L10_1 = "|isRemote="
L11_1 = tostring
L12_1 = L8_1
L11_1 = L11_1(L12_1)
L9_1 = L9_1 .. L10_1 .. L11_1
L10_1 = pcall
L11_1 = MpCommon
L11_1 = L11_1.QuerySessionInformation
L12_1 = L1_1
L13_1 = MpCommon
L13_1 = L13_1.WTSDomainName
L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
L12_1 = pcall
L13_1 = MpCommon
L13_1 = L13_1.QuerySessionInformation
L14_1 = L1_1
L15_1 = MpCommon
L15_1 = L15_1.WTSUserName
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
L14_1 = pcall
L15_1 = MpCommon
L15_1 = L15_1.QuerySessionInformation
L16_1 = L1_1
L17_1 = MpCommon
L17_1 = L17_1.WTSClientAddress
L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
if L10_1 and L11_1 and L11_1 ~= "" then
  L16_1 = L9_1
  L17_1 = "|"
  L18_1 = crypto
  L18_1 = L18_1.Sha1Buffer
  L19_1 = L11_1
  L20_1 = 0
  L21_1 = #L11_1
  L18_1 = L18_1(L19_1, L20_1, L21_1)
  L9_1 = L16_1 .. L17_1 .. L18_1
else
  L16_1 = L9_1
  L17_1 = "|NO_DOMAIN"
  L9_1 = L16_1 .. L17_1
end
if L12_1 and L13_1 and L13_1 ~= "" then
  L16_1 = L9_1
  L17_1 = "|"
  L18_1 = crypto
  L18_1 = L18_1.Sha1Buffer
  L19_1 = L13_1
  L20_1 = 0
  L21_1 = #L13_1
  L18_1 = L18_1(L19_1, L20_1, L21_1)
  L9_1 = L16_1 .. L17_1 .. L18_1
else
  L16_1 = L9_1
  L17_1 = "|NO_USER"
  L9_1 = L16_1 .. L17_1
end
if L14_1 and L15_1 then
  L16_1 = type
  L17_1 = L15_1
  L16_1 = L16_1(L17_1)
  if L16_1 == "table" then
    L16_1 = L9_1
    L17_1 = "|"
    L18_1 = tostring
    L19_1 = L15_1.Address
    L18_1 = L18_1(L19_1)
    L9_1 = L16_1 .. L17_1 .. L18_1
end
else
  L16_1 = L9_1
  L17_1 = "|"
  L18_1 = tostring
  L19_1 = L15_1
  L18_1 = L18_1(L19_1)
  L9_1 = L16_1 .. L17_1 .. L18_1
end
L16_1 = mp
L16_1 = L16_1.set_mpattribute
L17_1 = string
L17_1 = L17_1.format
L18_1 = "MpInternal_researchdata=FileRemoteDropContext=%s"
L19_1 = L3_1
L17_1, L18_1, L19_1, L20_1, L21_1 = L17_1(L18_1, L19_1)
L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
L16_1 = mp
L16_1 = L16_1.set_mpattribute
L17_1 = string
L17_1 = L17_1.format
L18_1 = "MpInternal_researchdata=FileRemoteOpenExecuteContext=%s"
L19_1 = L9_1
L17_1, L18_1, L19_1, L20_1, L21_1 = L17_1(L18_1, L19_1)
L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
L16_1 = mp
L16_1 = L16_1.INFECTED
return L16_1
