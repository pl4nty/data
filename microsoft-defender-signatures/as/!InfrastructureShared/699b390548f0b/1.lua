-- Threat: !InfrastructureShared
-- Name: 699b390548f0b
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.command_line) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
local l_0_4 = {
  "\\desiredstateconfiguration\\",
  "\\dsc\\",
  "azureautomation",
  "\\monitoringagent\\",
  "\\microsoftmonitoringagent\\",
  "\\azuremonitoragent\\",
  "\\ccmexec\\",
  "\\ccm\\scriptstore\\",
  "\\intunemanagementextension\\",
  "\\windowsazure\\",
  "\\packages\\plugins\\microsoft.compute.customscriptextension\\",
  "\\sysprep\\",
  "\\setup\\scripts\\",
  "\\panther\\"
}
for l_0_5, l_0_6 in ipairs(l_0_4) do
  if string.find(l_0_1, l_0_6, 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_3, l_0_6, 1, true) then
    return mp.CLEAN
  end
end
local l_0_7 = ""
local l_0_9 = string.find(l_0_3, "\\sc.exe", 1, true) ~= nil
local l_0_11 = string.find(l_0_3, "\\net.exe", 1, true) ~= nil or string.find(l_0_3, "\\net1.exe", 1, true) ~= nil
local l_0_13 = string.find(l_0_1, "winrm", 1, true) ~= nil
if this_sigattrlog[23] ~= nil and this_sigattrlog[23].matched then
  l_0_7 = "winrm_service_start_regvalue"
elseif l_0_13 and (string.find(l_0_1, "start-service", 1, true) or string.find(l_0_1, "restart-service", 1, true) or l_0_9 and string.find(l_0_1, " start", 1, true) or l_0_11 and string.find(l_0_1, " start", 1, true)) then
  l_0_7 = "winrm_service_start"
elseif l_0_13 and (string.find(l_0_1, "set-service", 1, true) or l_0_9 and string.find(l_0_1, " config", 1, true)) and (string.find(l_0_1, "auto", 1, true) or string.find(l_0_1, "demand", 1, true) or string.find(l_0_1, "manual", 1, true)) then
  l_0_7 = "winrm_service_starttype"
elseif string.find(l_0_1, "localaccounttokenfilterpolicy", 1, true) then
  if string.find(l_0_1, "-value 1", 1, true) or string.find(l_0_1, "-value '1'", 1, true) or string.find(l_0_1, "-value \"1\"", 1, true) or string.find(l_0_1, "-propertytype dword", 1, true) or not string.find(l_0_1, "-value 0", 1, true) then
    l_0_7 = "localaccounttokenfilterpolicy_enable"
  end
elseif string.find(l_0_1, "trustedhosts", 1, true) then
  if string.find(l_0_1, "\"*\"", 1, true) or string.find(l_0_1, "'*'", 1, true) or string.find(l_0_1, "-value *", 1, true) or string.find(l_0_1, "-value '*'", 1, true) or string.find(l_0_1, "-value \"*\"", 1, true) then
    l_0_7 = "trustedhosts_wildcard"
  else
    l_0_7 = "trustedhosts_modify"
  end
elseif string.find(l_0_1, "enable-psremoting", 1, true) then
  if string.find(l_0_1, "-force", 1, true) then
    l_0_7 = "psremoting_force"
  else
    l_0_7 = "psremoting_enable"
  end
elseif string.find(l_0_1, "enable-wsmancredssp", 1, true) and string.find(l_0_1, "server", 1, true) then
  l_0_7 = "credssp_server_enable"
elseif string.find(l_0_1, "allowunencrypted", 1, true) and (string.find(l_0_1, "true", 1, true) or string.find(l_0_1, "$true", 1, true)) then
  l_0_7 = "unencrypted_allow"
elseif string.find(l_0_1, "service\\auth\\basic", 1, true) and (string.find(l_0_1, "true", 1, true) or string.find(l_0_1, "$true", 1, true)) then
  l_0_7 = "basic_auth_enable"
elseif string.find(l_0_1, "quickconfig", 1, true) then
  l_0_7 = "winrm_quickconfig"
elseif string.find(l_0_1, "create", 1, true) and string.find(l_0_1, "listener", 1, true) and string.find(l_0_1, "winrm/config/listener", 1, true) then
  l_0_7 = "winrm_listener_create"
end
if isnull(l_0_7) then
  return mp.CLEAN
end
WinRMSessionTrackProcess("BM", nil, "Listener")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
bm.add_related_string("WinRMSrvEn_reason", l_0_7, bm.RelatedStringBMReport)
bm.add_related_string("WinRMSrvEn_cmd", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMServerEnable")
add_parents()
return mp.INFECTED
