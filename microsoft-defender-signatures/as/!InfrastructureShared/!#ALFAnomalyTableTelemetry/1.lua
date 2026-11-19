-- Threat: !InfrastructureShared
-- Name: !#ALF:AnomalyTableTelemetry
-- Type: 24
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: /AnomalyTableTelemetry

if mp.GetResmgrBasePlugin() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  "Appomaly_ChildProcName",
  "Appomaly_ChildProcPriv",
  "Appomaly_ParentProcName",
  "Appomaly_ChildProcDir",
  "Appomaly_ChildProcName_Server",
  "Appomaly_LoadedDlls_VersionInfo",
  "Appomaly_ChildProcName_CmdLine",
  "Appomaly_Global_CmdLine",
  "Appomaly_ChildProcName_CmdLine_Base64",
  "Appomaly_File_Directory",
  "Appomaly_File_Name",
  "Appomaly_File_Extension",
  "Appomaly_Network_HOST_Global",
  "Appomaly_Network_HOST",
  "Appomaly_Network_UserAgent",
  "Appomaly_LoadedDlls_Path",
  "ShellCodeFileName",
  "Svchost_ChildProcs",
  "powtrack",
  "Svchost_ChildProcs",
  "ImphashTableNew",
  "ImphashTableNewBloom",
  "AnomalyTencode2",
  "AnomalyTencode7",
  "NewAnomaly_RMM",
  "ImphashTableHVA"
}
local l_0_2 = 0
for l_0_3, l_0_4 in ipairs(l_0_1) do
  local l_0_5 = MpCommon.AnomalyTableLookup(l_0_4)
  if l_0_5 then
    l_0_5.TableAgeDays = l_0_5.TableAge / 1440
    l_0_5.TableName = l_0_4
    set_research_data(l_0_4, MpCommon.Base64Encode(safeJsonSerialize(l_0_5)), false)
    l_0_2 = l_0_2 + 1
  end
end
set_research_data("Tables_Count", l_0_2, false)
return mp.INFECTED
