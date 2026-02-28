local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1
L0_1 = mp
L0_1 = L0_1.GetResmgrBasePlugin
L0_1 = L0_1()
if L0_1 ~= "Regkeyvalue" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "Appomaly_ChildProcName"
L3_1 = "Appomaly_ChildProcPriv"
L4_1 = "Appomaly_ParentProcName"
L5_1 = "Appomaly_ChildProcDir"
L6_1 = "Appomaly_ChildProcName_Server"
L7_1 = "Appomaly_LoadedDlls_VersionInfo"
L8_1 = "Appomaly_ChildProcName_CmdLine"
L9_1 = "Appomaly_Global_CmdLine"
L10_1 = "Appomaly_ChildProcName_CmdLine_Base64"
L11_1 = "Appomaly_File_Directory"
L12_1 = "Appomaly_File_Name"
L13_1 = "Appomaly_File_Extension"
L14_1 = "Appomaly_Network_HOST_Global"
L15_1 = "Appomaly_Network_HOST"
L16_1 = "Appomaly_Network_UserAgent"
L17_1 = "Appomaly_LoadedDlls_Path"
L18_1 = "ShellCodeFileName"
L19_1 = "Svchost_ChildProcs"
L20_1 = "powtrack"
L21_1 = "Svchost_ChildProcs"
L22_1 = "ImphashTableNew"
L23_1 = "ImphashTableNewBloom"
L24_1 = "AnomalyTencode2"
L25_1 = "AnomalyTencode7"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L1_1[20] = L21_1
L1_1[21] = L22_1
L1_1[22] = L23_1
L1_1[23] = L24_1
L1_1[24] = L25_1
L2_1 = 0
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = MpCommon
  L8_1 = L8_1.AnomalyTableLookup
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L9_1 = L8_1.TableAge
    L9_1 = L9_1 / 1440
    L9_1 = L9_1 * 60
    L8_1.TableAgeDays = L9_1
    L8_1.TableName = L7_1
    L9_1 = set_research_data
    L10_1 = L7_1
    L11_1 = MpCommon
    L11_1 = L11_1.Base64Encode
    L12_1 = safeJsonSerialize
    L13_1 = L8_1
    L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1 = L12_1(L13_1)
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1)
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L2_1 = L2_1 + 1
  end
end
L3_1 = set_research_data
L4_1 = "Tables_Count"
L5_1 = L2_1
L6_1 = false
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
